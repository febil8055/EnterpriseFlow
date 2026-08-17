-- ============================================================
-- EnterpriseFlow - Dashboard renderer, v6
--
-- v4 was informative but it looked generated: eight accent hues,
-- weight-700 everywhere, 18px radii, a gradient hero with glow blobs,
-- a colored icon tile on every card. Every element shouted.
--
-- v5 keeps v4's information architecture and rebuilds the surface on
-- the discipline the best product UIs actually use. Sampled from the
-- live sites rather than assumed:
--
--   linear.app   bg #08090a; five greys carry ~450 text nodes while
--                every accent hue combined appears ~70 times; font
--                weight 400 dominant; radii 2/4/6px.
--   stripe.com   ink #061b31 - a desaturated navy, never pure black;
--                greys tinted toward the brand hue (#50617a, #64748d,
--                #7d8ba4, #a3b5d6) so the neutrals feel of a piece;
--                body weight 300, display sizes ALSO weight 300 with
--                ~-0.02em tracking; 1px hairlines; radii 4/6px.
--
-- The rules that fall out of that, and that this file follows:
--
--   1. ONE tinted grey ramp does the work. Hierarchy comes from
--      size, weight and grey level - not from colored containers.
--   2. ONE accent. Data bars are that accent at five opacities
--      rather than five different colors.
--   3. COLOR MEANS EXCEPTION. Red and amber appear only where
--      something is actually wrong: overdue, blocked, on-hold,
--      critical. Across the whole page that is a handful of marks,
--      so they are impossible to miss. Everything healthy is grey.
--   4. Big numbers are LIGHT (weight 300) and tabular, not bold.
--      Bold at 30px is loud; light at 30px is confident.
--   5. 1px hairlines, 4-6px radii, no drop shadows.
--   6. A monospace face carries indices, dates and metric labels.
--      It is the one signature element, and it reads as engineered
--      instead of decorated.
--
-- Structure is numbered like a printed brief (01 Signals, 02
-- Portfolio, ...) so the page can be scanned and referred to.
--
-- Logic is unchanged from v4 and still applies: cached AI insight
-- (APEX collection, fingerprint + 15 min TTL) over a deterministic
-- fallback; audit rows resolved to real entity names; everything
-- escaped; buffered CLOB writes; first-paint-only animation; the
-- refresh timer yields while the reader is scrolled down the page.
-- ============================================================

CREATE OR REPLACE FUNCTION "RENDER_DASHBOARD_HTML" RETURN CLOB IS

  l_html CLOB;
  l_buf  VARCHAR2(32767);

  -- Reference counts
  l_orgs      NUMBER; l_depts NUMBER; l_roles NUMBER; l_users NUMBER;
  l_emps      NUMBER; l_clients NUMBER; l_locs NUMBER;
  l_org_new   NUMBER; l_dept_new NUMBER; l_emp_new NUMBER;
  l_proj_new  NUMBER; l_task_new NUMBER;

  -- Work metrics
  l_projects       NUMBER; l_projects_done NUMBER; l_projects_active NUMBER;
  l_tasks          NUMBER; l_tasks_done NUMBER; l_tasks_open NUMBER;
  l_blocked        NUMBER; l_overdue NUMBER; l_due_soon NUMBER; l_unassigned NUMBER;
  l_task_pct       NUMBER; l_proj_pct NUMBER;

  -- Health
  l_health       NUMBER;
  l_health_label VARCHAR2(30);
  l_ring_off     NUMBER;
  c_circ CONSTANT PLS_INTEGER := 339;   -- 2 * pi * 54, integer for NLS safety

  -- Insight
  l_greeting     VARCHAR2(40);
  l_hr           NUMBER := TO_NUMBER(TO_CHAR(SYSDATE,'HH24'));
  l_rule_insight VARCHAR2(400);
  l_insight      VARCHAR2(400);
  l_insight_src  VARCHAR2(10) := 'RULE';
  l_fingerprint  VARCHAR2(200);
  c_coll CONSTANT VARCHAR2(30) := 'EF_DASH_INSIGHT';

  -- Next action
  l_next_task_id   NUMBER;
  l_next_task_name VARCHAR2(200);
  l_next_label     VARCHAR2(40);

  l_worst_overdue_name VARCHAR2(200);
  l_worst_overdue_days NUMBER;
  l_first_blocked_name VARCHAR2(200);

  l_max_open NUMBER := 0;

  --------------------------------------------------------------------
  -- Buffered append
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

  -- Fractional values bound for CSS. Default TO_CHAR follows
  -- NLS_NUMERIC_CHARACTERS; a comma decimal would emit width:33,33%
  -- and silently collapse the bar.
  FUNCTION num(p_n IN NUMBER) RETURN VARCHAR2 IS
  BEGIN
    RETURN TRIM(TO_CHAR(p_n, 'FM99999990.00', 'NLS_NUMERIC_CHARACTERS=''.,'''));
  END num;

  FUNCTION ago(p_ts IN TIMESTAMP) RETURN VARCHAR2 IS
    l_min NUMBER;
  BEGIN
    l_min := (CAST(SYSTIMESTAMP AS DATE) - CAST(p_ts AS DATE)) * 1440;
    RETURN CASE
             WHEN l_min < 1     THEN 'now'
             WHEN l_min < 60    THEN ROUND(l_min)||'m'
             WHEN l_min < 1440  THEN ROUND(l_min/60)||'h'
             WHEN l_min < 10080 THEN ROUND(l_min/1440)||'d'
             ELSE TO_CHAR(p_ts,'DD Mon')
           END;
  END ago;

  --------------------------------------------------------------------
  -- Section header: mono index, title, hairline rule, optional link.
  --------------------------------------------------------------------
  -- p_note is caller-supplied markup (literals and numbers only, never
  -- table data), so it is emitted as-is - escaping it would print the
  -- &middot; separators literally.
  PROCEDURE head(p_idx IN VARCHAR2, p_title IN VARCHAR2,
                 p_note IN VARCHAR2 DEFAULT NULL,
                 p_href IN VARCHAR2 DEFAULT NULL, p_link IN VARCHAR2 DEFAULT NULL) IS
  BEGIN
    p('<div class="hd"><span class="idx">'||p_idx||'</span><h2>'||esc(p_title)||'</h2>');
    IF p_note IS NOT NULL THEN
      p('<span class="note">'||p_note||'</span>');
    END IF;
    p('<span class="rule"></span>');
    IF p_href IS NOT NULL THEN
      p('<a class="more" href="'||p_href||'">'||esc(p_link)||'</a>');
    END IF;
    p('</div>');
  END head;

  --------------------------------------------------------------------
  -- One composition bar. The cursor supplies a ramp class per row
  -- (g1..g5 = accent at decreasing opacity) or an exception class
  -- (xl = late/red, xw = warn/amber) where the state genuinely means
  -- something is wrong. At most one exception per bar, so the page
  -- keeps roughly three spots of color in total.
  --------------------------------------------------------------------
  PROCEDURE render_mix(p_title IN VARCHAR2, p_total IN NUMBER, p_cur IN OUT SYS_REFCURSOR) IS
    l_label VARCHAR2(200);
    l_cnt   NUMBER;
    l_cls   VARCHAR2(10);
    l_bar   VARCHAR2(16000);
    l_leg   VARCHAR2(16000);
  BEGIN
    LOOP
      FETCH p_cur INTO l_label, l_cnt, l_cls;
      EXIT WHEN p_cur%NOTFOUND;

      IF l_cnt > 0 AND p_total > 0 THEN
        l_bar := l_bar||'<i class="sg '||l_cls||'" style="width:'||num(ROUND(l_cnt / p_total * 100, 2))
                      ||'%;" title="'||esc(l_label)||': '||l_cnt||'"></i>';
      END IF;

      l_leg := l_leg||'<span class="lg'||CASE WHEN l_cnt = 0 THEN ' z' END||'">'
                    ||'<i class="sw '||l_cls||'"></i>'||esc(l_label)
                    ||'<b>'||l_cnt||'</b></span>';
    END LOOP;
    CLOSE p_cur;

    p('<div class="mix"><div class="mix-t">'||esc(p_title)||'</div><div class="bar">'||l_bar||'</div>');
    p('<div class="leg">'||l_leg||'</div></div>');
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
  -- HEALTH - proportional to open work, not absolute
  --------------------------------------------------------------------
  IF l_tasks_open = 0 THEN
    l_health := 100;
  ELSE
    l_health := GREATEST(0, ROUND(100
                  - (l_overdue    / l_tasks_open) * 45
                  - (l_blocked    / l_tasks_open) * 25
                  - (l_unassigned / l_tasks_open) * 15));
  END IF;

  l_health_label := CASE
                      WHEN l_health >= 90 THEN 'Excellent'
                      WHEN l_health >= 75 THEN 'Healthy'
                      WHEN l_health >= 60 THEN 'Fair'
                      WHEN l_health >= 40 THEN 'At risk'
                      ELSE 'Critical'
                    END;

  l_ring_off := ROUND(c_circ * (1 - l_health / 100));

  --------------------------------------------------------------------
  -- WHAT TO FIX NEXT
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
                        THEN 'Resolve' ELSE 'Unblock' END lbl,
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
  -- INSIGHT
  --------------------------------------------------------------------
  l_greeting := CASE WHEN l_hr < 12 THEN 'Good morning'
                     WHEN l_hr < 17 THEN 'Good afternoon'
                     ELSE 'Good evening' END;

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

  l_fingerprint := l_projects||'.'||l_projects_active||'.'||l_projects_done||'.'
                || l_tasks||'.'||l_tasks_done||'.'||l_tasks_open||'.'
                || l_blocked||'.'||l_overdue||'.'||l_due_soon||'.'||l_unassigned||'.'||l_emps;

  DECLARE
    l_cached_fp  VARCHAR2(200);
    l_cached_txt VARCHAR2(400);
    l_cached_at  DATE;
    l_fresh      BOOLEAN := FALSE;
    l_prompt     VARCHAR2(4000);
    l_raw        CLOB;
  BEGIN
    IF APEX_COLLECTION.COLLECTION_EXISTS(c_coll) THEN
      BEGIN
        SELECT c001, c002, d001 INTO l_cached_fp, l_cached_txt, l_cached_at
          FROM apex_collections
         WHERE collection_name = c_coll AND seq_id = 1;

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
        APEX_COLLECTION.ADD_MEMBER(p_collection_name => c_coll,
                                   p_c001 => l_fingerprint,
                                   p_c002 => l_insight,
                                   p_d001 => SYSDATE);
      END IF;
    END IF;
  EXCEPTION WHEN OTHERS THEN
    l_insight     := l_rule_insight;
    l_insight_src := 'RULE';
  END;

  --------------------------------------------------------------------
  -- STYLES
  --------------------------------------------------------------------
  p(q'~<style>
/* ------------------------------------------------------------------
   Type and color sampled from apple.com, not guessed at.

     weight 600 dominates - 12/17/21/24/28/48/80px all semibold
     17px is the body size, w400 and w600, tracking -0.022em
     the scale jumps hard (12 -> 17 -> 21 -> 24 -> 40) - no mush
     secondary grey is used sparingly; most text is full contrast

   v5 got every one of these backwards: 13.5px body at weight 300,
   most text in grey, a 10px monospace face on labels, dates and
   counts. Restrained color is right; restrained legibility is not.
   Color discipline from v5 is kept - one accent, and red/amber only
   where something is actually wrong.
   ------------------------------------------------------------------ */
.ef{
  --ink:#1d1d1f;        /* Apple label            */
  --ink2:#424245;
  --muted:#6e6e73;      /* Apple secondary label  */
  --faint:#86868b;      /* Apple tertiary         */
  --line:rgba(0,0,0,.11);
  --line2:rgba(0,0,0,.18);
  --card:#ffffff;
  --sunk:#f5f5f7;
  --accent:#0071e3;
  --late:#d70015; --warn:#a1560a; --good:#1d7a45;
  font-family:-apple-system,BlinkMacSystemFont,"SF Pro Text","SF Pro Display","Segoe UI",Roboto,Helvetica,Arial,sans-serif;
  color:var(--ink);
  font-size:17px;line-height:1.47;letter-spacing:-.022em;
  -webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;
}
html[data-theme="dark"] .ef{
  --ink:#f5f5f7; --ink2:#d2d2d7; --muted:#a1a1a6; --faint:#86868b;
  --line:rgba(255,255,255,.14); --line2:rgba(255,255,255,.22);
  --card:#1c1c1e; --sunk:#000;
  --accent:#2997ff;                       /* Apple's dark-mode blue */
  --late:#ff6961; --warn:#ffb340; --good:#30d158;
}
.ef *{box-sizing:border-box;}
.ef a{text-decoration:none;color:inherit;}

/* ---- card + section header ---- */
.cd{background:var(--card);border:1px solid var(--line);border-radius:18px;
  padding:26px 28px;margin-bottom:18px;}
.hd{display:flex;align-items:baseline;gap:12px;margin-bottom:22px;flex-wrap:wrap;}
.idx{font-size:15px;font-weight:600;color:var(--faint);letter-spacing:0;}
.hd h2{font-size:24px;font-weight:600;letter-spacing:-.019em;margin:0;color:var(--ink);}
.hd .note{font-size:15px;color:var(--muted);letter-spacing:-.01em;}
.hd .rule{flex:1;min-width:8px;}
.ef a.more{font-size:15px;font-weight:400;color:var(--accent);white-space:nowrap;letter-spacing:-.01em;}
.ef a.more:hover{text-decoration:underline;}
.g2{display:grid;grid-template-columns:1fr 1fr;gap:18px;}
.g2 > .cd{margin-bottom:0;}

/* ---- masthead ---- */
.mast{padding:6px 2px 30px;border-bottom:1px solid var(--line);margin-bottom:24px;
  display:grid;grid-template-columns:minmax(0,1fr) auto;gap:40px;align-items:center;}
.kicker{display:flex;align-items:center;gap:10px;font-size:15px;color:var(--muted);
  margin-bottom:14px;flex-wrap:wrap;letter-spacing:-.01em;}
.kicker .dot{width:7px;height:7px;border-radius:50%;background:var(--good);flex:none;}
.kicker .sep{color:var(--line2);}
.mast h1{font-size:40px;font-weight:600;letter-spacing:-.025em;line-height:1.1;
  margin:0 0 12px;color:var(--ink);}
.lede{font-size:21px;font-weight:400;line-height:1.38;letter-spacing:-.019em;
  color:var(--ink);margin:0;max-width:40ch;}
.acts{display:flex;align-items:center;gap:22px;margin-top:24px;flex-wrap:wrap;}
.ef .acts a.btn{display:inline-flex;align-items:baseline;gap:9px;font-size:17px;font-weight:400;
  letter-spacing:-.022em;padding:12px 22px;border-radius:980px;
  background:var(--accent);color:#fff;transition:opacity .15s;max-width:100%;}
.ef .acts a.btn:hover{opacity:.85;}
.ef .acts a.btn .k{font-size:15px;font-weight:600;opacity:.72;flex:none;}
.tlink{font-size:17px;color:var(--accent);letter-spacing:-.022em;}
.tlink:hover{text-decoration:underline;}

/* health dial */
.dial{position:relative;width:150px;height:150px;flex:none;}
.dial svg{transform:rotate(-90deg);display:block;width:150px;height:150px;}
.dial .tr{fill:none;stroke:var(--line);stroke-width:4;}
.dial .vl{fill:none;stroke:var(--accent);stroke-width:4;stroke-linecap:round;}
.dial .ct{position:absolute;inset:0;display:flex;flex-direction:column;
  align-items:center;justify-content:center;}
.dial .n{font-size:48px;font-weight:600;letter-spacing:-.03em;line-height:1;color:var(--ink);}
.dial .l{font-size:13px;font-weight:600;letter-spacing:.02em;color:var(--muted);margin-top:7px;}
.dial.w .vl{stroke:var(--warn);}
.dial.c .vl{stroke:var(--late);}

/* ---- signals ---- */
.sig{display:grid;grid-template-columns:repeat(4,1fr);}
.sig > a{padding:4px 26px;border-left:1px solid var(--line);border-radius:10px;transition:background .15s;}
.sig > a:first-child{border-left:none;padding-left:2px;}
.sig > a:hover{background:var(--sunk);}
.sig .lb{display:flex;align-items:center;gap:9px;font-size:15px;font-weight:400;
  color:var(--muted);margin-bottom:14px;letter-spacing:-.01em;}
.sig .lb i{width:8px;height:8px;border-radius:50%;background:var(--line2);flex:none;}
.sig .n{font-size:48px;font-weight:600;letter-spacing:-.03em;line-height:1;
  color:var(--ink);margin-bottom:10px;}
.sig .sb{font-size:15px;color:var(--muted);line-height:1.4;letter-spacing:-.01em;}
.sig .ok .n{font-size:30px;color:var(--muted);letter-spacing:-.02em;padding-top:16px;}
.sig .hot .lb i{background:var(--late);}
.sig .hot .lb{color:var(--ink);font-weight:600;}
.sig .warm .lb i{background:var(--warn);}
.sig .warm .lb{color:var(--ink);font-weight:600;}

/* ---- portfolio ---- */
.pj{display:grid;grid-template-columns:minmax(0,2.1fr) minmax(0,1.2fr) 150px 116px 104px;
  gap:22px;align-items:center;padding:15px 10px;border-top:1px solid var(--line);
  border-radius:10px;transition:background .15s;}
.pj:hover{background:var(--sunk);}
.pj-h{border-top:none;padding-top:0;padding-bottom:12px;font-size:13px;font-weight:600;
  color:var(--faint);letter-spacing:.02em;}
.pj-h:hover{background:transparent;}
.nm{font-size:17px;font-weight:400;color:var(--ink);letter-spacing:-.022em;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.pj:hover .nm,.row:hover .nm{color:var(--accent);}
.sub{font-size:15px;color:var(--muted);letter-spacing:-.01em;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.prog{display:flex;height:6px;border-radius:3px;overflow:hidden;background:var(--line);}
.prog i{display:block;height:100%;}
.prog .d{background:var(--muted);}
.prog .p{background:var(--accent);}
.pv{font-size:14px;color:var(--muted);margin-top:9px;letter-spacing:-.01em;}
.flags{display:flex;gap:14px;justify-content:flex-end;font-size:15px;letter-spacing:-.01em;}
.fl{color:var(--faint);}
.fl.l{color:var(--late);font-weight:600;}
.fl.w{color:var(--warn);font-weight:600;}
.st{font-size:15px;color:var(--muted);text-align:right;white-space:nowrap;letter-spacing:-.01em;}
.st.w{color:var(--warn);font-weight:600;}
.st.o{color:var(--faint);}

/* ---- lists ---- */
.rows{display:flex;flex-direction:column;}
.row{display:flex;align-items:center;gap:16px;padding:14px 10px;
  border-top:1px solid var(--line);border-radius:10px;transition:background .15s;}
.row:first-child{border-top:none;}
.row:hover{background:var(--sunk);}
.bd{flex:1;min-width:0;}
.dt{font-size:15px;font-weight:600;color:var(--ink);width:62px;flex:none;letter-spacing:-.01em;}
.dt.l{color:var(--late);}
.dt.s{color:var(--warn);}
.rt{font-size:15px;color:var(--muted);white-space:nowrap;flex:none;letter-spacing:-.01em;}
.rt.l{color:var(--late);font-weight:600;}
.rt.s{color:var(--warn);font-weight:600;}
.av{width:38px;height:38px;border-radius:50%;flex:none;display:flex;align-items:center;
  justify-content:center;font-size:14px;font-weight:600;letter-spacing:0;
  color:var(--ink2);background:var(--sunk);border:1px solid var(--line);}
.load{width:88px;flex:none;}
.load .t{height:6px;border-radius:3px;background:var(--line);overflow:hidden;}
.load .f{height:100%;background:var(--accent);border-radius:3px;}
.load .c{font-size:14px;color:var(--muted);margin-top:8px;text-align:right;letter-spacing:-.01em;}
.tag{font-size:15px;color:var(--muted);flex:none;letter-spacing:-.01em;}
.tag.n{color:var(--good);}
.tag.d{color:var(--late);font-weight:600;}

/* ---- composition ---- */
.mix{margin-bottom:24px;}
.mix:last-child{margin-bottom:0;}
.mix-t{font-size:15px;font-weight:600;color:var(--ink);margin-bottom:11px;letter-spacing:-.014em;}
.bar{display:flex;height:8px;border-radius:4px;overflow:hidden;background:var(--line);}
.sg{display:block;height:100%;background:var(--accent);}
.sw{width:10px;height:10px;border-radius:3px;flex:none;background:var(--accent);}
/* Tint ramp. Named t1..t5, NOT g1..g5: .g2 is already the two-column
   grid, and the duplicate was silently painting every two-column
   section at 68% opacity. */
.t1{opacity:1;} .t2{opacity:.68;} .t3{opacity:.46;} .t4{opacity:.3;} .t5{opacity:.18;}
.xl{background:var(--late);opacity:1;} .xw{background:var(--warn);opacity:1;}
.leg{display:flex;flex-wrap:wrap;gap:7px 20px;margin-top:12px;}
.lg{display:inline-flex;align-items:center;gap:8px;font-size:15px;color:var(--muted);letter-spacing:-.01em;}
.lg b{font-weight:600;color:var(--ink);}
.lg.z{opacity:.45;}

/* ---- pulse ---- */
.pl{display:flex;align-items:flex-end;gap:7px;height:64px;}
.pl i{flex:1;min-height:3px;background:var(--accent);border-radius:2px;display:block;}
.pl i.z{background:var(--line);}
.pd{display:flex;gap:7px;margin-top:10px;}
.pd span{flex:1;text-align:center;font-size:13px;color:var(--faint);letter-spacing:0;}

/* ---- workspace ---- */
.ws{display:flex;flex-wrap:wrap;gap:4px 40px;}
.ws a{display:flex;align-items:baseline;gap:10px;padding:7px 0;}
.ws a:hover .wn{color:var(--accent);}
.ws .wl{font-size:17px;color:var(--muted);letter-spacing:-.022em;}
.ws .wn{font-size:19px;font-weight:600;color:var(--ink);letter-spacing:-.02em;}
.ws .wd{font-size:14px;font-weight:600;color:var(--good);}

.empty{font-size:17px;color:var(--muted);padding:30px 10px;letter-spacing:-.022em;}
.empty b{display:block;font-weight:600;color:var(--ink);font-size:19px;margin-bottom:4px;}

@media (max-width:1100px){
  .pj{grid-template-columns:minmax(0,2fr) 150px 112px 100px;}
  .pj .sub,.pj-h .hsub{display:none;}
}
@media (max-width:900px){
  .g2{grid-template-columns:1fr;}
  .mast{grid-template-columns:1fr;gap:26px;align-items:start;}
  .sig{grid-template-columns:1fr 1fr;gap:26px 0;}
  .sig > a:nth-child(3){border-left:none;padding-left:2px;}
}
@media (max-width:620px){
  .cd{padding:22px 18px;}
  .mast h1{font-size:32px;}
  .lede{font-size:19px;}
  .sig{grid-template-columns:1fr;}
  .sig > a{border-left:none;padding-left:2px;}
  .pj{grid-template-columns:minmax(0,1fr) 98px 92px;}
  .pj .prog-c,.pj-h .hprog{display:none;}
}

/* First paint only - the region rewrites its own innerHTML on the
   refresh timer, and re-animating the page on a loop is maddening. */
.anim .mast,.anim .cd{animation:fi .45s cubic-bezier(.22,1,.36,1) both;}
.anim .cd:nth-of-type(2){animation-delay:.05s;}
.anim .cd:nth-of-type(3){animation-delay:.1s;}
.anim .dial .vl{animation:rg .95s cubic-bezier(.22,1,.36,1) both;}
@keyframes fi{from{opacity:0;transform:translateY(6px);}}
@keyframes rg{from{stroke-dashoffset:339;}}
@media (prefers-reduced-motion:reduce){
  .ef *,.ef *::before,.ef *::after{animation:none !important;transition:none !important;}
}
</style>~');

  --------------------------------------------------------------------
  -- 00 MASTHEAD
  --------------------------------------------------------------------
  p('<div class="ef"><div class="mast"><div>');

  p('<div class="kicker"><span class="dot" aria-hidden="true"></span>'
    ||'<span id="ef-live">Live</span><span class="sep">/</span>'
    ||'<span>'||TO_CHAR(SYSDATE,'Dy DD Mon YYYY')||'</span><span class="sep">/</span>'
    ||'<span>'||l_projects_active||' active '||plural(l_projects_active,'project','projects')||'</span>'
    ||CASE WHEN l_insight_src = 'AI' THEN '<span class="sep">/</span><span>AI brief</span>' END
    ||'<span hidden id="ef-ts" data-ts="'
    ||TO_CHAR(SYSTIMESTAMP AT TIME ZONE 'UTC','YYYY-MM-DD"T"HH24:MI:SS"Z"')||'"></span></div>');

  p('<h1>'||l_greeting||'</h1>');
  p('<p class="lede">'||esc(l_insight)||'</p>');

  p('<div class="acts">');
  IF l_next_task_id IS NOT NULL THEN
    p('<a class="btn" href="'
      ||APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID', p_values => TO_CHAR(l_next_task_id))
      ||'"><span class="k">'||esc(l_next_label)||'</span>'||esc(l_next_task_name)||'</a>');
  ELSE
    p('<a class="btn" href="'||APEX_PAGE.GET_URL(p_page => 42)||'">Review open tasks</a>');
  END IF;
  p('<a class="tlink" href="'||APEX_PAGE.GET_URL(p_page => 49)||'">Ask the assistant</a>');
  p('<a class="tlink" href="'||APEX_PAGE.GET_URL(p_page => 40)||'">Projects</a>');
  p('</div></div>');

  -- Health dial
  p('<div class="dial'||CASE WHEN l_health < 60 THEN ' c' WHEN l_health < 75 THEN ' w' END
    ||'" role="img" aria-label="Delivery health '||l_health||' out of 100, '||LOWER(l_health_label)||'">');
  p('<svg viewBox="0 0 120 120" width="120" height="120" aria-hidden="true">'
    ||'<circle class="tr" cx="60" cy="60" r="54"/>'
    ||'<circle class="vl" cx="60" cy="60" r="54" stroke-dasharray="'||TO_CHAR(c_circ)
    ||'" stroke-dashoffset="'||TO_CHAR(l_ring_off)||'"/></svg>');
  p('<div class="ct"><span class="n">'||l_health||'</span><span class="l">'
    ||UPPER(l_health_label)||'</span></div></div>');

  p('</div>');  -- mast

  --------------------------------------------------------------------
  -- 01 SIGNALS
  --
  -- One card, four hairline-separated cells. A colored dot appears
  -- only where the count is non-zero - so on a clean workspace the
  -- whole row is grey, and a single red dot is genuinely alarming.
  --------------------------------------------------------------------
  p('<div class="cd">');
  head('01', 'Signals', 'needs attention', APEX_PAGE.GET_URL(p_page => 42), 'All tasks');
  p('<div class="sig">');

  p('<a class="'||CASE WHEN l_overdue = 0 THEN 'ok' ELSE 'hot' END||'" href="'
    ||APEX_PAGE.GET_URL(p_page => 42)||'"><div class="lb"><i></i>OVERDUE</div>');
  IF l_overdue = 0 THEN
    p('<div class="n">None</div><div class="sb">Nothing past its due date</div>');
  ELSE
    p('<div class="n">'||l_overdue||'</div><div class="sb">'
      ||CASE WHEN l_worst_overdue_days IS NOT NULL
             THEN 'Worst '||l_worst_overdue_days||' '||plural(l_worst_overdue_days,'day','days')||' late'
             ELSE plural(l_overdue,'task','tasks')||' past due' END||'</div>');
  END IF;
  p('</a>');

  p('<a class="'||CASE WHEN l_blocked = 0 THEN 'ok' ELSE 'warm' END||'" href="'
    ||APEX_PAGE.GET_URL(p_page => 42)||'"><div class="lb"><i></i>BLOCKED</div>');
  IF l_blocked = 0 THEN
    p('<div class="n">None</div><div class="sb">Nothing waiting on a blocker</div>');
  ELSE
    p('<div class="n">'||l_blocked||'</div><div class="sb">'
      ||CASE WHEN l_first_blocked_name IS NOT NULL
             THEN esc(SUBSTR(l_first_blocked_name,1,38))
             ELSE plural(l_blocked,'task','tasks')||' stalled' END||'</div>');
  END IF;
  p('</a>');

  p('<a class="'||CASE WHEN l_due_soon = 0 THEN 'ok' END||'" href="'
    ||APEX_PAGE.GET_URL(p_page => 42)||'"><div class="lb"><i></i>DUE IN 7 DAYS</div>');
  IF l_due_soon = 0 THEN
    p('<div class="n">Clear</div><div class="sb">No deadlines this week</div>');
  ELSE
    p('<div class="n">'||l_due_soon||'</div><div class="sb">'
      ||plural(l_due_soon,'task lands','tasks land')||' this week</div>');
  END IF;
  p('</a>');

  p('<a class="'||CASE WHEN l_unassigned = 0 THEN 'ok' END||'" href="'
    ||APEX_PAGE.GET_URL(p_page => 42)||'"><div class="lb"><i></i>UNASSIGNED</div>');
  IF l_unassigned = 0 THEN
    p('<div class="n">None</div><div class="sb">Every open task has an owner</div>');
  ELSE
    p('<div class="n">'||l_unassigned||'</div><div class="sb">open '
      ||plural(l_unassigned,'task needs','tasks need')||' an owner</div>');
  END IF;
  p('</a>');

  p('</div></div>');

  --------------------------------------------------------------------
  -- 02 PORTFOLIO
  --
  -- Aligned rows rather than v4's card grid: nine projects in a
  -- consistent column layout can be compared at a glance, which nine
  -- floating cards cannot.
  --------------------------------------------------------------------
  p('<div class="cd">');
  head('02', 'Portfolio',
       l_projects_active||' active of '||l_projects||' &middot; '||l_task_pct||'% of tasks done',
       APEX_PAGE.GET_URL(p_page => 40), 'All projects');

  p('<div class="pj pj-h"><span>PROJECT</span><span class="hsub">CLIENT</span>'
    ||'<span class="hprog">PROGRESS</span><span style="text-align:right;">FLAGS</span>'
    ||'<span style="text-align:right;">STATUS</span></div>');

  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT pj.project_id, pj.project_name, pj.end_date,
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
       FETCH FIRST 10 ROWS ONLY
    ) LOOP
      l_any := TRUE;
      DECLARE
        l_dpct NUMBER := pct(r.done, r.tot);
        l_ipct NUMBER := pct(r.inprog, r.tot);
        l_dead BOOLEAN := (r.status_code IN ('CANCELLED','COMPLETED'));
      BEGIN
        p('<a class="pj" href="'
          ||APEX_PAGE.GET_URL(p_page => 41, p_items => 'P41_PROJECT_ID',
                              p_values => TO_CHAR(r.project_id))||'">');
        p('<span class="nm">'||esc(r.project_name)||'</span>');
        p('<span class="sub">'||esc(NVL(r.client_name,'Internal'))||'</span>');

        p('<span class="prog-c"><span class="prog">');
        IF r.tot > 0 THEN
          IF l_dpct > 0 THEN
            p('<i class="d" style="width:'||l_dpct||'%;" title="'||r.done||' done"></i>');
          END IF;
          -- In-flight work is the only thing worth an accent here; a
          -- cancelled or completed project has none by definition.
          IF l_ipct > 0 AND NOT l_dead THEN
            p('<i class="p" style="width:'||l_ipct||'%;" title="'||r.inprog||' in progress"></i>');
          END IF;
        END IF;
        p('</span><span class="pv">'
          ||CASE WHEN r.tot = 0 THEN 'no tasks' ELSE r.done||'/'||r.tot||' &middot; '||l_dpct||'%' END
          ||'</span></span>');

        p('<span class="flags">');
        IF r.overdue > 0 THEN
          p('<span class="fl l">'||r.overdue||' late</span>');
        END IF;
        IF r.blocked > 0 THEN
          p('<span class="fl w">'||r.blocked||' blk</span>');
        END IF;
        IF r.overdue = 0 AND r.blocked = 0 THEN
          p('<span class="fl">&mdash;</span>');
        END IF;
        p('</span>');

        p('<span class="st'
          ||CASE WHEN r.status_code = 'ON_HOLD' THEN ' w'
                 WHEN r.status_code IN ('CANCELLED','COMPLETED') THEN ' o' END||'">'
          ||esc(r.status_name)||'</span>');
        p('</a>');
      END;
    END LOOP;

    IF NOT l_any THEN
      p('<div class="empty"><b>No projects yet</b>Create one to start tracking delivery.</div>');
    END IF;
  END;
  p('</div>');

  --------------------------------------------------------------------
  -- 03 DEADLINES + 04 WORKLOAD
  --------------------------------------------------------------------
  p('<div class="g2">');

  p('<div class="cd">');
  head('03', 'Deadlines', NULL, APEX_PAGE.GET_URL(p_page => 42), 'All tasks');
  p('<div class="rows">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT t.task_id, t.task_name, t.due_date, pj.project_name,
             pr.priority_code, pr.priority_name,
             e.first_name, e.last_name,
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
        l_cls VARCHAR2(4);
        l_lbl VARCHAR2(40);
      BEGIN
        IF r.days_left < 0 THEN
          l_cls := 'l'; l_lbl := ABS(r.days_left)||'d late';
        ELSIF r.days_left = 0 THEN
          l_cls := 's'; l_lbl := 'today';
        ELSIF r.days_left <= 3 THEN
          l_cls := 's'; l_lbl := CASE WHEN r.days_left = 1 THEN 'tomorrow' ELSE r.days_left||'d' END;
        ELSE
          l_cls := '';  l_lbl := r.days_left||'d';
        END IF;

        p('<a class="row" href="'
          ||APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID',
                              p_values => TO_CHAR(r.task_id))||'">');
        p('<span class="dt '||l_cls||'">'||TO_CHAR(r.due_date,'DD Mon')||'</span>');
        p('<span class="bd"><span class="nm" style="display:block;">'||esc(r.task_name)||'</span>'
          ||'<span class="sub" style="display:block;">'||esc(NVL(r.project_name,'No project'))
          ||CASE WHEN r.priority_code IN ('HIGH','CRITICAL')
                 THEN ' &middot; '||esc(r.priority_name) END
          ||CASE WHEN r.first_name IS NOT NULL
                 THEN ' &middot; '||esc(r.first_name||' '||SUBSTR(r.last_name,1,1)||'.')
                 ELSE ' &middot; unassigned' END||'</span></span>');
        p('<span class="rt '||l_cls||'">'||l_lbl||'</span>');
        p('</a>');
      END;
    END LOOP;
    IF NOT l_any THEN
      p('<div class="empty"><b>Nothing scheduled</b>No open task carries a due date.</div>');
    END IF;
  END;
  p('</div></div>');

  SELECT NVL(MAX(cnt),0) INTO l_max_open
    FROM (SELECT COUNT(*) cnt
            FROM task t
            JOIN status s ON s.status_id = t.status_id
           WHERE s.status_code NOT IN ('DONE','CANCELLED')
             AND t.assigned_to_employee_id IS NOT NULL
           GROUP BY t.assigned_to_employee_id);

  p('<div class="cd">');
  head('04', 'Workload', l_emps||' '||plural(l_emps,'person','people'),
       APEX_PAGE.GET_URL(p_page => 13), 'All employees');
  p('<div class="rows">');
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
      p('<a class="row" href="'
        ||APEX_PAGE.GET_URL(p_page => 14, p_items => 'P14_EMPLOYEE_ID',
                            p_values => TO_CHAR(r.employee_id))||'">');
      p('<span class="av">'||esc(SUBSTR(r.first_name,1,1)||SUBSTR(r.last_name,1,1))||'</span>');
      p('<span class="bd"><span class="nm" style="display:block;">'
        ||esc(r.first_name||' '||r.last_name)||'</span>'
        ||'<span class="sub" style="display:block;">'||esc(NVL(r.role_name,'-'))||' &middot; '
        ||esc(NVL(r.department_name,'-'))||'</span></span>');
      IF r.od_cnt > 0 THEN
        p('<span class="tag d">'||r.od_cnt||' late</span>');
      END IF;
      p('<span class="load"><span class="t"><span class="f" style="width:'
        ||CASE WHEN l_max_open = 0 THEN 0 ELSE ROUND(r.open_cnt / l_max_open * 100) END
        ||'%;"></span></span><span class="c">'||r.open_cnt||' open</span></span>');
      p('</a>');
    END LOOP;
    IF NOT l_any THEN
      p('<div class="empty"><b>No active employees</b>Add people to see workload.</div>');
    END IF;
  END;
  p('</div></div>');

  p('</div>');  -- g2

  --------------------------------------------------------------------
  -- 05 COMPOSITION + 06 ACTIVITY
  --------------------------------------------------------------------
  p('<div class="g2">');

  p('<div class="cd">');
  head('05', 'Composition');
  DECLARE
    l_cur SYS_REFCURSOR;
  BEGIN
    -- Ramp class by sort order; ON_HOLD is the one state here that
    -- means "stalled", so it takes the amber exception.
    OPEN l_cur FOR
      SELECT s.status_name, COUNT(pj.project_id),
             CASE WHEN s.status_code = 'ON_HOLD' THEN 'xw'
                  ELSE 't'||LEAST(5, ROW_NUMBER() OVER (ORDER BY s.sort_order)) END
        FROM status s
        LEFT JOIN project pj ON pj.status_id = s.status_id
       WHERE s.entity_type = 'PROJECT'
       GROUP BY s.status_name, s.status_code, s.sort_order
       ORDER BY s.sort_order;
    render_mix('Projects by status', l_projects, l_cur);

    OPEN l_cur FOR
      SELECT s.status_name, COUNT(t.task_id),
             CASE WHEN s.status_code = 'BLOCKED' THEN 'xl'
                  ELSE 't'||LEAST(5, ROW_NUMBER() OVER (ORDER BY s.sort_order)) END
        FROM status s
        LEFT JOIN task t ON t.status_id = s.status_id
       WHERE s.entity_type = 'TASK'
       GROUP BY s.status_name, s.status_code, s.sort_order
       ORDER BY s.sort_order;
    render_mix('Tasks by status', l_tasks, l_cur);

    OPEN l_cur FOR
      SELECT pr.priority_name, COUNT(t.task_id),
             CASE WHEN pr.priority_code = 'CRITICAL' THEN 'xl'
                  ELSE 't'||LEAST(5, ROW_NUMBER() OVER (ORDER BY pr.sort_order)) END
        FROM priority pr
        LEFT JOIN task t ON t.priority_id = pr.priority_id
       GROUP BY pr.priority_name, pr.priority_code, pr.sort_order
       ORDER BY pr.sort_order;
    render_mix('Tasks by priority', l_tasks, l_cur);

    OPEN l_cur FOR
      SELECT d.department_name, COUNT(e.employee_id),
             't'||LEAST(5, ROW_NUMBER() OVER (ORDER BY COUNT(e.employee_id) DESC, d.department_name))
        FROM department d
        LEFT JOIN employee e ON e.department_id = d.department_id
       GROUP BY d.department_name
       ORDER BY COUNT(e.employee_id) DESC, d.department_name;
    render_mix('Headcount by department', l_emps, l_cur);
  END;
  p('</div>');

  p('<div class="cd">');
  head('06', 'Activity', NULL, APEX_PAGE.GET_URL(p_page => 51), 'Audit log');
  p('<div class="rows">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT a.audit_log_id, a.table_name, a.record_id, a.action,
             a.old_values, a.new_values, a.changed_at, a.changed_by,
             CASE a.table_name
               WHEN 'TASK'         THEN (SELECT t.task_name FROM task t WHERE t.task_id = a.record_id)
               WHEN 'PROJECT'      THEN (SELECT pj.project_name FROM project pj
                                          WHERE pj.project_id = a.record_id)
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

        l_title := NVL(r.entity_name, INITCAP(REPLACE(r.table_name,'_',' '))||' #'||r.record_id);

        p('<div class="row"><span class="bd"><span class="nm" style="display:block;">'
          ||esc(l_title)||'</span><span class="sub" style="display:block;">'
          ||INITCAP(REPLACE(r.table_name,'_',' '))||' &middot; '||esc(l_summary)||' &middot; '
          ||esc(r.changed_by)||'</span></span>');
        p('<span class="tag'||CASE r.action WHEN 'INSERT' THEN ' n' WHEN 'DELETE' THEN ' d' END||'">'
          ||LOWER(r.action)||'</span>');
        p('<span class="rt">'||ago(r.changed_at)||'</span></div>');
      EXCEPTION WHEN OTHERS THEN
        p('<div class="row"><span class="bd"><span class="sub">Unable to render entry #'
          ||TO_CHAR(r.audit_log_id)||'</span></span></div>');
      END;
    END LOOP;
    IF NOT l_any THEN
      p('<div class="empty"><b>No activity yet</b>Changes to core records show up here.</div>');
    END IF;
  END;
  p('</div></div>');

  p('</div>');  -- g2

  --------------------------------------------------------------------
  -- 07 PULSE
  --------------------------------------------------------------------
  DECLARE
    TYPE t_num IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    l_cnt    t_num;
    l_max    NUMBER := 0;
    l_total  NUMBER := 0;
    l_bars   VARCHAR2(16000);
    l_lbls   VARCHAR2(8000);
    l_peak_d VARCHAR2(20);
    c_days CONSTANT PLS_INTEGER := 14;
  BEGIN
    FOR i IN 0 .. c_days - 1 LOOP
      SELECT COUNT(*) INTO l_cnt(i)
        FROM audit_log
       WHERE TRUNC(changed_at) = TRUNC(SYSDATE) - (c_days - 1 - i);
      l_total := l_total + l_cnt(i);
      IF l_cnt(i) > l_max THEN
        l_max    := l_cnt(i);
        l_peak_d := TO_CHAR(SYSDATE - (c_days - 1 - i), 'DD Mon');
      END IF;
    END LOOP;

    FOR i IN 0 .. c_days - 1 LOOP
      l_bars := l_bars||'<i'||CASE WHEN l_cnt(i) = 0 THEN ' class="z"' END||' style="height:'
             || CASE WHEN l_max = 0 OR l_cnt(i) = 0 THEN 2
                     ELSE GREATEST(4, ROUND(l_cnt(i) / l_max * 46)) END
             || 'px;" title="'||TO_CHAR(SYSDATE - (c_days - 1 - i),'Dy DD Mon')||': '
             || l_cnt(i)||' '||plural(l_cnt(i),'change','changes')||'"></i>';
      l_lbls := l_lbls||'<span>'
             || CASE WHEN MOD(c_days - 1 - i, 2) = 0 THEN TO_CHAR(SYSDATE - (c_days - 1 - i),'DD') END
             || '</span>';
    END LOOP;

    p('<div class="cd">');
    head('07', 'Pulse', 'last 14 days &middot; '||l_total||' '||plural(l_total,'change','changes')
         ||CASE WHEN l_max > 0 THEN ' &middot; peak '||l_peak_d||' ('||l_max||')' END);
    p('<div class="pl">'||l_bars||'</div><div class="pd">'||l_lbls||'</div>');
    p('</div>');
  END;

  --------------------------------------------------------------------
  -- 08 WORKSPACE
  --------------------------------------------------------------------
  p('<div class="cd">');
  head('08', 'Workspace', 'reference');
  p('<div class="ws">');

  p('<a href="'||APEX_PAGE.GET_URL(p_page => 5)||'"><span class="wl">Organizations</span>'
    ||'<span class="wn">'||l_orgs||'</span>'
    ||CASE WHEN l_org_new > 0 AND l_org_new < l_orgs THEN '<span class="wd">+'||l_org_new||'</span>' END||'</a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page => 9)||'"><span class="wl">Departments</span>'
    ||'<span class="wn">'||l_depts||'</span>'
    ||CASE WHEN l_dept_new > 0 AND l_dept_new < l_depts THEN '<span class="wd">+'||l_dept_new||'</span>' END||'</a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page => 13)||'"><span class="wl">Employees</span>'
    ||'<span class="wn">'||l_emps||'</span>'
    ||CASE WHEN l_emp_new > 0 AND l_emp_new < l_emps THEN '<span class="wd">+'||l_emp_new||'</span>' END||'</a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page => 15)||'"><span class="wl">Roles</span>'
    ||'<span class="wn">'||l_roles||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page => 19)||'"><span class="wl">Clients</span>'
    ||'<span class="wn">'||l_clients||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page => 4)||'"><span class="wl">Locations</span>'
    ||'<span class="wn">'||l_locs||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page => 17)||'"><span class="wl">User accounts</span>'
    ||'<span class="wn">'||l_users||'</span></a>');

  p('</div></div>');

  p('</div>');  -- .ef

  --------------------------------------------------------------------
  -- LIVE TIMER + AUTO REFRESH
  --------------------------------------------------------------------
  p(q'~<script>
(function(){
  var root = document.querySelector('.ef');
  if (root && !window.__efDashSeen) {
    root.classList.add('anim');
    window.__efDashSeen = true;
  }
  function tick(){
    var ts = document.getElementById('ef-ts');
    var el = document.getElementById('ef-live');
    if (!ts || !el) { return; }
    var secs = Math.floor((Date.now() - new Date(ts.getAttribute('data-ts')).getTime()) / 1000);
    el.textContent = secs < 10 ? 'Live' : secs < 60 ? (secs + 's ago') : (Math.floor(secs / 60) + 'm ago');
  }
  tick();
  if (!window.__efDashLiveTimer) {
    window.__efDashLiveTimer = setInterval(tick, 1000);
  }
  if (!window.__efDashRefreshTimer) {
    window.__efDashRefreshTimer = setInterval(function(){
      // Refreshing swaps the region's innerHTML and drops the reader
      // back to the top. Only do it when they are already up there and
      // the tab is in front; otherwise skip and retry next tick.
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

  IF l_buf IS NOT NULL THEN
    DBMS_LOB.WRITEAPPEND(l_html, LENGTH(l_buf), l_buf);
    l_buf := NULL;
  END IF;

  RETURN l_html;
END render_dashboard_html;
/
