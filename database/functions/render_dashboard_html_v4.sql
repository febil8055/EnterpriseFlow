-- ============================================================
-- EnterpriseFlow - Dashboard renderer, v4
--
-- Replaces v3 (backed up as render_dashboard_html_v3_backup_20260816.sql).
--
-- What changed and why:
--
-- 1. INFORMATION, NOT INVENTORY. v3 led with seven big-number cards
--    for entity counts (Organizations 4, Locations 5, ...). Those are
--    inventory, not signal - they never change and they never tell you
--    to do anything. v4 leads with what is actually wrong right now
--    (overdue / blocked / unassigned / due-soon), then portfolio
--    health per project, then who is carrying the load. The raw entity
--    counts survive as a compact footprint strip at the bottom, where
--    reference data belongs.
--
-- 2. PROJECT + PEOPLE VIEWS. v3 had no per-project and no per-person
--    view at all, despite this being a project management workspace.
--    Those are the two sections a delivery lead actually reads.
--
-- 3. ONE THEME SYSTEM. v3 hard-coded light colors then re-stated a
--    partial set of them in a html[data-theme="dark"] override block,
--    so dark mode drifted. v4 defines every color once as a custom
--    property on .ef and overrides only the token values for dark -
--    one block, no drift, nothing left behind.
--
-- 4. AI INSIGHT IS CACHED. v3 called APEX_AI.GENERATE on every render,
--    and the region auto-refreshes on a timer - an LLM round trip a
--    minute, forever, per open tab, each one re-wording the same
--    sentence (visibly: the insight text changed between two
--    consecutive renders). v4 fingerprints the metrics that feed the
--    prompt and reuses the cached sentence from an APEX collection
--    until either the fingerprint or the 15-minute TTL says otherwise.
--    A deterministic rule-based sentence backs it up, so the card is
--    never empty and never blocks on the model.
--
-- 5. ACTIVITY THAT READS. v3 rendered "Task #19 created - FEBIL". v4
--    resolves record_id back to the row's actual name, so it reads
--    "Write integration tests - created". Same query cost, real
--    information.
--
-- 6. ESCAPING. v3 interpolated status_name, priority_name and
--    department_name straight into HTML. Those are admin-editable, so
--    they are stored XSS. Everything from the database now goes
--    through APEX_ESCAPE.HTML.
--
-- 7. CLOB BUILDING. v3 did l_html := l_html || ... a few hundred
--    times, which reallocates the LOB on every step. v4 buffers into a
--    VARCHAR2(32767) and flushes with DBMS_LOB.WRITEAPPEND.
--
-- Trend badges ("+N this week") only render when N is less than the
-- total, i.e. when there was actually a "before" to compare against.
-- Right now every row in this workspace was created in the same week,
-- so "+18" on a headcount of 18 was pure noise.
--
-- Entrance animations run on first paint only. The region replaces its
-- own innerHTML on the refresh timer, which would otherwise re-run
-- every animation on the whole page once a minute.
-- ============================================================

CREATE OR REPLACE FUNCTION "RENDER_DASHBOARD_HTML" RETURN CLOB IS

  --------------------------------------------------------------------
  -- Output
  --------------------------------------------------------------------
  l_html CLOB;
  l_buf  VARCHAR2(32767);

  --------------------------------------------------------------------
  -- Reference counts (footprint strip)
  --------------------------------------------------------------------
  l_orgs      NUMBER; l_depts NUMBER; l_roles NUMBER; l_users NUMBER;
  l_emps      NUMBER; l_clients NUMBER; l_locs NUMBER;
  l_org_new   NUMBER; l_dept_new NUMBER; l_emp_new NUMBER;
  l_proj_new  NUMBER; l_task_new NUMBER;

  --------------------------------------------------------------------
  -- Work metrics
  --------------------------------------------------------------------
  l_projects       NUMBER; l_projects_done NUMBER; l_projects_active NUMBER;
  l_tasks          NUMBER; l_tasks_done NUMBER; l_tasks_open NUMBER;
  l_blocked        NUMBER; l_overdue NUMBER; l_due_soon NUMBER; l_unassigned NUMBER;
  l_task_pct       NUMBER; l_proj_pct NUMBER;

  --------------------------------------------------------------------
  -- Health score
  --------------------------------------------------------------------
  l_health       NUMBER;
  l_health_label VARCHAR2(30);
  l_health_c1    VARCHAR2(10);
  l_health_c2    VARCHAR2(10);
  l_ring_off     NUMBER;
  -- 2 * pi * 52 = 326.73, rounded to an integer so the SVG attribute
  -- never depends on the session's decimal separator.
  c_circ CONSTANT PLS_INTEGER := 327;

  --------------------------------------------------------------------
  -- Insight
  --------------------------------------------------------------------
  l_greeting     VARCHAR2(40);
  l_hr           NUMBER := TO_NUMBER(TO_CHAR(SYSDATE,'HH24'));
  l_rule_insight VARCHAR2(400);
  l_insight      VARCHAR2(400);
  l_insight_src  VARCHAR2(10) := 'RULE';
  l_fingerprint  VARCHAR2(200);
  c_coll CONSTANT VARCHAR2(30) := 'EF_DASH_INSIGHT';

  --------------------------------------------------------------------
  -- Deterministic "fix this next" target
  --------------------------------------------------------------------
  l_next_task_id   NUMBER;
  l_next_task_name VARCHAR2(200);
  l_next_label     VARCHAR2(40);

  l_worst_overdue_name VARCHAR2(200);
  l_worst_overdue_days NUMBER;
  l_first_blocked_name VARCHAR2(200);

  l_max_open NUMBER := 0;   -- busiest person, for workload bar scaling

  --------------------------------------------------------------------
  -- Buffered append. Repeated CLOB concatenation reallocates the LOB
  -- every time; this keeps it in a VARCHAR2 and writes in ~30KB blocks.
  --------------------------------------------------------------------
  PROCEDURE p(p_s IN VARCHAR2) IS
  BEGIN
    IF p_s IS NULL THEN
      RETURN;
    END IF;
    IF NVL(LENGTH(l_buf),0) + LENGTH(p_s) > 30000 AND l_buf IS NOT NULL THEN
      DBMS_LOB.WRITEAPPEND(l_html, LENGTH(l_buf), l_buf);
      l_buf := NULL;
    END IF;
    IF LENGTH(p_s) > 30000 THEN
      DBMS_LOB.WRITEAPPEND(l_html, LENGTH(p_s), p_s);
    ELSE
      l_buf := l_buf || p_s;
    END IF;
  END p;

  FUNCTION esc(p_s IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN APEX_ESCAPE.HTML(p_s);
  END esc;

  FUNCTION plural(p_n IN NUMBER, p_one IN VARCHAR2, p_many IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN CASE WHEN p_n = 1 THEN p_one ELSE p_many END;
  END plural;

  FUNCTION pct(p_part IN NUMBER, p_whole IN NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN CASE WHEN NVL(p_whole,0) = 0 THEN 0 ELSE ROUND(p_part / p_whole * 100) END;
  END pct;

  -- Fractional numbers headed for CSS or SVG attributes. Default
  -- TO_CHAR follows NLS_NUMERIC_CHARACTERS, so a session with a comma
  -- decimal separator would emit width:33,33% and silently collapse
  -- the bar. Pin the separator.
  FUNCTION num(p_n IN NUMBER) RETURN VARCHAR2 IS
  BEGIN
    RETURN TRIM(TO_CHAR(p_n, 'FM99999990.00', 'NLS_NUMERIC_CHARACTERS=''.,'''));
  END num;

  -- Relative timestamp for the activity feed.
  FUNCTION ago(p_ts IN TIMESTAMP) RETURN VARCHAR2 IS
    l_min NUMBER;
  BEGIN
    l_min := (CAST(SYSTIMESTAMP AS DATE) - CAST(p_ts AS DATE)) * 1440;
    RETURN CASE
             WHEN l_min < 1     THEN 'just now'
             WHEN l_min < 60    THEN ROUND(l_min)||'m ago'
             WHEN l_min < 1440  THEN ROUND(l_min/60)||'h ago'
             WHEN l_min < 10080 THEN ROUND(l_min/1440)||'d ago'
             ELSE TO_CHAR(p_ts,'DD Mon')
           END;
  END ago;

  FUNCTION entity_color(p_table IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN
    RETURN CASE p_table
             WHEN 'ORGANIZATION' THEN '#0071e3'
             WHEN 'DEPARTMENT'   THEN '#34c759'
             WHEN 'EMPLOYEE'     THEN '#ff9500'
             WHEN 'PROJECT'      THEN '#00c7be'
             WHEN 'TASK'         THEN '#5856d6'
             ELSE '#8a94a6'
           END;
  END entity_color;

  -- Stable per-person avatar tint, so the same face keeps the same
  -- color between renders.
  FUNCTION avatar_color(p_id IN NUMBER) RETURN VARCHAR2 IS
  BEGIN
    RETURN CASE MOD(NVL(p_id,0), 6)
             WHEN 0 THEN '#0071e3'
             WHEN 1 THEN '#5856d6'
             WHEN 2 THEN '#00c7be'
             WHEN 3 THEN '#ff9500'
             WHEN 4 THEN '#af52de'
             ELSE        '#34c759'
           END;
  END avatar_color;

  --------------------------------------------------------------------
  -- Renders one composition bar: a single stacked track plus a legend.
  -- Takes a ref cursor of (label, count, color) so the three
  -- breakdowns below can share one renderer instead of three
  -- near-identical loops.
  --------------------------------------------------------------------
  PROCEDURE render_mix(p_title IN VARCHAR2, p_total IN NUMBER, p_cur IN OUT SYS_REFCURSOR) IS
    l_label VARCHAR2(200);
    l_cnt   NUMBER;
    l_color VARCHAR2(40);
    l_bar   VARCHAR2(16000);
    l_leg   VARCHAR2(16000);
  BEGIN
    LOOP
      FETCH p_cur INTO l_label, l_cnt, l_color;
      EXIT WHEN p_cur%NOTFOUND;

      IF l_cnt > 0 AND p_total > 0 THEN
        l_bar := l_bar || '<span class="ef-seg" style="width:'||num(ROUND(l_cnt / p_total * 100, 2))
                       || '%;background:'||l_color||';" title="'||esc(l_label)||': '||l_cnt||'"></span>';
      END IF;

      l_leg := l_leg || '<span class="ef-lg'||CASE WHEN l_cnt = 0 THEN ' is-zero' END||'">'
                     || '<i style="background:'||l_color||';" aria-hidden="true"></i>'
                     || esc(l_label)||' <b>'||l_cnt||'</b></span>';
    END LOOP;
    CLOSE p_cur;

    p('<div class="ef-mix"><div class="ef-mix-title">'||esc(p_title)||'</div>');
    IF p_total > 0 THEN
      p('<div class="ef-track">'||l_bar||'</div>');
    ELSE
      p('<div class="ef-track"><span class="ef-seg" style="width:100%;background:var(--track);"></span></div>');
    END IF;
    p('<div class="ef-legend">'||l_leg||'</div></div>');
  END render_mix;

BEGIN
  DBMS_LOB.CREATETEMPORARY(l_html, TRUE);

  --------------------------------------------------------------------
  -- METRICS
  --------------------------------------------------------------------
  SELECT COUNT(*) INTO l_orgs    FROM organization;
  SELECT COUNT(*) INTO l_depts   FROM department;
  SELECT COUNT(*) INTO l_roles   FROM role;
  SELECT COUNT(*) INTO l_users   FROM user_account;
  SELECT COUNT(*) INTO l_emps    FROM employee;
  SELECT COUNT(*) INTO l_clients FROM client;
  SELECT COUNT(*) INTO l_locs    FROM location;

  SELECT COUNT(*),
         COUNT(CASE WHEN s.status_code = 'COMPLETED' THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('COMPLETED','CANCELLED') THEN 1 END)
    INTO l_projects, l_projects_done, l_projects_active
    FROM project p
    JOIN status s ON s.status_id = p.status_id;

  SELECT COUNT(*),
         COUNT(CASE WHEN s.status_code = 'DONE' THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('DONE','CANCELLED') THEN 1 END),
         COUNT(CASE WHEN s.status_code = 'BLOCKED' THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('DONE','CANCELLED')
                     AND t.due_date IS NOT NULL
                     AND t.due_date < TRUNC(SYSDATE) THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('DONE','CANCELLED')
                     AND t.due_date IS NOT NULL
                     AND t.due_date >= TRUNC(SYSDATE)
                     AND t.due_date <= TRUNC(SYSDATE) + 7 THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('DONE','CANCELLED')
                     AND t.assigned_to_employee_id IS NULL THEN 1 END)
    INTO l_tasks, l_tasks_done, l_tasks_open, l_blocked, l_overdue, l_due_soon, l_unassigned
    FROM task t
    JOIN status s ON s.status_id = t.status_id;

  l_task_pct := pct(l_tasks_done, l_tasks);
  l_proj_pct := pct(l_projects_done, l_projects);

  -- Weekly inserts, for the footprint trend badges. Only the five
  -- tables that actually carry a TRG_<TABLE>_AU audit trigger.
  SELECT COUNT(CASE WHEN table_name = 'ORGANIZATION' THEN 1 END),
         COUNT(CASE WHEN table_name = 'DEPARTMENT'   THEN 1 END),
         COUNT(CASE WHEN table_name = 'EMPLOYEE'     THEN 1 END),
         COUNT(CASE WHEN table_name = 'PROJECT'      THEN 1 END),
         COUNT(CASE WHEN table_name = 'TASK'         THEN 1 END)
    INTO l_org_new, l_dept_new, l_emp_new, l_proj_new, l_task_new
    FROM audit_log
   WHERE action = 'INSERT'
     AND changed_at >= SYSDATE - 7;

  --------------------------------------------------------------------
  -- HEALTH SCORE
  --
  -- Proportional to open work, not absolute, so a workspace with four
  -- tasks and one blocker isn't scored the same as one with four
  -- hundred tasks and one blocker. Full marks when there is no open
  -- work to be unhealthy about.
  --------------------------------------------------------------------
  IF l_tasks_open = 0 THEN
    l_health := 100;
  ELSE
    l_health := GREATEST(0, ROUND(100
                  - (l_overdue    / l_tasks_open) * 45
                  - (l_blocked    / l_tasks_open) * 25
                  - (l_unassigned / l_tasks_open) * 15));
  END IF;

  IF    l_health >= 90 THEN l_health_label := 'Excellent'; l_health_c1 := '#6adf87'; l_health_c2 := '#34c759';
  ELSIF l_health >= 75 THEN l_health_label := 'Healthy';   l_health_c1 := '#42a5ff'; l_health_c2 := '#0071e3';
  ELSIF l_health >= 60 THEN l_health_label := 'Fair';      l_health_c1 := '#ffd166'; l_health_c2 := '#ff9500';
  ELSIF l_health >= 40 THEN l_health_label := 'At risk';   l_health_c1 := '#ffb84d'; l_health_c2 := '#ff6b35';
  ELSE                      l_health_label := 'Critical';  l_health_c1 := '#ff7a70'; l_health_c2 := '#ff3b30';
  END IF;

  l_ring_off := ROUND(c_circ * (1 - l_health / 100));

  --------------------------------------------------------------------
  -- WHAT TO FIX NEXT
  --
  -- Chosen here in SQL rather than parsed out of the model's sentence,
  -- so the button always points somewhere real no matter how the
  -- insight is phrased. Worst overdue first, then oldest blocker.
  --------------------------------------------------------------------
  BEGIN
    SELECT task_name, days_late INTO l_worst_overdue_name, l_worst_overdue_days
      FROM (SELECT t.task_name, TRUNC(SYSDATE) - TRUNC(t.due_date) days_late
              FROM task t
              JOIN status s ON s.status_id = t.status_id
             WHERE s.status_code NOT IN ('DONE','CANCELLED')
               AND t.due_date IS NOT NULL
               AND t.due_date < TRUNC(SYSDATE)
             ORDER BY t.due_date)
     WHERE ROWNUM = 1;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    l_worst_overdue_name := NULL;
  END;

  BEGIN
    SELECT task_name INTO l_first_blocked_name
      FROM (SELECT t.task_name
              FROM task t
              JOIN status s ON s.status_id = t.status_id
             WHERE s.status_code = 'BLOCKED'
             ORDER BY t.task_id)
     WHERE ROWNUM = 1;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    l_first_blocked_name := NULL;
  END;

  BEGIN
    SELECT task_id, task_name, lbl INTO l_next_task_id, l_next_task_name, l_next_label
      FROM (SELECT t.task_id, t.task_name,
                   CASE WHEN t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE)
                        THEN 'Resolve overdue task' ELSE 'Unblock task' END lbl,
                   CASE WHEN t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE) THEN 1 ELSE 2 END rnk
              FROM task t
              JOIN status s ON s.status_id = t.status_id
             WHERE s.status_code NOT IN ('DONE','CANCELLED')
               AND (s.status_code = 'BLOCKED'
                    OR (t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE)))
             ORDER BY rnk, NVL(t.due_date, DATE '9999-12-31'), t.task_id)
     WHERE ROWNUM = 1;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    l_next_task_id := NULL;
  END;

  --------------------------------------------------------------------
  -- INSIGHT SENTENCE
  --
  -- The rule-based sentence is computed unconditionally: it is the
  -- fallback, and it is also what gets shown while/if the model is
  -- unavailable. Cheap, precise, never wrong.
  --------------------------------------------------------------------
  l_greeting := CASE WHEN l_hr < 12 THEN 'Good morning.'
                     WHEN l_hr < 17 THEN 'Good afternoon.'
                     ELSE 'Good evening.' END;

  IF l_overdue > 0 THEN
    l_rule_insight := l_overdue||' '||plural(l_overdue,'task is','tasks are')||' past due'
                   || CASE WHEN l_worst_overdue_name IS NOT NULL
                           THEN ' - "'||l_worst_overdue_name||'" is '||l_worst_overdue_days||' '
                                ||plural(l_worst_overdue_days,'day','days')||' late' END||'.';
  ELSIF l_blocked > 0 THEN
    l_rule_insight := l_blocked||' '||plural(l_blocked,'task is','tasks are')||' blocked'
                   || CASE WHEN l_first_blocked_name IS NOT NULL
                           THEN ', starting with "'||l_first_blocked_name||'"' END||'.';
  ELSIF l_unassigned > 0 THEN
    l_rule_insight := l_unassigned||' open '||plural(l_unassigned,'task has','tasks have')||' no owner yet.';
  ELSIF l_due_soon > 0 THEN
    l_rule_insight := l_due_soon||' '||plural(l_due_soon,'task is','tasks are')||' due in the next seven days.';
  ELSIF l_tasks_open = 0 AND l_tasks > 0 THEN
    l_rule_insight := 'Everything is closed out - no open tasks across '||l_projects||' '
                   || plural(l_projects,'project','projects')||'.';
  ELSE
    l_rule_insight := l_projects_active||' active '||plural(l_projects_active,'project','projects')||' and '
                   || l_tasks_open||' open '||plural(l_tasks_open,'task','tasks')||', nothing flagged.';
  END IF;

  l_insight := l_rule_insight;

  --------------------------------------------------------------------
  -- AI INSIGHT, CACHED
  --
  -- Fingerprint covers every number fed to the prompt. Same numbers
  -- within the TTL means the model would only be re-wording an
  -- identical brief, so we reuse the sentence instead of paying for a
  -- round trip on every 60-second region refresh.
  --
  -- APEX_COLLECTION is session-scoped and needs no DDL. Outside an
  -- APEX session (SQL*Plus, a job) every call here throws and we fall
  -- through to the rule-based sentence, which is the correct
  -- degradation.
  --------------------------------------------------------------------
  l_fingerprint := l_projects||'.'||l_projects_active||'.'||l_projects_done||'.'
                || l_tasks||'.'||l_tasks_done||'.'||l_tasks_open||'.'
                || l_blocked||'.'||l_overdue||'.'||l_due_soon||'.'||l_unassigned||'.'||l_emps;

  DECLARE
    l_cached_fp   VARCHAR2(200);
    l_cached_txt  VARCHAR2(400);
    l_cached_at   DATE;
    l_fresh       BOOLEAN := FALSE;
    l_prompt      VARCHAR2(4000);
    l_raw         CLOB;
  BEGIN
    IF APEX_COLLECTION.COLLECTION_EXISTS(c_coll) THEN
      BEGIN
        SELECT c001, c002, d001
          INTO l_cached_fp, l_cached_txt, l_cached_at
          FROM apex_collections
         WHERE collection_name = c_coll
           AND seq_id = 1;

        IF l_cached_fp = l_fingerprint
           AND l_cached_txt IS NOT NULL
           AND l_cached_at > SYSDATE - INTERVAL '15' MINUTE THEN
          l_insight     := l_cached_txt;
          l_insight_src := 'AI';
          l_fresh       := TRUE;
        END IF;
      EXCEPTION WHEN NO_DATA_FOUND THEN
        l_fresh := FALSE;
      END;
    END IF;

    IF NOT l_fresh THEN
      l_prompt :=
        'Project management workspace right now: '
        ||l_projects||' projects ('||l_projects_active||' active, '||l_projects_done||' completed), '
        ||l_tasks||' tasks ('||l_tasks_done||' done, '||l_tasks_open||' open, '
        ||l_blocked||' blocked, '||l_overdue||' overdue, '||l_due_soon||' due within 7 days, '
        ||l_unassigned||' unassigned), '||l_emps||' employees.'
        ||CASE WHEN l_worst_overdue_name IS NOT NULL
               THEN ' Worst overdue task: "'||l_worst_overdue_name||'", '||l_worst_overdue_days||' days late.' END
        ||CASE WHEN l_first_blocked_name IS NOT NULL
               THEN ' A blocked task: "'||l_first_blocked_name||'".' END
        ||' Write exactly one sentence, max 20 words, naming the single most important thing to act on'
        ||' and why it matters. Be specific and use the real numbers. Plain text only:'
        ||' no markdown, no quotes, no greeting, no preamble.';

      l_raw := APEX_AI.GENERATE(
                 p_prompt        => l_prompt,
                 p_system_prompt => 'You are a sharp, concise delivery lead reading an operations dashboard.',
                 p_temperature   => 0.3);

      l_raw := TRIM(REPLACE(REPLACE(l_raw, CHR(10), ' '), CHR(13), ' '));

      IF l_raw IS NOT NULL AND LENGTH(l_raw) > 0 THEN
        l_insight     := SUBSTR(l_raw, 1, 300);
        l_insight_src := 'AI';

        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(c_coll);
        APEX_COLLECTION.ADD_MEMBER(
          p_collection_name => c_coll,
          p_c001            => l_fingerprint,
          p_c002            => l_insight,
          p_d001            => SYSDATE);
      END IF;
    END IF;
  EXCEPTION WHEN OTHERS THEN
    -- No APEX session, AI not configured, model timeout, collection
    -- quota - all the same outcome: keep the rule-based sentence.
    l_insight     := l_rule_insight;
    l_insight_src := 'RULE';
  END;

  --------------------------------------------------------------------
  -- STYLES
  --
  -- Every color is a token on .ef. Dark mode restates token values
  -- only - no component rule is duplicated per theme.
  --------------------------------------------------------------------
  p(q'~<style>
.ef{
  --bg:#f5f5f7; --card:#fff; --card-2:#fafbfc;
  --ink:#0b0f19; --ink-2:#475467; --muted:#8a94a6;
  --line:rgba(16,24,40,.07); --line-2:rgba(16,24,40,.13);
  --track:#eef1f5;
  --sh-1:0 1px 2px rgba(16,24,40,.04);
  --sh-2:0 1px 2px rgba(16,24,40,.04),0 10px 28px -14px rgba(16,24,40,.16);
  --sh-3:0 4px 10px rgba(16,24,40,.06),0 22px 40px -16px rgba(16,24,40,.20);
  --blue:#0071e3; --blue-2:#42a5ff; --green:#34c759; --green-2:#6adf87;
  --orange:#ff9500; --red:#ff3b30; --purple:#5856d6; --teal:#00c7be; --pink:#af52de;
  --ok-bg:#e7f7ee; --ok-fg:#12673f;
  --warn-bg:#fff4e5; --warn-fg:#9a5300;
  --crit-bg:#fdecea; --crit-fg:#b33026;
  --info-bg:#eaf2ff; --info-fg:#0060c0;
  --neu-bg:#f2f4f7; --neu-fg:#475467;
  font-family:-apple-system,BlinkMacSystemFont,"SF Pro Display","SF Pro Text","Segoe UI",Roboto,Helvetica,Arial,sans-serif;
  color:var(--ink);max-width:100%;margin:0 auto;
  -webkit-font-smoothing:antialiased;
}
html[data-theme="dark"] .ef{
  --bg:#000; --card:#1c1c1e; --card-2:#232326;
  --ink:#f5f5f7; --ink-2:#c7c7cc; --muted:#8e8e93;
  --line:rgba(255,255,255,.09); --line-2:rgba(255,255,255,.16);
  --track:#2c2c2e;
  --sh-1:0 1px 2px rgba(0,0,0,.4);
  --sh-2:0 1px 2px rgba(0,0,0,.4),0 10px 28px -14px rgba(0,0,0,.85);
  --sh-3:0 4px 10px rgba(0,0,0,.5),0 22px 40px -16px rgba(0,0,0,.9);
  --ok-bg:rgba(52,199,89,.16); --ok-fg:#4ade80;
  --warn-bg:rgba(255,149,0,.16); --warn-fg:#ffb84d;
  --crit-bg:rgba(255,59,48,.18); --crit-fg:#ff8a80;
  --info-bg:rgba(66,165,255,.16); --info-fg:#5eb1ff;
  --neu-bg:#2c2c2e; --neu-fg:#c7c7cc;
}

/* ---------- shared surfaces ---------- */
.ef-card{background:var(--card);border:1px solid var(--line);border-radius:18px;box-shadow:var(--sh-2);}
.ef-sec{padding:22px 24px;margin-bottom:16px;}
.ef-sec-head{display:flex;align-items:center;gap:10px;margin-bottom:18px;flex-wrap:wrap;}
.ef-sec-head h2{font-size:15.5px;font-weight:700;letter-spacing:-.01em;margin:0;color:var(--ink);}
.ef-sec-head .ef-sw{width:8px;height:8px;border-radius:3px;background:var(--c,var(--blue));flex:none;}
.ef-sec-head .ef-count{font-size:12px;font-weight:600;color:var(--muted);}
.ef-sec-head .ef-right{margin-left:auto;display:flex;align-items:center;gap:14px;}
.ef-link{font-size:12.5px;font-weight:600;color:var(--blue);text-decoration:none;white-space:nowrap;}
.ef-link:hover{text-decoration:underline;}
.ef-grid-2{display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-bottom:16px;}
.ef-empty{font-size:13px;color:var(--muted);padding:26px 0;text-align:center;}
.ef-empty b{display:block;color:var(--ink-2);font-size:14px;margin-bottom:3px;}

/* ---------- hero ---------- */
.ef-hero{position:relative;overflow:hidden;border-radius:26px;padding:30px 32px;margin-bottom:16px;
  background:radial-gradient(125% 145% at 0% 0%,#1b2c4d 0%,#0d1526 46%,#070b14 100%);
  border:1px solid rgba(255,255,255,.07);box-shadow:0 26px 60px -32px rgba(4,10,24,.85);}
.ef-hero::before{content:"";position:absolute;top:-150px;right:-70px;width:430px;height:430px;border-radius:50%;
  background:radial-gradient(circle,rgba(66,165,255,.30),rgba(66,165,255,0) 68%);pointer-events:none;}
.ef-hero::after{content:"";position:absolute;inset:0;pointer-events:none;
  background-image:linear-gradient(rgba(255,255,255,.045) 1px,transparent 1px),
                   linear-gradient(90deg,rgba(255,255,255,.045) 1px,transparent 1px);
  background-size:34px 34px;
  -webkit-mask-image:radial-gradient(72% 92% at 82% 8%,#000,transparent 70%);
          mask-image:radial-gradient(72% 92% at 82% 8%,#000,transparent 70%);}
.ef-hero-grid{position:relative;z-index:1;display:grid;grid-template-columns:minmax(0,1fr) auto;gap:30px;align-items:center;}
.ef-eyebrow{display:inline-flex;align-items:center;gap:6px;font-size:10.5px;font-weight:700;letter-spacing:.09em;
  text-transform:uppercase;color:#7dc4ff;margin-bottom:9px;}
.ef-eyebrow .dot{width:6px;height:6px;border-radius:50%;background:#42a5ff;box-shadow:0 0 9px 1px rgba(66,165,255,.75);}
.ef-hero h1{font-size:27px;font-weight:700;letter-spacing:-.025em;margin:0 0 7px;color:#f5f5f7;line-height:1.15;}
.ef-hero p{font-size:15px;line-height:1.55;color:#c6cfe0;margin:0;max-width:60ch;}
.ef-cta-row{display:flex;gap:10px;flex-wrap:wrap;margin-top:16px;}
.ef-cta{display:inline-flex;align-items:center;gap:7px;font-size:13.5px;font-weight:600;text-decoration:none;
  padding:10px 16px;border-radius:11px;background:#fff;color:#0b0f19;
  box-shadow:0 2px 10px rgba(0,0,0,.22);transition:transform .15s ease,box-shadow .15s ease;}
.ef-cta:hover{transform:translateY(-2px);box-shadow:0 10px 22px -8px rgba(0,0,0,.45);}
.ef-cta--ghost{background:rgba(255,255,255,.09);color:#e6ecf7;border:1px solid rgba(255,255,255,.16);box-shadow:none;}
.ef-cta--ghost:hover{background:rgba(255,255,255,.15);}
.ef-pills{display:flex;gap:9px;flex-wrap:wrap;margin-top:18px;}
.ef-pill{font-size:12px;font-weight:600;color:#e5eaf5;background:rgba(255,255,255,.08);
  border:1px solid rgba(255,255,255,.14);padding:6px 12px;border-radius:999px;white-space:nowrap;}
.ef-pill.warn{background:rgba(255,69,58,.16);border-color:rgba(255,69,58,.36);color:#ffb4ae;}
.ef-pill.live{display:inline-flex;align-items:center;gap:7px;}
.ef-pill .pulse{width:7px;height:7px;border-radius:50%;background:#34c759;flex:none;animation:ef-pulse 2.4s infinite;}
@keyframes ef-pulse{0%{box-shadow:0 0 0 0 rgba(52,199,89,.6);}70%{box-shadow:0 0 0 8px rgba(52,199,89,0);}100%{box-shadow:0 0 0 0 rgba(52,199,89,0);}}

/* health ring */
.ef-health{display:flex;flex-direction:column;align-items:center;gap:9px;flex:none;}
.ef-ring{position:relative;width:124px;height:124px;}
.ef-ring svg{transform:rotate(-90deg);display:block;}
.ef-ring-bg{fill:none;stroke:rgba(255,255,255,.11);stroke-width:9;}
.ef-ring-fg{fill:none;stroke-width:9;stroke-linecap:round;}
.ef-ring-txt{position:absolute;inset:0;display:flex;flex-direction:column;align-items:center;justify-content:center;}
.ef-ring-txt b{font-size:31px;font-weight:700;color:#fff;letter-spacing:-.035em;line-height:1;}
.ef-ring-txt span{font-size:9.5px;font-weight:700;letter-spacing:.13em;text-transform:uppercase;color:rgba(255,255,255,.5);margin-top:5px;}
.ef-health-tag{font-size:12px;font-weight:700;padding:4px 13px;border-radius:999px;
  background:rgba(255,255,255,.10);border:1px solid rgba(255,255,255,.16);color:#fff;}

/* ---------- signal tiles ---------- */
.ef-signals{display:grid;grid-template-columns:repeat(auto-fit,minmax(215px,1fr));gap:14px;margin-bottom:16px;}
.ef-sig{position:relative;display:block;text-decoration:none;color:inherit;overflow:hidden;
  padding:17px 18px 16px 21px;transition:transform .18s ease,box-shadow .18s ease;}
.ef-sig::before{content:"";position:absolute;left:0;top:0;bottom:0;width:4px;background:var(--c);}
.ef-sig:hover{transform:translateY(-3px);box-shadow:var(--sh-3);}
.ef-sig-top{display:flex;align-items:center;gap:9px;margin-bottom:11px;}
/* color-mix tints a token by its own accent without a second token per
   shade. Engines without it fall back to the neutral chip fill above. */
.ef-sig-ico{width:29px;height:29px;border-radius:9px;display:flex;align-items:center;justify-content:center;flex:none;
  background:var(--neu-bg);color:var(--c);}
.ef-sig-ico{background:color-mix(in srgb,var(--c) 15%,transparent);}
.ef-sig-lbl{font-size:11.5px;font-weight:700;letter-spacing:.05em;text-transform:uppercase;color:var(--muted);}
.ef-sig-val{font-size:30px;font-weight:700;letter-spacing:-.035em;line-height:1;color:var(--ink);margin-bottom:5px;}
.ef-sig-sub{font-size:12.5px;color:var(--muted);font-weight:500;line-height:1.4;}
.ef-sig.is-clear{--c:var(--green);}
.ef-sig.is-clear .ef-sig-val{color:var(--muted);font-size:19px;letter-spacing:-.02em;padding-top:6px;}

/* ---------- project cards ---------- */
.ef-projects{display:grid;grid-template-columns:repeat(auto-fit,minmax(288px,1fr));gap:14px;}
.ef-proj{display:block;text-decoration:none;color:inherit;background:var(--card-2);border:1px solid var(--line);
  border-radius:14px;padding:15px 16px;transition:transform .18s ease,box-shadow .18s ease,border-color .18s ease;}
.ef-proj:hover{transform:translateY(-2px);box-shadow:var(--sh-2);border-color:var(--line-2);}
.ef-proj-top{display:flex;align-items:center;gap:8px;margin-bottom:4px;}
.ef-proj-name{font-size:14px;font-weight:700;letter-spacing:-.01em;color:var(--ink);
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;flex:1;min-width:0;}
.ef-proj-meta{font-size:11.5px;color:var(--muted);margin-bottom:12px;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.ef-proj-bar{display:flex;height:7px;border-radius:99px;overflow:hidden;background:var(--track);margin-bottom:9px;}
.ef-proj-foot{display:flex;align-items:center;gap:7px;flex-wrap:wrap;font-size:11.5px;color:var(--muted);font-weight:500;}
.ef-proj-pct{margin-left:auto;font-size:12.5px;font-weight:700;color:var(--ink);}

/* ---------- chips ---------- */
.ef-chip{font-size:10.5px;font-weight:700;padding:3px 9px;border-radius:999px;white-space:nowrap;flex:none;
  letter-spacing:.02em;background:var(--neu-bg);color:var(--neu-fg);}
.ef-chip.ok{background:var(--ok-bg);color:var(--ok-fg);}
.ef-chip.warn{background:var(--warn-bg);color:var(--warn-fg);}
.ef-chip.crit{background:var(--crit-bg);color:var(--crit-fg);}
.ef-chip.info{background:var(--info-bg);color:var(--info-fg);}
.ef-chip.tone{background:var(--neu-bg);color:var(--c);}
.ef-chip.tone{background:color-mix(in srgb,var(--c) 15%,transparent);}

/* ---------- mini rings ---------- */
.ef-mini{position:relative;width:46px;height:46px;border-radius:50%;flex:none;
  background:conic-gradient(var(--c) calc(var(--v)*1%),var(--track) 0);}
.ef-mini i{position:absolute;inset:5px;border-radius:50%;background:var(--card);display:flex;
  align-items:center;justify-content:center;font-style:normal;font-size:11px;font-weight:700;color:var(--ink);}
.ef-minis{display:flex;gap:16px;}
.ef-minis > div{display:flex;align-items:center;gap:9px;}
.ef-minis span{font-size:11.5px;font-weight:600;color:var(--muted);line-height:1.3;}

/* ---------- lists ---------- */
.ef-list{list-style:none;margin:0;padding:0;}
.ef-list li{display:flex;align-items:center;gap:12px;padding:11px 0;border-bottom:1px solid var(--line);}
.ef-list li:first-child{padding-top:0;}
.ef-list li:last-child{border-bottom:none;padding-bottom:0;}
.ef-body{flex:1;min-width:0;}
.ef-t1{font-size:13.5px;font-weight:600;color:var(--ink);white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.ef-t2{font-size:11.5px;color:var(--muted);margin-top:2px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
/* The whole row is the link. display:contents would be tidier but it
   drops the anchor out of the accessibility tree in some engines, so
   the anchor stays a real flex container instead. */
a.ef-row{display:flex;align-items:center;gap:12px;width:100%;min-width:0;
  text-decoration:none;color:inherit;}
a.ef-row:hover .ef-t1{color:var(--blue);}

/* date tile on deadlines */
.ef-date{width:42px;flex:none;text-align:center;border-radius:10px;padding:5px 0 6px;
  background:var(--neu-bg);}
.ef-date{background:color-mix(in srgb,var(--c) 13%,transparent);}
.ef-date b{display:block;font-size:15px;font-weight:700;line-height:1;color:var(--c);}
.ef-date span{display:block;font-size:9.5px;font-weight:700;letter-spacing:.06em;text-transform:uppercase;
  color:var(--c);opacity:.75;margin-top:2px;}

/* avatars */
.ef-av{width:32px;height:32px;border-radius:50%;flex:none;display:flex;align-items:center;justify-content:center;
  font-size:11.5px;font-weight:700;color:#fff;letter-spacing:-.02em;}
.ef-av.sm{width:22px;height:22px;font-size:9px;}
.ef-load{width:74px;flex:none;}
.ef-load-track{height:6px;border-radius:99px;background:var(--track);overflow:hidden;}
.ef-load-fill{height:100%;border-radius:99px;background:linear-gradient(90deg,var(--blue-2),var(--blue));}
.ef-load-txt{font-size:10.5px;color:var(--muted);font-weight:600;margin-top:4px;text-align:right;}

/* activity icon */
.ef-aico{width:30px;height:30px;border-radius:9px;display:flex;align-items:center;justify-content:center;flex:none;
  font-size:12px;font-weight:700;color:#fff;}

/* ---------- composition ---------- */
.ef-mix{margin-bottom:19px;}
.ef-mix:last-child{margin-bottom:0;}
.ef-mix-title{font-size:12px;font-weight:700;color:var(--ink-2);margin-bottom:8px;letter-spacing:-.005em;}
.ef-track{display:flex;height:9px;border-radius:99px;overflow:hidden;background:var(--track);}
.ef-seg{display:block;height:100%;}
.ef-seg + .ef-seg{box-shadow:inset 1.5px 0 0 var(--card);}
.ef-legend{display:flex;flex-wrap:wrap;gap:5px 14px;margin-top:9px;}
.ef-lg{display:inline-flex;align-items:center;gap:6px;font-size:11.5px;color:var(--muted);font-weight:500;}
.ef-lg i{width:8px;height:8px;border-radius:2.5px;flex:none;}
.ef-lg b{color:var(--ink);font-weight:700;}
.ef-lg.is-zero{opacity:.42;}

/* ---------- pulse ---------- */
.ef-pulse{display:flex;align-items:flex-end;gap:6px;height:58px;}
.ef-pulse-bar{flex:1;border-radius:4px 4px 2px 2px;min-height:3px;
  background:linear-gradient(180deg,var(--blue-2),var(--blue));}
.ef-pulse-bar.is-zero{background:var(--track);}
.ef-pulse-days{display:flex;gap:6px;margin-top:8px;}
.ef-pulse-days span{flex:1;text-align:center;font-size:9.5px;color:var(--muted);font-weight:600;
  white-space:nowrap;overflow:hidden;}

/* ---------- footprint ---------- */
.ef-foot{display:flex;flex-wrap:wrap;gap:9px;}
.ef-fchip{display:inline-flex;align-items:center;gap:8px;text-decoration:none;padding:9px 14px;border-radius:12px;
  background:var(--card);border:1px solid var(--line);box-shadow:var(--sh-1);
  transition:transform .15s ease,box-shadow .15s ease;}
.ef-fchip:hover{transform:translateY(-2px);box-shadow:var(--sh-2);}
.ef-fchip i{width:7px;height:7px;border-radius:2px;background:var(--c);flex:none;}
.ef-fchip span{font-size:12.5px;color:var(--muted);font-weight:500;}
.ef-fchip b{font-size:13.5px;color:var(--ink);font-weight:700;}
.ef-fchip em{font-style:normal;font-size:10px;font-weight:700;color:var(--ok-fg);background:var(--ok-bg);
  padding:1px 6px;border-radius:999px;}

/* ---------- responsive ---------- */
@media (max-width:900px){
  .ef-grid-2{grid-template-columns:1fr;}
  .ef-hero-grid{grid-template-columns:1fr;}
  .ef-health{flex-direction:row;justify-content:flex-start;gap:16px;}
}
@media (max-width:600px){
  .ef-hero{padding:24px 20px;}
  .ef-hero h1{font-size:23px;}
  .ef-sec{padding:18px 16px;}
}

/* First paint only - the region rewrites its own innerHTML on the
   refresh timer, and re-animating the whole page every minute is
   maddening to sit in front of. */
.ef-anim .ef-hero,
.ef-anim .ef-signals > *,
.ef-anim .ef-card{animation:ef-in .45s cubic-bezier(.22,1,.36,1) both;}
.ef-anim .ef-signals > *:nth-child(2){animation-delay:.05s;}
.ef-anim .ef-signals > *:nth-child(3){animation-delay:.1s;}
.ef-anim .ef-signals > *:nth-child(4){animation-delay:.15s;}
.ef-anim .ef-ring-fg{animation:ef-ring 1.05s cubic-bezier(.22,1,.36,1) both;}
@keyframes ef-in{from{opacity:0;transform:translateY(7px);}}
@keyframes ef-ring{from{stroke-dashoffset:327;}}
@media (prefers-reduced-motion:reduce){
  .ef *,.ef *::before,.ef *::after{animation:none !important;transition:none !important;}
}
</style>~');

  --------------------------------------------------------------------
  -- HERO
  --------------------------------------------------------------------
  p('<div class="ef">');
  p('<div class="ef-hero"><div class="ef-hero-grid"><div>');

  p('<div class="ef-eyebrow"><span class="dot" aria-hidden="true"></span>'
    ||CASE WHEN l_insight_src = 'AI' THEN 'AI Insight' ELSE 'Today' END||'</div>');
  p('<h1>'||l_greeting||'</h1>');
  p('<p>'||esc(l_insight)||'</p>');

  p('<div class="ef-cta-row">');
  IF l_next_task_id IS NOT NULL THEN
    p('<a class="ef-cta" href="'
      ||APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID', p_values => TO_CHAR(l_next_task_id))
      ||'">'||esc(l_next_label)||': '||esc(l_next_task_name)||' &rarr;</a>');
  ELSE
    p('<a class="ef-cta" href="'||APEX_PAGE.GET_URL(p_page => 42)||'">Review open tasks &rarr;</a>');
  END IF;
  p('<a class="ef-cta ef-cta--ghost" href="'||APEX_PAGE.GET_URL(p_page => 49)||'">Ask the assistant</a>');
  p('</div>');

  p('<div class="ef-pills">');
  p('<span class="ef-pill live" id="ef-updated-pill" data-ts="'
    ||TO_CHAR(SYSTIMESTAMP AT TIME ZONE 'UTC','YYYY-MM-DD"T"HH24:MI:SS"Z"')
    ||'"><span class="pulse" aria-hidden="true"></span><span id="ef-updated-text">Live</span></span>');
  p('<span class="ef-pill">'||TO_CHAR(SYSDATE,'Dy, DD Mon YYYY')||'</span>');
  p('<span class="ef-pill">'||l_projects_active||' active '||plural(l_projects_active,'project','projects')||'</span>');
  IF l_overdue > 0 THEN
    p('<span class="ef-pill warn">'||l_overdue||' overdue</span>');
  END IF;
  IF l_blocked > 0 THEN
    p('<span class="ef-pill warn">'||l_blocked||' blocked</span>');
  END IF;
  p('</div>');

  p('</div>');  -- hero left

  -- Health ring
  p('<div class="ef-health"><div class="ef-ring" role="img" aria-label="Delivery health score '
    ||l_health||' out of 100, '||LOWER(l_health_label)||'">');
  p('<svg viewBox="0 0 120 120" width="124" height="124" aria-hidden="true">'
    ||'<defs><linearGradient id="efHealthGrad" x1="0" y1="0" x2="1" y2="1">'
    ||'<stop offset="0%" stop-color="'||l_health_c1||'"/>'
    ||'<stop offset="100%" stop-color="'||l_health_c2||'"/></linearGradient></defs>'
    ||'<circle class="ef-ring-bg" cx="60" cy="60" r="52"/>'
    ||'<circle class="ef-ring-fg" cx="60" cy="60" r="52" stroke="url(#efHealthGrad)" '
    ||'stroke-dasharray="'||TO_CHAR(c_circ)||'" stroke-dashoffset="'||TO_CHAR(l_ring_off)||'"/></svg>');
  p('<div class="ef-ring-txt"><b>'||l_health||'</b><span>Health</span></div></div>');
  p('<div class="ef-health-tag">'||l_health_label||'</div></div>');

  p('</div></div>');  -- hero grid, hero

  --------------------------------------------------------------------
  -- SIGNAL TILES
  --
  -- The four questions worth answering before anything else. Each one
  -- has a genuine "all clear" state so an empty dashboard reads as
  -- healthy rather than broken.
  --------------------------------------------------------------------
  p('<div class="ef-signals">');

  -- Overdue
  p('<a class="ef-card ef-sig'||CASE WHEN l_overdue = 0 THEN ' is-clear' END
    ||'" style="--c:var(--red);" href="'||APEX_PAGE.GET_URL(p_page => 42)||'">');
  p('<div class="ef-sig-top"><div class="ef-sig-ico"><svg width="15" height="15" viewBox="0 0 24 24" fill="none" '
    ||'stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true">'
    ||'<circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg></div>'
    ||'<span class="ef-sig-lbl">Overdue</span></div>');
  IF l_overdue = 0 THEN
    p('<div class="ef-sig-val">All clear</div><div class="ef-sig-sub">Nothing past its due date</div>');
  ELSE
    p('<div class="ef-sig-val">'||l_overdue||'</div><div class="ef-sig-sub">'
      ||CASE WHEN l_worst_overdue_days IS NOT NULL
             THEN 'Worst is '||l_worst_overdue_days||' '||plural(l_worst_overdue_days,'day','days')||' late'
             ELSE plural(l_overdue,'task','tasks')||' past due' END||'</div>');
  END IF;
  p('</a>');

  -- Blocked
  p('<a class="ef-card ef-sig'||CASE WHEN l_blocked = 0 THEN ' is-clear' END
    ||'" style="--c:var(--orange);" href="'||APEX_PAGE.GET_URL(p_page => 42)||'">');
  p('<div class="ef-sig-top"><div class="ef-sig-ico"><svg width="15" height="15" viewBox="0 0 24 24" fill="none" '
    ||'stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true">'
    ||'<circle cx="12" cy="12" r="9"/><path d="M5.6 5.6l12.8 12.8"/></svg></div>'
    ||'<span class="ef-sig-lbl">Blocked</span></div>');
  IF l_blocked = 0 THEN
    p('<div class="ef-sig-val">All clear</div><div class="ef-sig-sub">Nothing is waiting on a blocker</div>');
  ELSE
    p('<div class="ef-sig-val">'||l_blocked||'</div><div class="ef-sig-sub">'
      ||CASE WHEN l_first_blocked_name IS NOT NULL
             THEN esc(SUBSTR(l_first_blocked_name,1,40))
             ELSE plural(l_blocked,'task','tasks')||' stalled' END||'</div>');
  END IF;
  p('</a>');

  -- Due soon
  p('<a class="ef-card ef-sig'||CASE WHEN l_due_soon = 0 THEN ' is-clear' END
    ||'" style="--c:var(--blue);" href="'||APEX_PAGE.GET_URL(p_page => 42)||'">');
  p('<div class="ef-sig-top"><div class="ef-sig-ico"><svg width="15" height="15" viewBox="0 0 24 24" fill="none" '
    ||'stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true">'
    ||'<rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 10h18M8 3v4M16 3v4"/></svg></div>'
    ||'<span class="ef-sig-lbl">Due in 7 days</span></div>');
  IF l_due_soon = 0 THEN
    p('<div class="ef-sig-val">Clear week</div><div class="ef-sig-sub">No deadlines in the next seven days</div>');
  ELSE
    p('<div class="ef-sig-val">'||l_due_soon||'</div><div class="ef-sig-sub">'
      ||plural(l_due_soon,'task lands','tasks land')||' this week</div>');
  END IF;
  p('</a>');

  -- Unassigned
  p('<a class="ef-card ef-sig'||CASE WHEN l_unassigned = 0 THEN ' is-clear' END
    ||'" style="--c:var(--purple);" href="'||APEX_PAGE.GET_URL(p_page => 42)||'">');
  p('<div class="ef-sig-top"><div class="ef-sig-ico"><svg width="15" height="15" viewBox="0 0 24 24" fill="none" '
    ||'stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true">'
    ||'<circle cx="10" cy="8" r="4"/><path d="M3 21v-2a5 5 0 0 1 5-5h4"/><path d="M18 14v6M15 17h6"/></svg></div>'
    ||'<span class="ef-sig-lbl">Unassigned</span></div>');
  IF l_unassigned = 0 THEN
    p('<div class="ef-sig-val">All owned</div><div class="ef-sig-sub">Every open task has someone on it</div>');
  ELSE
    p('<div class="ef-sig-val">'||l_unassigned||'</div><div class="ef-sig-sub">open '
      ||plural(l_unassigned,'task needs','tasks need')||' an owner</div>');
  END IF;
  p('</a>');

  p('</div>');  -- signals

  --------------------------------------------------------------------
  -- PORTFOLIO
  --
  -- The section v3 was missing entirely. Per project: how far along,
  -- what is on fire, who it is for. Progress is a stacked bar of
  -- done / in-progress / remaining rather than a single percentage,
  -- because "40% done with nothing in flight" and "40% done with the
  -- rest in progress" are very different situations.
  --------------------------------------------------------------------
  p('<div class="ef-card ef-sec">');
  p('<div class="ef-sec-head"><span class="ef-sw" style="--c:var(--teal);"></span>'
    ||'<h2>Portfolio</h2><span class="ef-count">'||l_projects_active||' active of '||l_projects||'</span>');
  p('<div class="ef-right"><div class="ef-minis">'
    ||'<div><div class="ef-mini" style="--c:var(--blue);--v:'||l_task_pct||';"><i>'||l_task_pct||'%</i></div>'
    ||'<span>Tasks done<br>'||l_tasks_done||' of '||l_tasks||'</span></div>'
    ||'<div><div class="ef-mini" style="--c:var(--teal);--v:'||l_proj_pct||';"><i>'||l_proj_pct||'%</i></div>'
    ||'<span>Projects done<br>'||l_projects_done||' of '||l_projects||'</span></div>'
    ||'</div><a class="ef-link" href="'||APEX_PAGE.GET_URL(p_page => 40)||'">All projects &rarr;</a></div></div>');

  p('<div class="ef-projects">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT pj.project_id, pj.project_code, pj.project_name, pj.end_date,
             s.status_code, s.status_name,
             c.client_name, o.organization_name,
             (SELECT COUNT(*) FROM task t WHERE t.project_id = pj.project_id) tot,
             (SELECT COUNT(*) FROM task t JOIN status ts ON ts.status_id = t.status_id
               WHERE t.project_id = pj.project_id AND ts.status_code = 'DONE') done,
             (SELECT COUNT(*) FROM task t JOIN status ts ON ts.status_id = t.status_id
               WHERE t.project_id = pj.project_id AND ts.status_code = 'IN_PROGRESS') inprog,
             (SELECT COUNT(*) FROM task t JOIN status ts ON ts.status_id = t.status_id
               WHERE t.project_id = pj.project_id AND ts.status_code = 'BLOCKED') blocked,
             (SELECT COUNT(*) FROM task t JOIN status ts ON ts.status_id = t.status_id
               WHERE t.project_id = pj.project_id
                 AND ts.status_code NOT IN ('DONE','CANCELLED')
                 AND t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE)) overdue
        FROM project pj
        JOIN status s ON s.status_id = pj.status_id
        LEFT JOIN client c ON c.client_id = pj.client_id
        LEFT JOIN organization o ON o.organization_id = pj.organization_id
       ORDER BY CASE s.status_code
                  WHEN 'IN_PROGRESS' THEN 1 WHEN 'OPEN' THEN 2 WHEN 'ON_HOLD' THEN 3
                  WHEN 'COMPLETED' THEN 4 ELSE 5 END,
                pj.project_name
       FETCH FIRST 9 ROWS ONLY
    ) LOOP
      l_any := TRUE;
      DECLARE
        l_c      VARCHAR2(30);
        l_done_c VARCHAR2(30);
        l_prog_c VARCHAR2(30);
        l_dpct   NUMBER := pct(r.done, r.tot);
        l_ipct   NUMBER := pct(r.inprog, r.tot);
        l_dead   BOOLEAN := (r.status_code = 'CANCELLED');
      BEGIN
        l_c := CASE r.status_code
                 WHEN 'IN_PROGRESS' THEN 'var(--teal)'
                 WHEN 'OPEN'        THEN 'var(--blue)'
                 WHEN 'ON_HOLD'     THEN 'var(--orange)'
                 WHEN 'COMPLETED'   THEN 'var(--green)'
                 ELSE 'var(--muted)'
               END;

        -- A cancelled project that happened to close its tasks is not a
        -- win. Green + 100% reads as one, so abandoned work goes grey.
        l_done_c := CASE WHEN l_dead THEN 'var(--muted)' ELSE 'var(--green)' END;
        l_prog_c := CASE WHEN l_dead THEN 'var(--muted)' ELSE 'var(--blue)' END;

        p('<a class="ef-proj" style="--c:'||l_c||';" href="'
          ||APEX_PAGE.GET_URL(p_page => 41, p_items => 'P41_PROJECT_ID', p_values => TO_CHAR(r.project_id))||'">');
        p('<div class="ef-proj-top"><span class="ef-proj-name">'||esc(r.project_name)||'</span>'
          ||'<span class="ef-chip tone" style="--c:'||l_c||';">'||esc(r.status_name)||'</span></div>');
        p('<div class="ef-proj-meta">'||esc(NVL(r.client_name,'Internal'))||' &middot; '
          ||esc(NVL(r.organization_name,'-'))
          ||CASE WHEN r.end_date IS NOT NULL THEN ' &middot; ends '||TO_CHAR(r.end_date,'DD Mon') END||'</div>');

        p('<div class="ef-proj-bar">');
        IF r.tot > 0 THEN
          IF l_dpct > 0 THEN
            p('<span class="ef-seg" style="width:'||l_dpct||'%;background:'||l_done_c||';" title="'
              ||r.done||' done"></span>');
          END IF;
          IF l_ipct > 0 THEN
            p('<span class="ef-seg" style="width:'||l_ipct||'%;background:'||l_prog_c||';" title="'
              ||r.inprog||' in progress"></span>');
          END IF;
        END IF;
        p('</div>');

        p('<div class="ef-proj-foot">');
        IF r.tot = 0 THEN
          p('<span>No tasks yet</span>');
        ELSE
          p('<span>'||r.done||'/'||r.tot||' done</span>');
        END IF;
        IF r.overdue > 0 THEN
          p('<span class="ef-chip crit">'||r.overdue||' overdue</span>');
        END IF;
        IF r.blocked > 0 THEN
          p('<span class="ef-chip warn">'||r.blocked||' blocked</span>');
        END IF;
        p('<span class="ef-proj-pct"'||CASE WHEN l_dead THEN ' style="color:var(--muted);"' END||'>'
          ||l_dpct||'%</span>');
        p('</div></a>');
      END;
    END LOOP;

    IF NOT l_any THEN
      p('<div class="ef-empty"><b>No projects yet</b>Create one to start tracking delivery.</div>');
    END IF;
  END;
  p('</div></div>');

  --------------------------------------------------------------------
  -- DEADLINES + WORKLOAD
  --------------------------------------------------------------------
  p('<div class="ef-grid-2">');

  -- Upcoming deadlines
  p('<div class="ef-card ef-sec" style="margin-bottom:0;">');
  p('<div class="ef-sec-head"><span class="ef-sw" style="--c:var(--red);"></span><h2>Deadlines</h2>'
    ||'<div class="ef-right"><a class="ef-link" href="'||APEX_PAGE.GET_URL(p_page => 42)
    ||'">All tasks &rarr;</a></div></div><ul class="ef-list">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT t.task_id, t.task_name, t.due_date, pj.project_name,
             pr.priority_code, pr.priority_name,
             e.first_name, e.last_name, e.employee_id,
             TRUNC(t.due_date) - TRUNC(SYSDATE) days_left
        FROM task t
        JOIN status s ON s.status_id = t.status_id
        LEFT JOIN project pj ON pj.project_id = t.project_id
        LEFT JOIN priority pr ON pr.priority_id = t.priority_id
        LEFT JOIN employee e ON e.employee_id = t.assigned_to_employee_id
       WHERE s.status_code NOT IN ('DONE','CANCELLED')
         AND t.due_date IS NOT NULL
       ORDER BY t.due_date
       FETCH FIRST 6 ROWS ONLY
    ) LOOP
      l_any := TRUE;
      DECLARE
        l_c   VARCHAR2(30);
        l_lbl VARCHAR2(40);
        l_cls VARCHAR2(10);
      BEGIN
        IF r.days_left < 0 THEN
          l_c := 'var(--red)';    l_cls := 'crit';
          l_lbl := ABS(r.days_left)||'d late';
        ELSIF r.days_left = 0 THEN
          l_c := 'var(--orange)'; l_cls := 'warn'; l_lbl := 'Today';
        ELSIF r.days_left <= 3 THEN
          l_c := 'var(--orange)'; l_cls := 'warn';
          l_lbl := CASE WHEN r.days_left = 1 THEN 'Tomorrow' ELSE r.days_left||' days' END;
        ELSE
          l_c := 'var(--blue)';   l_cls := ''; l_lbl := r.days_left||' days';
        END IF;

        p('<li><a class="ef-row" href="'
          ||APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID', p_values => TO_CHAR(r.task_id))||'">');
        p('<div class="ef-date" style="--c:'||l_c||';"><b>'||TO_CHAR(r.due_date,'DD')||'</b><span>'
          ||TO_CHAR(r.due_date,'Mon')||'</span></div>');
        p('<div class="ef-body"><div class="ef-t1">'||esc(r.task_name)||'</div><div class="ef-t2">'
          ||esc(NVL(r.project_name,'No project'))||' &middot; '||esc(NVL(r.priority_name,'-'))
          ||CASE WHEN r.first_name IS NOT NULL
                 THEN ' &middot; '||esc(r.first_name||' '||SUBSTR(r.last_name,1,1)||'.')
                 ELSE ' &middot; unassigned' END||'</div></div>');
        p('<span class="ef-chip '||l_cls||'">'||l_lbl||'</span>');
        p('</a></li>');
      END;
    END LOOP;
    IF NOT l_any THEN
      p('<div class="ef-empty"><b>Nothing scheduled</b>No open task carries a due date.</div>');
    END IF;
  END;
  p('</ul></div>');

  -- Team workload
  SELECT NVL(MAX(cnt),0) INTO l_max_open
    FROM (SELECT COUNT(*) cnt
            FROM task t
            JOIN status s ON s.status_id = t.status_id
           WHERE s.status_code NOT IN ('DONE','CANCELLED')
             AND t.assigned_to_employee_id IS NOT NULL
           GROUP BY t.assigned_to_employee_id);

  p('<div class="ef-card ef-sec" style="margin-bottom:0;">');
  p('<div class="ef-sec-head"><span class="ef-sw" style="--c:var(--orange);"></span><h2>Team workload</h2>'
    ||'<span class="ef-count">'||l_emps||' '||plural(l_emps,'person','people')||'</span>'
    ||'<div class="ef-right"><a class="ef-link" href="'||APEX_PAGE.GET_URL(p_page => 13)
    ||'">All employees &rarr;</a></div></div><ul class="ef-list">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT e.employee_id, e.first_name, e.last_name, rl.role_name, d.department_name,
             (SELECT COUNT(*) FROM task t JOIN status s ON s.status_id = t.status_id
               WHERE t.assigned_to_employee_id = e.employee_id
                 AND s.status_code NOT IN ('DONE','CANCELLED')) open_cnt,
             (SELECT COUNT(*) FROM task t JOIN status s ON s.status_id = t.status_id
               WHERE t.assigned_to_employee_id = e.employee_id
                 AND s.status_code NOT IN ('DONE','CANCELLED')
                 AND t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE)) od_cnt
        FROM employee e
        LEFT JOIN role rl ON rl.role_id = e.role_id
        LEFT JOIN department d ON d.department_id = e.department_id
       WHERE e.active_flag = 'Y'
       ORDER BY open_cnt DESC, e.last_name
       FETCH FIRST 6 ROWS ONLY
    ) LOOP
      l_any := TRUE;
      p('<li><a class="ef-row" href="'
        ||APEX_PAGE.GET_URL(p_page => 14, p_items => 'P14_EMPLOYEE_ID', p_values => TO_CHAR(r.employee_id))||'">');
      p('<div class="ef-av" style="background:'||avatar_color(r.employee_id)||';">'
        ||esc(SUBSTR(r.first_name,1,1)||SUBSTR(r.last_name,1,1))||'</div>');
      p('<div class="ef-body"><div class="ef-t1">'||esc(r.first_name||' '||r.last_name)||'</div>'
        ||'<div class="ef-t2">'||esc(NVL(r.role_name,'-'))||' &middot; '
        ||esc(NVL(r.department_name,'-'))||'</div></div>');
      IF r.od_cnt > 0 THEN
        p('<span class="ef-chip crit">'||r.od_cnt||' late</span>');
      END IF;
      p('<div class="ef-load"><div class="ef-load-track"><div class="ef-load-fill" style="width:'
        ||CASE WHEN l_max_open = 0 THEN 0 ELSE ROUND(r.open_cnt / l_max_open * 100) END||'%;"></div></div>'
        ||'<div class="ef-load-txt">'||r.open_cnt||' open</div></div>');
      p('</a></li>');
    END LOOP;
    IF NOT l_any THEN
      p('<div class="ef-empty"><b>No active employees</b>Add people to see workload.</div>');
    END IF;
  END;
  p('</ul></div>');

  p('</div>');  -- grid-2

  --------------------------------------------------------------------
  -- COMPOSITION + ACTIVITY
  --------------------------------------------------------------------
  p('<div class="ef-grid-2">');

  -- Composition: v3 spent four full-width cards and ~600px of height
  -- on four bar lists that were all the same shade of blue. Same four
  -- breakdowns, one card, color-coded so "blocked" and "done" no
  -- longer look identical.
  p('<div class="ef-card ef-sec" style="margin-bottom:0;">');
  p('<div class="ef-sec-head"><span class="ef-sw" style="--c:var(--purple);"></span><h2>Composition</h2></div>');
  DECLARE
    l_cur SYS_REFCURSOR;
  BEGIN
    OPEN l_cur FOR
      SELECT s.status_name,
             COUNT(pj.project_id),
             CASE s.status_code
               WHEN 'OPEN' THEN '#0071e3' WHEN 'IN_PROGRESS' THEN '#00c7be'
               WHEN 'ON_HOLD' THEN '#ff9500' WHEN 'COMPLETED' THEN '#34c759'
               ELSE '#98a2b3' END
        FROM status s
        LEFT JOIN project pj ON pj.status_id = s.status_id
       WHERE s.entity_type = 'PROJECT'
       GROUP BY s.status_name, s.status_code, s.sort_order
       ORDER BY s.sort_order;
    render_mix('Projects by status', l_projects, l_cur);

    OPEN l_cur FOR
      SELECT s.status_name,
             COUNT(t.task_id),
             CASE s.status_code
               WHEN 'TODO' THEN '#98a2b3' WHEN 'IN_PROGRESS' THEN '#0071e3'
               WHEN 'IN_REVIEW' THEN '#af52de' WHEN 'BLOCKED' THEN '#ff3b30'
               ELSE '#34c759' END
        FROM status s
        LEFT JOIN task t ON t.status_id = s.status_id
       WHERE s.entity_type = 'TASK'
       GROUP BY s.status_name, s.status_code, s.sort_order
       ORDER BY s.sort_order;
    render_mix('Tasks by status', l_tasks, l_cur);

    OPEN l_cur FOR
      SELECT pr.priority_name,
             COUNT(t.task_id),
             CASE pr.priority_code
               WHEN 'LOW' THEN '#98a2b3' WHEN 'MEDIUM' THEN '#0071e3'
               WHEN 'HIGH' THEN '#ff9500' ELSE '#ff3b30' END
        FROM priority pr
        LEFT JOIN task t ON t.priority_id = pr.priority_id
       GROUP BY pr.priority_name, pr.priority_code, pr.sort_order
       ORDER BY pr.sort_order;
    render_mix('Tasks by priority', l_tasks, l_cur);

    OPEN l_cur FOR
      SELECT d.department_name,
             COUNT(e.employee_id),
             CASE MOD(ROW_NUMBER() OVER (ORDER BY COUNT(e.employee_id) DESC, d.department_name), 6)
               WHEN 0 THEN '#0071e3' WHEN 1 THEN '#00c7be' WHEN 2 THEN '#5856d6'
               WHEN 3 THEN '#ff9500' WHEN 4 THEN '#af52de' ELSE '#34c759' END
        FROM department d
        LEFT JOIN employee e ON e.department_id = d.department_id
       GROUP BY d.department_name
       ORDER BY COUNT(e.employee_id) DESC, d.department_name;
    render_mix('Employees by department', l_emps, l_cur);
  END;
  p('</div>');

  -- Recent activity
  p('<div class="ef-card ef-sec" style="margin-bottom:0;">');
  p('<div class="ef-sec-head"><span class="ef-sw" style="--c:var(--blue);"></span><h2>Recent activity</h2>'
    ||'<div class="ef-right"><a class="ef-link" href="'||APEX_PAGE.GET_URL(p_page => 51)
    ||'">Audit log &rarr;</a></div></div><ul class="ef-list">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT a.audit_log_id, a.table_name, a.record_id, a.action,
             a.old_values, a.new_values, a.changed_at, a.changed_by,
             CASE a.table_name
               WHEN 'TASK'         THEN (SELECT t.task_name FROM task t WHERE t.task_id = a.record_id)
               WHEN 'PROJECT'      THEN (SELECT pj.project_name FROM project pj WHERE pj.project_id = a.record_id)
               WHEN 'EMPLOYEE'     THEN (SELECT e.first_name||' '||e.last_name FROM employee e
                                          WHERE e.employee_id = a.record_id)
               WHEN 'DEPARTMENT'   THEN (SELECT d.department_name FROM department d
                                          WHERE d.department_id = a.record_id)
               WHEN 'ORGANIZATION' THEN (SELECT o.organization_name FROM organization o
                                          WHERE o.organization_id = a.record_id)
             END entity_name
        FROM audit_log a
       ORDER BY a.audit_log_id DESC
       FETCH FIRST 7 ROWS ONLY
    ) LOOP
      l_any := TRUE;
      DECLARE
        l_summary VARCHAR2(300);
        l_title   VARCHAR2(300);
        l_old     JSON_OBJECT_T;
        l_new     JSON_OBJECT_T;
        l_keys    JSON_KEY_LIST;
        l_old_v   VARCHAR2(4000);
        l_new_v   VARCHAR2(4000);
      BEGIN
        IF r.action = 'UPDATE' THEN
          l_old  := JSON_OBJECT_T.parse(r.old_values);
          l_new  := JSON_OBJECT_T.parse(r.new_values);
          l_keys := l_new.get_keys();
          FOR i IN 1 .. l_keys.COUNT LOOP
            BEGIN l_old_v := l_old.get_string(l_keys(i)); EXCEPTION WHEN OTHERS THEN l_old_v := NULL; END;
            BEGIN l_new_v := l_new.get_string(l_keys(i)); EXCEPTION WHEN OTHERS THEN l_new_v := NULL; END;
            IF NVL(l_old_v,'~') != NVL(l_new_v,'~') AND l_summary IS NULL THEN
              l_summary := LOWER(REPLACE(l_keys(i),'_',' '))||' changed';
            END IF;
          END LOOP;
          l_summary := NVL(l_summary, 'updated');
        ELSIF r.action = 'INSERT' THEN
          l_summary := 'created';
        ELSE
          l_summary := 'deleted';
        END IF;

        -- Fall back to the bare id only when the row is genuinely gone
        -- (a DELETE, or an entity with no audit trigger).
        l_title := NVL(r.entity_name, INITCAP(REPLACE(r.table_name,'_',' '))||' #'||r.record_id);

        p('<li><div class="ef-aico" style="background:'||entity_color(r.table_name)||';">'
          ||SUBSTR(r.table_name,1,1)||'</div>');
        p('<div class="ef-body"><div class="ef-t1">'||esc(l_title)||'</div><div class="ef-t2">'
          ||INITCAP(REPLACE(r.table_name,'_',' '))||' &middot; '||esc(l_summary)||' &middot; '
          ||esc(r.changed_by)||' &middot; '||ago(r.changed_at)||'</div></div>');
        p('<span class="ef-chip '
          ||CASE r.action WHEN 'INSERT' THEN 'ok' WHEN 'DELETE' THEN 'crit' ELSE 'info' END||'">'
          ||INITCAP(r.action)||'</span></li>');
      EXCEPTION WHEN OTHERS THEN
        p('<li><div class="ef-body"><div class="ef-t2">Unable to render entry #'
          ||TO_CHAR(r.audit_log_id)||'</div></div></li>');
      END;
    END LOOP;
    IF NOT l_any THEN
      p('<div class="ef-empty"><b>No activity yet</b>Changes to core records show up here.</div>');
    END IF;
  END;
  p('</ul></div>');

  p('</div>');  -- grid-2

  --------------------------------------------------------------------
  -- PULSE (14 days of audit activity)
  --
  -- Widened from 7 to 14 days. Days with no activity render as a flat
  -- track segment instead of a 4px blue stub, so a single busy day
  -- against six empty ones reads as "one busy day" rather than as a
  -- broken chart.
  --------------------------------------------------------------------
  DECLARE
    TYPE t_num IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    l_cnt     t_num;
    l_max     NUMBER := 0;
    l_total   NUMBER := 0;
    l_bars    VARCHAR2(16000);
    l_lbls    VARCHAR2(8000);
    l_peak_d  VARCHAR2(20);
    c_days CONSTANT PLS_INTEGER := 14;
  BEGIN
    FOR i IN 0 .. c_days - 1 LOOP
      SELECT COUNT(*) INTO l_cnt(i)
        FROM audit_log
       WHERE TRUNC(changed_at) = TRUNC(SYSDATE) - (c_days - 1 - i);
      l_total := l_total + l_cnt(i);
      IF l_cnt(i) > l_max THEN
        l_max    := l_cnt(i);
        l_peak_d := TO_CHAR(SYSDATE - (c_days - 1 - i), 'Dy DD Mon');
      END IF;
    END LOOP;

    FOR i IN 0 .. c_days - 1 LOOP
      l_bars := l_bars || '<div class="ef-pulse-bar'||CASE WHEN l_cnt(i) = 0 THEN ' is-zero' END
             || '" style="height:'
             || CASE WHEN l_max = 0 THEN 3
                     WHEN l_cnt(i) = 0 THEN 3
                     ELSE GREATEST(6, ROUND(l_cnt(i) / l_max * 58)) END
             || 'px;" title="'||TO_CHAR(SYSDATE - (c_days - 1 - i),'Dy DD Mon')||': '
             || l_cnt(i)||' '||plural(l_cnt(i),'change','changes')||'"></div>';
      -- Label every other day; 14 labels in one row is unreadable.
      l_lbls := l_lbls || '<span>'
             || CASE WHEN MOD(c_days - 1 - i, 2) = 0 THEN TO_CHAR(SYSDATE - (c_days - 1 - i),'DD') END
             || '</span>';
    END LOOP;

    p('<div class="ef-card ef-sec">');
    p('<div class="ef-sec-head"><span class="ef-sw" style="--c:var(--blue);"></span><h2>Activity pulse</h2>'
      ||'<span class="ef-count">last 14 days</span><div class="ef-right"><span class="ef-count">'
      ||l_total||' '||plural(l_total,'change','changes')
      ||CASE WHEN l_max > 0 THEN ' &middot; busiest '||l_peak_d||' ('||l_max||')' END
      ||'</span></div></div>');
    p('<div class="ef-pulse">'||l_bars||'</div><div class="ef-pulse-days">'||l_lbls||'</div>');
    p('</div>');
  END;

  --------------------------------------------------------------------
  -- FOOTPRINT
  --
  -- The entity counts v3 gave seven hero cards to. They are reference
  -- data - worth having, not worth leading with. Trend badges appear
  -- only where the weekly count is smaller than the total, i.e. where
  -- there is an actual "before" to have grown from.
  --------------------------------------------------------------------
  p('<div class="ef-card ef-sec">');
  p('<div class="ef-sec-head"><span class="ef-sw" style="--c:var(--green);"></span><h2>Workspace</h2>'
    ||'<span class="ef-count">reference data</span></div>');
  p('<div class="ef-foot">');

  p('<a class="ef-fchip" style="--c:#0071e3;" href="'||APEX_PAGE.GET_URL(p_page => 5)
    ||'"><i></i><span>Organizations</span><b>'||l_orgs||'</b>'
    ||CASE WHEN l_org_new > 0 AND l_org_new < l_orgs THEN '<em>+'||l_org_new||'</em>' END||'</a>');
  p('<a class="ef-fchip" style="--c:#34c759;" href="'||APEX_PAGE.GET_URL(p_page => 9)
    ||'"><i></i><span>Departments</span><b>'||l_depts||'</b>'
    ||CASE WHEN l_dept_new > 0 AND l_dept_new < l_depts THEN '<em>+'||l_dept_new||'</em>' END||'</a>');
  p('<a class="ef-fchip" style="--c:#ff9500;" href="'||APEX_PAGE.GET_URL(p_page => 13)
    ||'"><i></i><span>Employees</span><b>'||l_emps||'</b>'
    ||CASE WHEN l_emp_new > 0 AND l_emp_new < l_emps THEN '<em>+'||l_emp_new||'</em>' END||'</a>');
  p('<a class="ef-fchip" style="--c:#5856d6;" href="'||APEX_PAGE.GET_URL(p_page => 15)
    ||'"><i></i><span>Roles</span><b>'||l_roles||'</b></a>');
  p('<a class="ef-fchip" style="--c:#af52de;" href="'||APEX_PAGE.GET_URL(p_page => 19)
    ||'"><i></i><span>Clients</span><b>'||l_clients||'</b></a>');
  p('<a class="ef-fchip" style="--c:#ff3b30;" href="'||APEX_PAGE.GET_URL(p_page => 4)
    ||'"><i></i><span>Locations</span><b>'||l_locs||'</b></a>');
  p('<a class="ef-fchip" style="--c:#00c7be;" href="'||APEX_PAGE.GET_URL(p_page => 17)
    ||'"><i></i><span>User accounts</span><b>'||l_users||'</b></a>');
  p('<a class="ef-fchip" style="--c:#8a94a6;" href="'||APEX_PAGE.GET_URL(p_page => 51)
    ||'"><i></i><span>Audit log</span><b>&rarr;</b></a>');

  p('</div></div>');

  p('</div>');  -- .ef

  --------------------------------------------------------------------
  -- LIVE TIMER + AUTO REFRESH
  --
  -- apex.region().refresh() swaps this region's DOM via innerHTML,
  -- which does not re-execute a <script> tag that arrived in an
  -- earlier render - so the tick function has to re-find its elements
  -- every second rather than closing over them once. Both intervals
  -- are guarded so re-inserting this script never stacks timers.
  --
  -- The region is addressed by its generated internal id ("R" ||
  -- region id); the Static ID from Page Designer is not registered
  -- with apex.region for this region type. Falls back to the static
  -- id in case that ever changes.
  --------------------------------------------------------------------
  p(q'~<script>
(function(){
  var root = document.querySelector('.ef');
  if (root && !window.__efDashSeen) {
    root.classList.add('ef-anim');
    window.__efDashSeen = true;
  }
  function tick(){
    var pill = document.getElementById('ef-updated-pill');
    var txt  = document.getElementById('ef-updated-text');
    if (!pill || !txt) { return; }
    var secs = Math.floor((Date.now() - new Date(pill.getAttribute('data-ts')).getTime()) / 1000);
    txt.textContent = secs < 5 ? 'Live' : secs < 60 ? (secs + 's ago') : (Math.floor(secs / 60) + 'm ago');
  }
  tick();
  if (!window.__efDashLiveTimer) {
    window.__efDashLiveTimer = setInterval(tick, 1000);
  }
  if (!window.__efDashRefreshTimer) {
    window.__efDashRefreshTimer = setInterval(function(){
      // Refreshing swaps the region's innerHTML, which drops the reader
      // back to the top of the page. Only do it when they are already
      // at the top and the tab is in front - otherwise skip this tick
      // and try again on the next one.
      if (window.scrollY > 40 || document.hidden) { return; }
      try {
        var r = window.apex && apex.region
                  && (apex.region('R9114769350531102') || apex.region('dashboard-content'));
        if (r && r.refresh) { r.refresh(); }
      } catch (e) { /* region gone - page navigated away */ }
    }, 120000);
  }
})();
</script>~');

  -- Final flush of the buffer into the LOB.
  IF l_buf IS NOT NULL THEN
    DBMS_LOB.WRITEAPPEND(l_html, LENGTH(l_buf), l_buf);
    l_buf := NULL;
  END IF;

  RETURN l_html;
END render_dashboard_html;
/
