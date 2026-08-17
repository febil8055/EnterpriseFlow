-- ============================================================
-- EnterpriseFlow - Dashboard renderer, v13
--
-- v6 was legible and restrained but still read as a report: eight
-- peer sections, no single answer, data before action. v7 restructures
-- around the three questions a dashboard has five seconds to answer:
--
--     How are we doing?   -> one health figure, top right of the hero
--     What is wrong?      -> exactly three ranked actions, nothing more
--     What do I do next?  -> every one of them carries a verb button
--
-- Everything else is demoted below the fold or to a drill-down link.
--
-- Applied from the design review:
--   * whitespace up ~25% (card padding 26->34px, rows 14->18px)
--   * type up (hero 40->52px, body 17->19px, section 24->26px)
--   * elevation instead of borders - shadow in light, shadow plus a
--     1px hairline in dark, because shadow alone cannot separate two
--     near-black surfaces
--   * eight sections collapsed to five
--   * AI moved out of the nav and onto the page: the hero ask field
--     and the prompt chips drive the existing floating assistant
--     (#efWidgetInput / #efWidgetSend) directly, so answers arrive in
--     place rather than on another page
--   * command palette on Ctrl/Cmd-K over an inlined workspace index
--
-- Deliberately NOT built, because the data cannot support them
-- honestly and a fabricated number is worse than a missing one:
--   * trend arrows / "health dropped 8%" - AUDIT_LOG holds no history
--     to trend against; every row was written on a single day. Real
--     trends need a snapshot table accumulating from here on.
--   * role-based views - the app has no authentication (APEX_USER is
--     'nobody'), so an executive/PM/employee split would be a costume,
--     not personalisation.
--
-- Carried over from v5/v6 and still true: one accent, colour reserved
-- for genuine exceptions, Apple's type scale (17px body, weight 600
-- headings), cached AI insight, audit rows resolved to real names,
-- everything escaped, buffered CLOB writes.
-- ============================================================

CREATE OR REPLACE FUNCTION "RENDER_DASHBOARD_HTML" RETURN CLOB IS

  l_html CLOB;
  l_buf  VARCHAR2(32767);

  l_orgs NUMBER; l_depts NUMBER; l_roles NUMBER; l_users NUMBER;
  l_emps NUMBER; l_clients NUMBER; l_locs NUMBER;

  l_projects NUMBER; l_projects_done NUMBER; l_projects_active NUMBER;
  l_tasks NUMBER; l_tasks_done NUMBER; l_tasks_open NUMBER;
  l_blocked NUMBER; l_overdue NUMBER; l_due_soon NUMBER; l_unassigned NUMBER;
  l_task_pct NUMBER;

  l_health NUMBER; l_health_label VARCHAR2(30); l_ring_off NUMBER;
  l_dial_c1 VARCHAR2(10); l_dial_c2 VARCHAR2(10);   -- gradient stops, banded
  c_circ CONSTANT PLS_INTEGER := 471;      -- 2*pi*75, integer for NLS safety

  l_greeting VARCHAR2(40);
  l_hr NUMBER := TO_NUMBER(TO_CHAR(SYSDATE,'HH24'));
  l_rule_insight VARCHAR2(400);
  l_insight VARCHAR2(400);
  l_insight_src VARCHAR2(10) := 'RULE';
  l_fingerprint VARCHAR2(200);
  c_coll CONSTANT VARCHAR2(30) := 'EF_DASH_INSIGHT';

  l_worst_overdue_id   NUMBER;
  l_worst_overdue_name VARCHAR2(200);
  l_worst_overdue_days NUMBER;
  l_worst_overdue_proj VARCHAR2(200);
  l_first_blocked_id   NUMBER;
  l_first_blocked_name VARCHAR2(200);
  l_first_blocked_proj VARCHAR2(200);

  l_risk_proj_id   NUMBER;
  l_risk_proj_name VARCHAR2(200);
  l_risk_proj_why  VARCHAR2(300);

  l_max_open NUMBER := 0;
  l_med_open NUMBER := 0;

  -- Recommended action: the single highest-impact change available,
  -- with its effect on the health score computed by re-running the
  -- score formula against the counts that change would produce.
  l_rec_kind   VARCHAR2(20);        -- ASSIGN | UNBLOCK | RESOLVE
  l_rec_title  VARCHAR2(300);
  l_rec_why    VARCHAR2(300);
  l_rec_cta    VARCHAR2(60);
  l_rec_href   VARCHAR2(900);
  l_rec_after  NUMBER;
  l_rec_delta  NUMBER := 0;

  l_free_emp_id   NUMBER;
  l_free_emp_name VARCHAR2(200);
  l_free_emp_cnt  NUMBER;

  l_una_task_id   NUMBER;
  l_una_task_name VARCHAR2(200);

  l_d_assign  NUMBER := -1;
  l_d_unblock NUMBER := -1;
  l_d_resolve NUMBER := -1;

  l_url_tasks VARCHAR2(600);
  l_url_ai    VARCHAR2(600);

  -- The three ranked actions shown in the hero.
  TYPE t_action IS RECORD (
    title VARCHAR2(300), meta VARCHAR2(300), cta VARCHAR2(40), href VARCHAR2(900), sev VARCHAR2(10));
  TYPE t_actions IS TABLE OF t_action INDEX BY PLS_INTEGER;
  l_act  t_actions;
  l_nact PLS_INTEGER := 0;

  -- Task ids already claimed by an action. A task that is both overdue
  -- and blocked qualifies under two separate rules, and without this it
  -- was listed twice - burning two of the only three slots on one
  -- problem. Keyed by VARCHAR2 so a NUMBER(19) id cannot overflow the
  -- index type.
  TYPE t_used IS TABLE OF PLS_INTEGER INDEX BY VARCHAR2(40);
  l_used t_used;

  --------------------------------------------------------------------
  PROCEDURE p(p_s IN VARCHAR2) IS
  BEGIN
    IF p_s IS NULL THEN RETURN; END IF;
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
  BEGIN RETURN APEX_ESCAPE.HTML(p_s); END esc;

  FUNCTION js(p_s IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN RETURN APEX_ESCAPE.JSON(p_s); END js;

  FUNCTION plural(p_n IN NUMBER, p_one IN VARCHAR2, p_many IN VARCHAR2) RETURN VARCHAR2 IS
  BEGIN RETURN CASE WHEN p_n = 1 THEN p_one ELSE p_many END; END plural;

  FUNCTION pct(p_part IN NUMBER, p_whole IN NUMBER) RETURN NUMBER IS
  BEGIN RETURN CASE WHEN NVL(p_whole,0) = 0 THEN 0 ELSE ROUND(p_part / p_whole * 100) END; END pct;

  -- The health score as a pure function of its inputs, so the same
  -- formula can be run against hypothetical counts. This is what makes
  -- the predicted impact of a recommendation a computed fact rather
  -- than a number someone made up: "89 -> 92" is health_of() evaluated
  -- twice, once with the unassigned count reduced by one.
  FUNCTION health_of(p_open IN NUMBER, p_overdue IN NUMBER,
                     p_blocked IN NUMBER, p_unassigned IN NUMBER) RETURN NUMBER IS
  BEGIN
    IF NVL(p_open,0) <= 0 THEN
      RETURN 100;
    END IF;
    RETURN GREATEST(0, ROUND(100
             - (p_overdue    / p_open) * 45
             - (p_blocked    / p_open) * 25
             - (p_unassigned / p_open) * 15));
  END health_of;

  -- CSS/SVG numbers must not follow NLS_NUMERIC_CHARACTERS; a comma
  -- decimal would emit width:33,33% and collapse the bar.
  FUNCTION num(p_n IN NUMBER) RETURN VARCHAR2 IS
  BEGIN RETURN TRIM(TO_CHAR(p_n, 'FM99999990.00', 'NLS_NUMERIC_CHARACTERS=''.,''')); END num;

  FUNCTION ago(p_ts IN TIMESTAMP) RETURN VARCHAR2 IS
    l_min NUMBER;
  BEGIN
    l_min := (CAST(SYSTIMESTAMP AS DATE) - CAST(p_ts AS DATE)) * 1440;
    RETURN CASE WHEN l_min < 1 THEN 'now'
                WHEN l_min < 60 THEN ROUND(l_min)||'m'
                WHEN l_min < 1440 THEN ROUND(l_min/60)||'h'
                WHEN l_min < 10080 THEN ROUND(l_min/1440)||'d'
                ELSE TO_CHAR(p_ts,'DD Mon') END;
  END ago;

  PROCEDURE add_action(p_title VARCHAR2, p_meta VARCHAR2, p_cta VARCHAR2,
                       p_href VARCHAR2, p_sev VARCHAR2,
                       p_task_id NUMBER DEFAULT NULL) IS
  BEGIN
    IF l_nact >= 3 THEN RETURN; END IF;      -- three. never four.

    -- Same task already listed under another rule: skip it and let the
    -- next candidate take the slot, so three actions means three
    -- distinct problems.
    IF p_task_id IS NOT NULL THEN
      IF l_used.EXISTS(TO_CHAR(p_task_id)) THEN
        RETURN;
      END IF;
      l_used(TO_CHAR(p_task_id)) := 1;
    END IF;

    l_nact := l_nact + 1;
    l_act(l_nact).title := p_title;
    l_act(l_nact).meta  := p_meta;
    l_act(l_nact).cta   := p_cta;
    l_act(l_nact).href  := p_href;
    l_act(l_nact).sev   := p_sev;
  END add_action;

  PROCEDURE head(p_title VARCHAR2, p_note VARCHAR2 DEFAULT NULL,
                 p_href VARCHAR2 DEFAULT NULL, p_link VARCHAR2 DEFAULT NULL) IS
  BEGIN
    p('<div class="hd"><h2>'||esc(p_title)||'</h2>');
    IF p_note IS NOT NULL THEN p('<span class="note">'||p_note||'</span>'); END IF;
    p('<span class="sp"></span>');
    IF p_href IS NOT NULL THEN
      p('<a class="more" href="'||p_href||'">'||esc(p_link)||'</a>');
    END IF;
    p('</div>');
  END head;

BEGIN
  DBMS_LOB.CREATETEMPORARY(l_html, TRUE);

  l_url_tasks := APEX_PAGE.GET_URL(p_page => 42);
  l_url_ai    := APEX_PAGE.GET_URL(p_page => 49);

  --------------------------------------------------------------------
  -- METRICS
  --------------------------------------------------------------------
  -- ACTIVE_FLAG is the soft-delete switch (see 02_tables.sql). Every
  -- count, list and metric below filters on it: a retired row must not
  -- appear in a total, a chart, a recommendation or the palette.
  SELECT COUNT(*) INTO l_orgs    FROM organization WHERE active_flag = 'Y';
  SELECT COUNT(*) INTO l_depts   FROM department   WHERE active_flag = 'Y';
  SELECT COUNT(*) INTO l_roles   FROM role         WHERE active_flag = 'Y';
  SELECT COUNT(*) INTO l_users   FROM user_account WHERE active_flag = 'Y';
  SELECT COUNT(*) INTO l_emps    FROM employee     WHERE active_flag = 'Y';
  SELECT COUNT(*) INTO l_clients FROM client       WHERE active_flag = 'Y';
  SELECT COUNT(*) INTO l_locs    FROM location     WHERE active_flag = 'Y';

  SELECT COUNT(*),
         COUNT(CASE WHEN s.status_code = 'COMPLETED' THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('COMPLETED','CANCELLED') THEN 1 END)
    INTO l_projects, l_projects_done, l_projects_active
    FROM project p JOIN status s ON s.status_id = p.status_id
   WHERE p.active_flag = 'Y';

  SELECT COUNT(*),
         COUNT(CASE WHEN s.status_code = 'DONE' THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('DONE','CANCELLED') THEN 1 END),
         COUNT(CASE WHEN s.status_code = 'BLOCKED' THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('DONE','CANCELLED')
                     AND t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE) THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('DONE','CANCELLED')
                     AND t.due_date IS NOT NULL AND t.due_date >= TRUNC(SYSDATE)
                     AND t.due_date <= TRUNC(SYSDATE) + 7 THEN 1 END),
         COUNT(CASE WHEN s.status_code NOT IN ('DONE','CANCELLED')
                     AND t.assigned_to_employee_id IS NULL THEN 1 END)
    INTO l_tasks, l_tasks_done, l_tasks_open, l_blocked, l_overdue, l_due_soon, l_unassigned
    FROM task t JOIN status s ON s.status_id = t.status_id
   WHERE t.active_flag = 'Y';

  l_task_pct := pct(l_tasks_done, l_tasks);

  l_health := health_of(l_tasks_open, l_overdue, l_blocked, l_unassigned);

  l_health_label := CASE WHEN l_health >= 90 THEN 'Excellent'
                         WHEN l_health >= 75 THEN 'Healthy'
                         WHEN l_health >= 60 THEN 'Fair'
                         WHEN l_health >= 40 THEN 'At risk'
                         ELSE 'Critical' END;

  -- Apple system colours, light stop to dark stop so the arc has depth.
  IF l_health >= 75 THEN
    l_dial_c1 := '#5ae085'; l_dial_c2 := '#1d9e57';
  ELSIF l_health >= 60 THEN
    l_dial_c1 := '#ffd166'; l_dial_c2 := '#e08600';
  ELSIF l_health >= 40 THEN
    l_dial_c1 := '#ffb340'; l_dial_c2 := '#e06c00';
  ELSE
    l_dial_c1 := '#ff8a80'; l_dial_c2 := '#d70015';
  END IF;

  l_ring_off := ROUND(c_circ * (1 - l_health / 100));

  --------------------------------------------------------------------
  -- The specific things that are wrong
  --------------------------------------------------------------------
  BEGIN
    SELECT task_id, task_name, days_late, pname
      INTO l_worst_overdue_id, l_worst_overdue_name, l_worst_overdue_days, l_worst_overdue_proj
      FROM (SELECT t.task_id, t.task_name, TRUNC(SYSDATE) - TRUNC(t.due_date) days_late,
                   pj.project_name pname
              FROM task t
              JOIN status s ON s.status_id = t.status_id
              LEFT JOIN project pj ON pj.project_id = t.project_id
             WHERE s.status_code NOT IN ('DONE','CANCELLED')
               AND t.active_flag = 'Y'
               AND t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE)
             ORDER BY t.due_date)
     WHERE ROWNUM = 1;
  EXCEPTION WHEN NO_DATA_FOUND THEN l_worst_overdue_id := NULL;
  END;

  BEGIN
    SELECT task_id, task_name, pname
      INTO l_first_blocked_id, l_first_blocked_name, l_first_blocked_proj
      FROM (SELECT t.task_id, t.task_name, pj.project_name pname
              FROM task t
              JOIN status s ON s.status_id = t.status_id
              LEFT JOIN project pj ON pj.project_id = t.project_id
             WHERE s.status_code = 'BLOCKED'
               AND t.active_flag = 'Y'
             -- Sort the worst-overdue task last: if some other task is
             -- blocked, show that one instead of repeating the item
             -- already listed as overdue. If it is the only blocked
             -- task, add_action's dedupe drops it and the slot falls
             -- through to the next distinct problem.
             ORDER BY CASE WHEN t.task_id = l_worst_overdue_id THEN 1 ELSE 0 END,
                      t.task_id)
     WHERE ROWNUM = 1;
  EXCEPTION WHEN NO_DATA_FOUND THEN l_first_blocked_id := NULL;
  END;

  -- Riskiest project. A transparent weighted count, not a prediction -
  -- the weights say an overdue task hurts more than an unowned one.
  BEGIN
    SELECT project_id, project_name, why
      INTO l_risk_proj_id, l_risk_proj_name, l_risk_proj_why
      FROM (SELECT pj.project_id, pj.project_name,
                   RTRIM(
                     CASE WHEN od  > 0 THEN od ||' overdue, ' END ||
                     CASE WHEN bl  > 0 THEN bl ||' blocked, ' END ||
                     CASE WHEN un  > 0 THEN un ||' unassigned, ' END ||
                     CASE WHEN s.status_code = 'ON_HOLD' THEN 'on hold, ' END, ', ') why,
                   (od * 3 + bl * 2 + un + CASE WHEN s.status_code = 'ON_HOLD' THEN 2 ELSE 0 END
                     + CASE WHEN pj.end_date IS NOT NULL AND pj.end_date < TRUNC(SYSDATE)
                            THEN 3 ELSE 0 END) risk
              FROM project pj
              JOIN status s ON s.status_id = pj.status_id
              CROSS APPLY (
                SELECT COUNT(CASE WHEN ts.status_code NOT IN ('DONE','CANCELLED')
                                   AND t.due_date IS NOT NULL
                                   AND t.due_date < TRUNC(SYSDATE) THEN 1 END) od,
                       COUNT(CASE WHEN ts.status_code = 'BLOCKED' THEN 1 END) bl,
                       COUNT(CASE WHEN ts.status_code NOT IN ('DONE','CANCELLED')
                                   AND t.assigned_to_employee_id IS NULL THEN 1 END) un
                  FROM task t JOIN status ts ON ts.status_id = t.status_id
                 WHERE t.project_id = pj.project_id
                   AND t.active_flag = 'Y') c
             WHERE s.status_code NOT IN ('COMPLETED','CANCELLED')
               AND pj.active_flag = 'Y'
             ORDER BY risk DESC, pj.project_name)
     WHERE ROWNUM = 1 AND why IS NOT NULL;
  EXCEPTION WHEN NO_DATA_FOUND THEN l_risk_proj_id := NULL;
  END;

  --------------------------------------------------------------------
  -- THE THREE ACTIONS, in priority order
  --------------------------------------------------------------------
  -- meta is emitted as markup (it carries &middot; separators), so any
  -- database value inside it has to be escaped here at construction.
  IF l_worst_overdue_id IS NOT NULL THEN
    add_action(l_worst_overdue_name,
               esc(NVL(l_worst_overdue_proj,'No project'))||' &middot; '||l_worst_overdue_days||' '
                 ||plural(l_worst_overdue_days,'day','days')||' late',
               'Resolve',
               APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID',
                                 p_values => TO_CHAR(l_worst_overdue_id)),
               'late', l_worst_overdue_id);
  END IF;

  IF l_risk_proj_id IS NOT NULL THEN
    add_action(l_risk_proj_name, 'Highest-risk project &middot; '||esc(l_risk_proj_why), 'Open',
               APEX_PAGE.GET_URL(p_page => 41, p_items => 'P41_PROJECT_ID',
                                 p_values => TO_CHAR(l_risk_proj_id)),
               'warn');
  END IF;

  IF l_first_blocked_id IS NOT NULL THEN
    add_action(l_first_blocked_name,
               esc(NVL(l_first_blocked_proj,'No project'))||' &middot; blocked, waiting on someone',
               'Unblock',
               APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID',
                                 p_values => TO_CHAR(l_first_blocked_id)),
               'warn', l_first_blocked_id);
  END IF;

  IF l_unassigned > 0 THEN
    add_action(l_unassigned||' open '||plural(l_unassigned,'task has','tasks have')||' no owner',
               'Unassigned work stalls silently', 'Assign', l_url_tasks, 'info');
  END IF;

  IF l_due_soon > 0 THEN
    add_action(l_due_soon||' '||plural(l_due_soon,'task is','tasks are')||' due this week',
               'Next seven days', 'Review', l_url_tasks, 'info');
  END IF;

  --------------------------------------------------------------------
  -- RECOMMENDED ACTION
  --
  -- Three levers can move the score, and each one's effect is the same
  -- formula re-run with one count decremented. Resolving an overdue
  -- task also closes it, so it drops out of the open population too.
  -- Whichever lever moves the number most, wins; ties break toward the
  -- more urgent problem.
  --------------------------------------------------------------------
  IF l_unassigned > 0 THEN
    l_d_assign := health_of(l_tasks_open, l_overdue, l_blocked, l_unassigned - 1) - l_health;
  END IF;
  IF l_blocked > 0 THEN
    l_d_unblock := health_of(l_tasks_open, l_overdue, l_blocked - 1, l_unassigned) - l_health;
  END IF;
  IF l_overdue > 0 THEN
    l_d_resolve := health_of(l_tasks_open - 1, l_overdue - 1, l_blocked, l_unassigned) - l_health;
  END IF;

  -- Who has the most room. A real capacity signal, not a guess.
  IF l_unassigned > 0 THEN
    BEGIN
      SELECT employee_id, nm, cnt INTO l_free_emp_id, l_free_emp_name, l_free_emp_cnt
        FROM (SELECT e.employee_id, e.first_name||' '||e.last_name nm,
                     (SELECT COUNT(*) FROM task t JOIN status s ON s.status_id = t.status_id
                       WHERE t.assigned_to_employee_id = e.employee_id
                         AND t.active_flag = 'Y'
                         AND s.status_code NOT IN ('DONE','CANCELLED')) cnt
                FROM employee e
               WHERE e.active_flag = 'Y'
               ORDER BY cnt, e.last_name)
       WHERE ROWNUM = 1;
    EXCEPTION WHEN NO_DATA_FOUND THEN l_free_emp_id := NULL;
    END;

    BEGIN
      SELECT task_id, task_name INTO l_una_task_id, l_una_task_name
        FROM (SELECT t.task_id, t.task_name
                FROM task t
                JOIN status s ON s.status_id = t.status_id
                LEFT JOIN priority pr ON pr.priority_id = t.priority_id
               WHERE s.status_code NOT IN ('DONE','CANCELLED')
                 AND t.active_flag = 'Y'
                 AND t.assigned_to_employee_id IS NULL
               ORDER BY NVL(pr.sort_order,0) DESC, NVL(t.due_date, DATE '9999-12-31'), t.task_id)
       WHERE ROWNUM = 1;
    EXCEPTION WHEN NO_DATA_FOUND THEN l_una_task_id := NULL;
    END;
  END IF;

  IF l_d_resolve >= l_d_unblock AND l_d_resolve >= l_d_assign AND l_worst_overdue_id IS NOT NULL THEN
    l_rec_kind  := 'RESOLVE';
    l_rec_delta := l_d_resolve;
    l_rec_title := 'Close out "'||l_worst_overdue_name||'"';
    l_rec_why   := 'It is '||l_worst_overdue_days||' '||plural(l_worst_overdue_days,'day','days')
                 ||' past due on '||NVL(l_worst_overdue_proj,'no project')
                 ||' - the oldest overdue item in the workspace.';
    l_rec_cta   := 'Open task';
    l_rec_href  := APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID',
                                     p_values => TO_CHAR(l_worst_overdue_id));
  ELSIF l_d_unblock >= l_d_assign AND l_first_blocked_id IS NOT NULL THEN
    l_rec_kind  := 'UNBLOCK';
    l_rec_delta := l_d_unblock;
    l_rec_title := 'Unblock "'||l_first_blocked_name||'"';
    l_rec_why   := 'Blocked work on '||NVL(l_first_blocked_proj,'no project')
                 ||' stalls everything behind it and nothing else can start it moving.';
    l_rec_cta   := 'Open task';
    l_rec_href  := APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID',
                                     p_values => TO_CHAR(l_first_blocked_id));
  ELSIF l_una_task_id IS NOT NULL AND l_free_emp_id IS NOT NULL THEN
    l_rec_kind  := 'ASSIGN';
    l_rec_delta := l_d_assign;
    l_rec_title := 'Assign "'||l_una_task_name||'" to '||l_free_emp_name;
    l_rec_why   := 'Nobody owns it, and '||l_free_emp_name||' is the least loaded person on the team with '
                 ||l_free_emp_cnt||' open '||plural(l_free_emp_cnt,'task','tasks')||'.';
    l_rec_cta   := 'Open task';
    l_rec_href  := APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID',
                                     p_values => TO_CHAR(l_una_task_id));
  END IF;

  IF l_rec_kind IS NOT NULL THEN
    l_rec_after := l_health + l_rec_delta;
  END IF;

  --------------------------------------------------------------------
  -- INSIGHT (rule-based baseline, AI when available and cached)
  --------------------------------------------------------------------
  l_greeting := CASE WHEN l_hr < 12 THEN 'Good morning'
                     WHEN l_hr < 17 THEN 'Good afternoon'
                     ELSE 'Good evening' END;

  IF l_overdue > 0 THEN
    l_rule_insight := l_overdue||' '||plural(l_overdue,'task is','tasks are')||' past due'
                   || CASE WHEN l_worst_overdue_name IS NOT NULL
                           THEN ', the worst by '||l_worst_overdue_days||' '
                                ||plural(l_worst_overdue_days,'day','days') END
                   || CASE WHEN l_blocked > 0 THEN ', and '||l_blocked||' more '
                                ||plural(l_blocked,'is','are')||' blocked' END||'.';
  ELSIF l_blocked > 0 THEN
    l_rule_insight := l_blocked||' '||plural(l_blocked,'task is','tasks are')||' blocked'
                   || CASE WHEN l_first_blocked_name IS NOT NULL
                           THEN ', starting with "'||l_first_blocked_name||'"' END||'.';
  ELSIF l_unassigned > 0 THEN
    l_rule_insight := l_unassigned||' open '||plural(l_unassigned,'task has','tasks have')||' no owner yet.';
  ELSIF l_due_soon > 0 THEN
    l_rule_insight := l_due_soon||' '||plural(l_due_soon,'task is','tasks are')||' due in the next seven days.';
  ELSIF l_tasks_open = 0 AND l_tasks > 0 THEN
    l_rule_insight := 'Everything is closed out across '||l_projects||' '
                   || plural(l_projects,'project','projects')||'.';
  ELSE
    l_rule_insight := l_projects_active||' active '||plural(l_projects_active,'project','projects')||' and '
                   || l_tasks_open||' open '||plural(l_tasks_open,'task','tasks')||', nothing flagged.';
  END IF;

  l_insight := l_rule_insight;

  -- The leading token is the prompt version. Without it a cached brief
  -- written by an older prompt survives until the counts happen to
  -- change, so a prompt fix appears not to work. Bump it whenever the
  -- prompt below is edited.
  l_fingerprint := 'p2|'
                || l_projects||'.'||l_projects_active||'.'||l_projects_done||'.'||l_tasks||'.'
                || l_tasks_done||'.'||l_tasks_open||'.'||l_blocked||'.'||l_overdue||'.'
                || l_due_soon||'.'||l_unassigned||'.'||l_emps;

  DECLARE
    l_cached_fp VARCHAR2(200); l_cached_txt VARCHAR2(400); l_cached_at DATE;
    l_fresh BOOLEAN := FALSE; l_prompt VARCHAR2(4000); l_raw CLOB;
  BEGIN
    IF APEX_COLLECTION.COLLECTION_EXISTS(c_coll) THEN
      BEGIN
        SELECT c001, c002, d001 INTO l_cached_fp, l_cached_txt, l_cached_at
          FROM apex_collections WHERE collection_name = c_coll AND seq_id = 1;
        IF l_cached_fp = l_fingerprint AND l_cached_txt IS NOT NULL
           AND l_cached_at > SYSDATE - INTERVAL '15' MINUTE THEN
          l_insight := l_cached_txt; l_insight_src := 'AI'; l_fresh := TRUE;
        END IF;
      EXCEPTION WHEN NO_DATA_FOUND THEN l_fresh := FALSE;
      END;
    END IF;

    IF NOT l_fresh THEN
      -- One labelled figure per line. The previous version wrote
      -- "17 projects (14 active, 2 completed)" and the model read the
      -- total as the active count, putting "seventeen active projects"
      -- on screen next to a header saying 14. Nothing here is nested
      -- inside a bracket any more, and the total is not supplied at
      -- all, so there is nothing to conflate.
      l_prompt :=
        'EnterpriseFlow workspace as of '||TO_CHAR(SYSDATE,'DD Mon YYYY')||'.'||CHR(10)
        ||'Active projects: '||l_projects_active||CHR(10)
        ||'Completed projects: '||l_projects_done||CHR(10)
        ||'Open tasks: '||l_tasks_open||CHR(10)
        ||'Completed tasks: '||l_tasks_done||CHR(10)
        ||'Overdue tasks: '||l_overdue||CHR(10)
        ||'Blocked tasks: '||l_blocked||CHR(10)
        ||'Unassigned open tasks: '||l_unassigned||CHR(10)
        ||'Tasks due within 7 days: '||l_due_soon||CHR(10)
        ||'Employees: '||l_emps||CHR(10)
        ||CASE WHEN l_worst_overdue_name IS NOT NULL
               THEN 'Worst overdue task: "'||l_worst_overdue_name||'", '
                    ||l_worst_overdue_days||' days late.'||CHR(10) END
        ||CASE WHEN l_risk_proj_name IS NOT NULL
               THEN 'Riskiest project: "'||l_risk_proj_name||'" ('||l_risk_proj_why||').'||CHR(10) END
        ||CHR(10)
        ||'Brief an executive in exactly two short sentences, 30 words total maximum.'
        ||' First sentence: the single most important thing to act on, and why it matters.'
        ||' Second sentence: one line of overall context.'
        ||' Use only the figures above and keep each one attached to its own label -'
        ||' never describe a total as "active", and never state a number that is not listed.'
        ||' Plain text only, no markdown, no greeting.';

      l_raw := APEX_AI.GENERATE(
                 p_prompt        => l_prompt,
                 p_system_prompt => 'You are a sharp, concise chief of staff briefing an executive.',
                 p_temperature   => 0.3);
      l_raw := TRIM(REPLACE(REPLACE(l_raw, CHR(10), ' '), CHR(13), ' '));

      IF l_raw IS NOT NULL AND LENGTH(l_raw) > 0 THEN
        l_insight := SUBSTR(l_raw, 1, 300); l_insight_src := 'AI';
        APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(c_coll);
        APEX_COLLECTION.ADD_MEMBER(p_collection_name => c_coll, p_c001 => l_fingerprint,
                                   p_c002 => l_insight, p_d001 => SYSDATE);
      END IF;
    END IF;
  EXCEPTION WHEN OTHERS THEN
    l_insight := l_rule_insight; l_insight_src := 'RULE';
  END;

  --------------------------------------------------------------------
  -- STYLES
  --------------------------------------------------------------------
  p(q'~<style>
.ef{
  --ink:#1d1d1f; --ink2:#424245; --muted:#6e6e73; --faint:#86868b;
  --card:#ffffff; --sunk:#f5f5f7; --hair:rgba(0,0,0,0);
  --accent:#0071e3;
  --late:#d70015; --warn:#a1560a; --good:#1d7a45;
  --lift:0 1px 2px rgba(0,0,0,.04), 0 10px 30px -14px rgba(0,0,0,.14);
  --lift2:0 2px 6px rgba(0,0,0,.06), 0 24px 50px -20px rgba(0,0,0,.22);
  --track:rgba(0,0,0,.09);
  font-family:-apple-system,BlinkMacSystemFont,"SF Pro Text","SF Pro Display","Segoe UI",Roboto,Helvetica,Arial,sans-serif;
  color:var(--ink);font-size:19px;line-height:1.47;letter-spacing:-.022em;
  -webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;
}
html[data-theme="dark"] .ef{
  --ink:#f5f5f7; --ink2:#d2d2d7; --muted:#a1a1a6; --faint:#86868b;
  --card:#16181c; --sunk:#1f2227;
  /* Shadow alone cannot separate two near-black surfaces, so dark mode
     keeps a single hairline. Light mode uses pure elevation. */
  --hair:rgba(255,255,255,.07);
  --accent:#2997ff;
  --late:#ff6961; --warn:#ffb340; --good:#30d158;
  --lift:0 1px 2px rgba(0,0,0,.5), 0 10px 30px -14px rgba(0,0,0,.9);
  --lift2:0 2px 6px rgba(0,0,0,.6), 0 24px 50px -20px rgba(0,0,0,1);
  --track:rgba(255,255,255,.12);
}
.ef *{box-sizing:border-box;}
.ef a{text-decoration:none;color:inherit;}

.cd{background:var(--card);border:1px solid var(--hair);border-radius:22px;
  box-shadow:var(--lift);padding:34px 36px;margin-bottom:22px;}
.hd{display:flex;align-items:baseline;gap:14px;margin-bottom:24px;flex-wrap:wrap;}
.hd h2{font-size:26px;font-weight:600;letter-spacing:-.021em;margin:0;}
.hd .note{font-size:17px;color:var(--muted);letter-spacing:-.015em;}
.hd .sp{flex:1;min-width:8px;}
.ef a.more{font-size:17px;color:var(--accent);white-space:nowrap;letter-spacing:-.02em;}
.ef a.more:hover{text-decoration:underline;}
.g2{display:grid;grid-template-columns:1fr 1fr;gap:22px;}
.g2 > .cd{margin-bottom:0;}

/* ---------- hero ----------
   v7 left the hero as bare text on the page background, which read as
   unfinished white space. It now sits on the same elevated surface as
   every other section, so the most important content is not the only
   thing without a home. */
.hero{background:var(--card);border:1px solid var(--hair);border-radius:26px;
  box-shadow:var(--lift);padding:40px 44px;margin-bottom:22px;
  display:grid;grid-template-columns:minmax(0,1fr) auto;gap:52px;align-items:center;}
.kick{display:flex;align-items:center;gap:11px;font-size:16px;color:var(--muted);margin-bottom:16px;}
.kick .dot{width:7px;height:7px;border-radius:50%;background:var(--good);flex:none;}
.kick .sep{color:var(--track);}
.hero h1{font-size:52px;font-weight:600;letter-spacing:-.03em;line-height:1.06;margin:0 0 22px;}

/* The AI brief is the single most valuable sentence on the page, so it
   gets its own surface: a faint accent wash and a gradient spine.
   color-mix keeps it derived from the accent rather than a hardcoded
   tint, so it follows the theme; the flat --sunk before it is the
   fallback for engines without color-mix. */
.brief{position:relative;border-radius:16px;overflow:hidden;
  padding:22px 26px 22px 30px;max-width:52ch;background:var(--sunk);}
.brief{background:linear-gradient(180deg,
  color-mix(in srgb,var(--accent) 7%,var(--card)),
  color-mix(in srgb,var(--accent) 2%,var(--card)));}
.brief::before{content:"";position:absolute;left:0;top:0;bottom:0;width:3px;
  background:linear-gradient(180deg,var(--accent),
    color-mix(in srgb,var(--accent) 25%,transparent));}
.brief-l{display:flex;align-items:center;gap:7px;font-size:12px;font-weight:600;
  letter-spacing:.09em;color:var(--accent);margin-bottom:10px;}
.brief p{margin:0;font-size:22px;font-weight:400;line-height:1.4;
  letter-spacing:-.021em;color:var(--ink);}

/* ---------- recommended action ----------
   Sits directly under the brief because it is the same intelligence
   layer: the brief says what is wrong, this says what to do about it
   and what it is worth. */
.rec{display:flex;gap:32px;align-items:flex-start;flex-wrap:wrap;
  margin-top:16px;padding:22px 26px;border-radius:16px;background:var(--sunk);}
.rec-b{flex:1;min-width:260px;}
.rec-r{flex:none;min-width:190px;}
.rec-l{font-size:11.5px;font-weight:600;letter-spacing:.09em;color:var(--muted);margin-bottom:9px;}
.rec-t{font-size:20px;font-weight:500;color:var(--ink);letter-spacing:-.021em;line-height:1.3;}
.rec-w{font-size:16px;color:var(--muted);margin-top:7px;line-height:1.45;letter-spacing:-.012em;}
.rec-n{display:flex;align-items:baseline;gap:9px;}
.rec-n .f{font-size:26px;font-weight:600;color:var(--muted);letter-spacing:-.03em;}
.rec-n .a{font-size:18px;color:var(--faint);}
.rec-n .t{font-size:34px;font-weight:600;color:var(--ink);letter-spacing:-.03em;}
.rec-n .d{font-size:15px;font-weight:600;color:var(--good);}
.rec-u{font-size:14px;color:var(--muted);margin-top:3px;letter-spacing:-.01em;}
.ef a.rec-go{display:inline-flex;align-items:center;margin-top:16px;font-size:16px;font-weight:500;
  padding:11px 20px;border-radius:980px;background:var(--accent);color:#fff;
  letter-spacing:-.015em;transition:opacity .15s;}
.ef a.rec-go:hover{opacity:.85;}
@media (max-width:700px){ .rec{gap:20px;} .rec-r{min-width:0;} }

/* search / ask field - the Ctrl-K entry point. Sunken inside the hero
   card rather than raised, so it does not read as a card-in-a-card. */
.omni{display:flex;align-items:center;gap:12px;margin-top:22px;max-width:520px;
  background:var(--sunk);border-radius:14px;padding:14px 18px;cursor:text;
  transition:background .18s;}
.omni:hover{background:var(--track);}
.omni svg{flex:none;color:var(--faint);}
.omni span{flex:1;font-size:17px;color:var(--faint);letter-spacing:-.02em;}
.omni kbd{font-family:inherit;font-size:13px;font-weight:600;color:var(--muted);
  background:var(--card);border-radius:6px;padding:4px 9px;letter-spacing:0;}

/* ---------- health dial ----------
   A 5px stroke at 89% with a rounded cap reads as a battery gauge.
   Thickening it to 14px with a gradient fill and a nearly invisible
   track turns it into a score dial instead. Colour is banded, which is
   meaningful rather than decorative: this is the one number the page
   exists to communicate. */
.dial{position:relative;width:196px;height:196px;flex:none;}
.dial svg.r{transform:rotate(-90deg);display:block;width:196px;height:196px;}
.dial .tr{fill:none;stroke:var(--track);stroke-width:14;opacity:.5;}
.dial .vl{fill:none;stroke-width:14;stroke-linecap:round;}
.dial .ct{position:absolute;inset:0;display:flex;flex-direction:column;
  align-items:center;justify-content:center;}
.dial .n{font-size:64px;font-weight:600;letter-spacing:-.04em;line-height:1;}
.dial .l{font-size:15px;font-weight:600;letter-spacing:-.01em;margin-top:6px;}
.dial-c{text-align:center;font-size:15px;color:var(--muted);margin-top:14px;letter-spacing:-.014em;}
.dwrap{display:flex;flex-direction:column;align-items:center;flex:none;}

/* ---------- the three actions ---------- */
.acts{display:flex;flex-direction:column;}
.act{display:flex;align-items:center;gap:20px;padding:22px 10px;border-top:1px solid var(--track);
  border-radius:14px;transition:background .15s;}
.act:first-of-type{border-top:none;}
.act:hover{background:var(--sunk);}
.rank{width:30px;height:30px;border-radius:50%;flex:none;display:flex;align-items:center;
  justify-content:center;font-size:15px;font-weight:600;background:var(--sunk);color:var(--muted);}
.act.late .rank{background:var(--late);color:#fff;}
.act.warn .rank{background:var(--warn);color:#fff;}
.act .bd{flex:1;min-width:0;}
/* Every one of these sits inside an <a>, and custom.css colours bare
   links #5eb1ff in dark mode. Without an explicit colour they inherit
   it and the whole row turns link-blue. */
.act .t{display:block;font-size:21px;font-weight:500;color:var(--ink);letter-spacing:-.021em;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.act .m{display:block;font-size:16px;color:var(--muted);margin-top:4px;letter-spacing:-.014em;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.go{flex:none;font-size:16px;font-weight:500;color:var(--accent);
  padding:10px 18px;border-radius:980px;background:var(--sunk);transition:background .15s,color .15s;}
.act:hover .go{background:var(--accent);color:#fff;}
.allclear{display:flex;align-items:center;gap:14px;padding:14px 10px;font-size:19px;color:var(--muted);}
.allclear i{width:26px;height:26px;border-radius:50%;background:var(--good);flex:none;
  display:flex;align-items:center;justify-content:center;color:#fff;font-size:14px;font-style:normal;}

/* ---------- AI prompt chips ---------- */
.chips{display:flex;gap:12px;flex-wrap:wrap;}
.chip{font-size:16px;letter-spacing:-.015em;padding:12px 18px;border-radius:980px;
  background:var(--sunk);color:var(--ink2);cursor:pointer;border:1px solid var(--hair);
  transition:background .15s,color .15s,transform .15s;font-family:inherit;}
.chip:hover{background:var(--accent);color:#fff;transform:translateY(-1px);}

/* ---------- project cards ---------- */
.pgrid{display:grid;grid-template-columns:repeat(auto-fit,minmax(290px,1fr));gap:16px;}
.pc{background:var(--sunk);border-radius:16px;padding:20px 22px;transition:transform .18s,box-shadow .18s;}
.pc:hover{transform:translateY(-2px);box-shadow:var(--lift);}
.pc .t{font-size:19px;font-weight:500;color:var(--ink);letter-spacing:-.021em;margin-bottom:5px;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.pc .s{font-size:15px;color:var(--muted);margin-bottom:16px;letter-spacing:-.01em;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.pbar{display:flex;height:6px;border-radius:3px;overflow:hidden;background:var(--track);margin-bottom:12px;}
.pbar i{display:block;height:100%;}
.pbar .d{background:var(--muted);}
.pbar .p{background:var(--accent);}
.pf{display:flex;align-items:center;gap:12px;font-size:15px;color:var(--muted);letter-spacing:-.01em;}
.pf .r{margin-left:auto;font-weight:600;}
.pf .r.late{color:var(--late);}
.pf .r.warn{color:var(--warn);}
.pf .r.ok{color:var(--muted);font-weight:400;}

/* ---------- rows ---------- */
.rows{display:flex;flex-direction:column;}
.row{display:flex;align-items:center;gap:18px;padding:18px 10px;border-top:1px solid var(--track);
  border-radius:12px;transition:background .15s;}
.row:first-child{border-top:none;}
.row:hover{background:var(--sunk);}
.row:hover .nm{color:var(--accent);}
.bd{flex:1;min-width:0;}
/* colour is required here: .nm sits inside an <a>, and the theme
   colours bare links blue, which would turn every row title into a
   link-blue string. */
.nm{display:block;font-size:19px;font-weight:400;color:var(--ink);letter-spacing:-.022em;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.sub{font-size:16px;color:var(--muted);letter-spacing:-.014em;display:block;margin-top:2px;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.dt{font-size:16px;font-weight:600;color:var(--ink);width:70px;flex:none;letter-spacing:-.014em;}
.dt.l{color:var(--late);} .dt.s{color:var(--warn);}
.rt{font-size:16px;color:var(--muted);white-space:nowrap;flex:none;letter-spacing:-.014em;}
.rt.l{color:var(--late);font-weight:600;} .rt.s{color:var(--warn);font-weight:600;}
.av{width:42px;height:42px;border-radius:50%;flex:none;display:flex;align-items:center;
  justify-content:center;font-size:15px;font-weight:600;letter-spacing:0;
  color:var(--ink2);background:var(--sunk);}
.load{width:104px;flex:none;}
.load .t2{height:6px;border-radius:3px;background:var(--track);overflow:hidden;}
.load .f{height:100%;background:var(--accent);border-radius:3px;}
.load .f.over{background:var(--warn);}
.load .c{font-size:14px;color:var(--muted);margin-top:7px;text-align:right;letter-spacing:-.01em;}
.tag{font-size:15px;color:var(--muted);flex:none;letter-spacing:-.01em;}
.tag.d{color:var(--late);font-weight:600;}
.tag.o{color:var(--warn);font-weight:600;}

/* ---------- 14-day density strip ---------- */
.tl{display:flex;gap:5px;align-items:flex-end;height:42px;margin-bottom:6px;}
.tl i{flex:1;border-radius:3px;background:var(--track);display:block;min-height:5px;}
.tl i.has{background:var(--accent);}
.tl i.late{background:var(--late);}
.tl i.today{outline:2px solid var(--accent);outline-offset:2px;}
.tld{display:flex;gap:5px;}
.tld span{flex:1;text-align:center;font-size:12px;color:var(--faint);}

/* ---------- footer ---------- */
.ws{display:flex;flex-wrap:wrap;gap:8px 42px;}
.ws a{display:flex;align-items:baseline;gap:10px;padding:8px 0;}
.ws a:hover .n{color:var(--accent);}
.ws .l{font-size:17px;color:var(--muted);letter-spacing:-.022em;}
.ws .n{font-size:20px;font-weight:600;letter-spacing:-.02em;}

.empty{font-size:19px;color:var(--muted);padding:34px 10px;letter-spacing:-.022em;}
.empty b{display:block;font-weight:600;color:var(--ink);font-size:21px;margin-bottom:4px;}

@media (max-width:1000px){ .g2{grid-template-columns:1fr;} }
@media (max-width:880px){
  .hero{grid-template-columns:1fr;gap:30px;}
  .hero h1{font-size:42px;}
  .brief{font-size:19px;}
}
@media (max-width:620px){
  .cd{padding:26px 20px;border-radius:18px;}
  .hero h1{font-size:34px;}
  .brief{font-size:18px;}
  .act{gap:14px;padding:18px 6px;}
  .act .t{font-size:18px;}
  .go{padding:9px 14px;font-size:15px;}
}

.anim .hero,.anim .cd{animation:fi .45s cubic-bezier(.22,1,.36,1) both;}
.anim .cd:nth-of-type(2){animation-delay:.05s;}
.anim .cd:nth-of-type(3){animation-delay:.1s;}
.anim .dial .vl{animation:rg .95s cubic-bezier(.22,1,.36,1) both;}
@keyframes fi{from{opacity:0;transform:translateY(7px);}}
@keyframes rg{from{stroke-dashoffset:471;}}   /* must match c_circ */

/* ---------- command palette (appended to body, outside the region) ---------- */
#efPal{position:fixed;inset:0;z-index:10000;display:none;
  background:rgba(0,0,0,.32);backdrop-filter:blur(6px);-webkit-backdrop-filter:blur(6px);}
#efPal.on{display:block;}
#efPalBox{position:absolute;top:12vh;left:50%;transform:translateX(-50%);width:min(640px,92vw);
  background:#fff;border-radius:18px;overflow:hidden;
  box-shadow:0 30px 90px -20px rgba(0,0,0,.5);
  font-family:-apple-system,BlinkMacSystemFont,"SF Pro Text","Segoe UI",Roboto,Helvetica,Arial,sans-serif;}
html[data-theme="dark"] #efPalBox{background:#1f2227;}
#efPalIn{width:100%;border:none;outline:none;background:transparent;color:#1d1d1f;
  font-size:20px;padding:22px 24px;font-family:inherit;letter-spacing:-.022em;}
html[data-theme="dark"] #efPalIn{color:#f5f5f7;}
#efPalList{max-height:52vh;overflow-y:auto;border-top:1px solid rgba(0,0,0,.08);}
html[data-theme="dark"] #efPalList{border-top-color:rgba(255,255,255,.1);}
.efPr{display:flex;align-items:center;gap:14px;padding:13px 24px;cursor:pointer;}
.efPr.sel{background:rgba(0,113,227,.1);}
html[data-theme="dark"] .efPr.sel{background:rgba(41,151,255,.16);}
.efPk{font-size:11px;font-weight:600;letter-spacing:.04em;color:#6e6e73;background:rgba(0,0,0,.06);
  border-radius:5px;padding:3px 7px;flex:none;min-width:58px;text-align:center;}
html[data-theme="dark"] .efPk{color:#a1a1a6;background:rgba(255,255,255,.1);}
.efPn{font-size:17px;color:#1d1d1f;letter-spacing:-.022em;flex:1;min-width:0;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
html[data-theme="dark"] .efPn{color:#f5f5f7;}
.efPs{font-size:14px;color:#86868b;flex:none;max-width:40%;
  white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.efPe{padding:26px 24px;font-size:16px;color:#86868b;}

@media (prefers-reduced-motion:reduce){
  .ef *,.ef *::before,.ef *::after{animation:none !important;transition:none !important;}
}
</style>~');

  --------------------------------------------------------------------
  -- HERO
  --------------------------------------------------------------------
  p('<div class="ef"><div class="hero"><div>');

  p('<div class="kick"><span class="dot" aria-hidden="true"></span><span id="ef-live">Live</span>'
    ||'<span class="sep">/</span><span>'||TO_CHAR(SYSDATE,'Dy DD Mon YYYY')||'</span>'
    ||'<span class="sep">/</span><span>'||l_projects_active||' active '
    ||plural(l_projects_active,'project','projects')||'</span>'
    ||CASE WHEN l_insight_src = 'AI' THEN '<span class="sep">/</span><span>AI brief</span>' END
    ||'<span hidden id="ef-ts" data-ts="'
    ||TO_CHAR(SYSTIMESTAMP AT TIME ZONE 'UTC','YYYY-MM-DD"T"HH24:MI:SS"Z"')||'"></span></div>');

  p('<h1>'||l_greeting||'</h1>');

  p('<div class="brief"><div class="brief-l">'
    ||'<svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">'
    ||'<path d="M12 2l1.9 5.9L20 10l-6.1 2.1L12 18l-1.9-5.9L4 10l6.1-2.1z"/>'
    ||'<path d="M18.5 15l.8 2.4 2.4.8-2.4.8-.8 2.4-.8-2.4-2.4-.8 2.4-.8z" opacity=".55"/></svg>'
    ||CASE WHEN l_insight_src = 'AI' THEN 'AI BRIEF' ELSE 'TODAY' END||'</div>');
  p('<p>'||esc(l_insight)||'</p></div>');

  -- Recommended action. The impact figure is the score formula run
  -- against the counts this change would produce - see health_of().
  IF l_rec_kind IS NOT NULL AND l_rec_delta > 0 THEN
    p('<div class="rec"><div class="rec-b">');
    p('<div class="rec-l">RECOMMENDED ACTION</div>');
    p('<div class="rec-t">'||esc(l_rec_title)||'</div>');
    p('<div class="rec-w">'||esc(l_rec_why)||'</div></div>');
    p('<div class="rec-r"><div class="rec-l">EXPECTED IMPACT</div>'
      ||'<div class="rec-n"><span class="f">'||l_health||'</span>'
      ||'<span class="a">&rarr;</span><span class="t">'||l_rec_after||'</span>'
      ||'<span class="d">+'||l_rec_delta||'</span></div>'
      ||'<div class="rec-u">workspace health</div>'
      ||'<a class="rec-go" href="'||l_rec_href||'">'||esc(l_rec_cta)||' &rarr;</a></div>');
    p('</div>');
  END IF;

  p('<div class="omni" id="efOmni" role="button" tabindex="0" aria-label="Search or ask anything">'
    ||'<svg width="19" height="19" viewBox="0 0 24 24" fill="none" stroke="currentColor" '
    ||'stroke-width="2" stroke-linecap="round" aria-hidden="true">'
    ||'<circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/></svg>'
    ||'<span>Search or ask anything</span><kbd>Ctrl K</kbd></div>');

  p('</div>');

  p('<div class="dwrap"><div class="dial" role="img" aria-label="Delivery health '||l_health
    ||' out of 100, '||LOWER(l_health_label)||'">');
  p('<svg class="r" viewBox="0 0 170 170" aria-hidden="true">'
    ||'<defs><linearGradient id="efDialG" x1="0" y1="0" x2="1" y2="1">'
    ||'<stop offset="0%" stop-color="'||l_dial_c1||'"/>'
    ||'<stop offset="100%" stop-color="'||l_dial_c2||'"/></linearGradient></defs>'
    ||'<circle class="tr" cx="85" cy="85" r="75"/>'
    ||'<circle class="vl" cx="85" cy="85" r="75" stroke="url(#efDialG)" stroke-dasharray="'
    ||TO_CHAR(c_circ)||'" stroke-dashoffset="'||TO_CHAR(l_ring_off)||'"/></svg>');
  p('<div class="ct"><span class="n">'||l_health||'</span><span class="l" style="color:'
    ||l_dial_c2||';">'||l_health_label||'</span></div></div>');
  p('<div class="dial-c">'||l_tasks_open||' open &middot; '||l_task_pct||'% done</div></div>');

  p('</div>');

  --------------------------------------------------------------------
  -- NEEDS ATTENTION - exactly three, ranked
  --------------------------------------------------------------------
  p('<div class="cd">');
  head('Needs attention',
       CASE WHEN l_nact = 0 THEN 'nothing flagged' ELSE 'top '||l_nact||' of what is wrong' END,
       l_url_tasks, 'All tasks');
  p('<div class="acts">');
  IF l_nact = 0 THEN
    p('<div class="allclear"><i aria-hidden="true">&check;</i>'
      ||'Nothing needs attention. No overdue, blocked or unowned work.</div>');
  ELSE
    FOR i IN 1 .. l_nact LOOP
      p('<a class="act '||l_act(i).sev||'" href="'||l_act(i).href||'">'
        ||'<span class="rank">'||i||'</span>'
        ||'<span class="bd"><span class="t">'||esc(l_act(i).title)||'</span>'
        ||'<span class="m">'||l_act(i).meta||'</span></span>'
        ||'<span class="go">'||esc(l_act(i).cta)||' &rarr;</span></a>');
    END LOOP;
  END IF;
  p('</div></div>');

  --------------------------------------------------------------------
  -- ASK ENTERPRISEFLOW
  --
  -- These drive the assistant that already floats on every page rather
  -- than navigating away, so the answer lands next to the numbers that
  -- prompted the question.
  --------------------------------------------------------------------
  p('<div class="cd">');
  head('Ask EnterpriseFlow', 'answers appear in the assistant', l_url_ai, 'Open assistant');
  p('<div class="chips">');
  p('<button type="button" class="chip" data-ef-ask="Why are projects delayed right now? '
    ||'Be specific about which projects and tasks.">Why are projects delayed?</button>');
  p('<button type="button" class="chip" data-ef-ask="Which employees are overloaded and which have '
    ||'capacity? Compare their open task counts.">Who is overloaded?</button>');
  p('<button type="button" class="chip" data-ef-ask="Summarise the top risks across all projects '
    ||'and what should be done about each.">Summarise the top risks</button>');
  IF l_risk_proj_name IS NOT NULL THEN
    p('<button type="button" class="chip" data-ef-ask="Draft a short status update for the project '
      ||esc(l_risk_proj_name)||', including current progress, risks and next steps.">'
      ||'Draft status: '||esc(l_risk_proj_name)||'</button>');
  END IF;
  p('</div></div>');

  --------------------------------------------------------------------
  -- PORTFOLIO - risk-ranked cards
  --------------------------------------------------------------------
  p('<div class="cd">');
  head('Portfolio', l_projects_active||' active of '||l_projects||' &middot; ranked by risk',
       APEX_PAGE.GET_URL(p_page => 40), 'All projects');
  p('<div class="pgrid">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT pj.project_id, pj.project_name, s.status_code, s.status_name, c.client_name,
             cnt.tot, cnt.done, cnt.inprog, cnt.bl, cnt.od,
             (cnt.od * 3 + cnt.bl * 2 + cnt.un
               + CASE WHEN s.status_code = 'ON_HOLD' THEN 2 ELSE 0 END
               + CASE WHEN pj.end_date IS NOT NULL AND pj.end_date < TRUNC(SYSDATE)
                      THEN 3 ELSE 0 END) risk
        FROM project pj
        JOIN status s ON s.status_id = pj.status_id
        LEFT JOIN client c ON c.client_id = pj.client_id
        CROSS APPLY (
          SELECT COUNT(*) tot,
                 COUNT(CASE WHEN ts.status_code = 'DONE' THEN 1 END) done,
                 COUNT(CASE WHEN ts.status_code = 'IN_PROGRESS' THEN 1 END) inprog,
                 COUNT(CASE WHEN ts.status_code = 'BLOCKED' THEN 1 END) bl,
                 COUNT(CASE WHEN ts.status_code NOT IN ('DONE','CANCELLED')
                             AND t.due_date IS NOT NULL
                             AND t.due_date < TRUNC(SYSDATE) THEN 1 END) od,
                 COUNT(CASE WHEN ts.status_code NOT IN ('DONE','CANCELLED')
                             AND t.assigned_to_employee_id IS NULL THEN 1 END) un
            FROM task t JOIN status ts ON ts.status_id = t.status_id
           WHERE t.project_id = pj.project_id
             AND t.active_flag = 'Y') cnt
       WHERE s.status_code NOT IN ('COMPLETED','CANCELLED')
         AND pj.active_flag = 'Y'
       ORDER BY risk DESC, pj.project_name
       FETCH FIRST 6 ROWS ONLY
    ) LOOP
      l_any := TRUE;
      DECLARE
        l_dpct NUMBER := pct(r.done, r.tot);
        l_ipct NUMBER := pct(r.inprog, r.tot);
        l_rl   VARCHAR2(10);
        l_rt   VARCHAR2(40);
      BEGIN
        IF r.risk >= 5 THEN l_rl := 'late'; l_rt := 'High risk';
        ELSIF r.risk >= 2 THEN l_rl := 'warn'; l_rt := 'Watch';
        ELSE l_rl := 'ok'; l_rt := 'On track';
        END IF;

        p('<a class="pc" href="'||APEX_PAGE.GET_URL(p_page => 41, p_items => 'P41_PROJECT_ID',
                                                    p_values => TO_CHAR(r.project_id))||'">');
        p('<div class="t">'||esc(r.project_name)||'</div>');
        p('<div class="s">'||esc(NVL(r.client_name,'Internal'))||' &middot; '
          ||esc(r.status_name)||'</div>');
        p('<div class="pbar">');
        IF r.tot > 0 THEN
          IF l_dpct > 0 THEN p('<i class="d" style="width:'||l_dpct||'%;"></i>'); END IF;
          IF l_ipct > 0 THEN p('<i class="p" style="width:'||l_ipct||'%;"></i>'); END IF;
        END IF;
        p('</div>');
        p('<div class="pf"><span>'
          ||CASE WHEN r.tot = 0 THEN 'No tasks' ELSE r.done||'/'||r.tot||' done' END||'</span>');
        IF r.od > 0 THEN p('<span style="color:var(--late);font-weight:600;">'||r.od||' late</span>'); END IF;
        IF r.bl > 0 THEN p('<span style="color:var(--warn);font-weight:600;">'||r.bl||' blocked</span>'); END IF;
        p('<span class="r '||l_rl||'">'||l_rt||'</span></div></a>');
      END;
    END LOOP;
    IF NOT l_any THEN
      p('<div class="empty"><b>No active projects</b>Everything is completed or cancelled.</div>');
    END IF;
  END;
  p('</div></div>');

  --------------------------------------------------------------------
  -- DEADLINES + CAPACITY
  --------------------------------------------------------------------
  p('<div class="g2">');

  -- Deadlines: 14-day density strip over a readable list
  p('<div class="cd">');
  head('Deadlines', 'next 14 days', l_url_tasks, 'All tasks');
  DECLARE
    TYPE t_num IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    l_day t_num; l_lt t_num; l_mx NUMBER := 0; l_bars VARCHAR2(8000); l_lbl VARCHAR2(4000);
  BEGIN
    FOR i IN 0 .. 13 LOOP l_day(i) := 0; l_lt(i) := 0; END LOOP;
    FOR r IN (SELECT TRUNC(t.due_date) - TRUNC(SYSDATE) d, COUNT(*) c,
                     COUNT(CASE WHEN t.due_date < TRUNC(SYSDATE) THEN 1 END) lt
                FROM task t JOIN status s ON s.status_id = t.status_id
               WHERE s.status_code NOT IN ('DONE','CANCELLED')
                 AND t.active_flag = 'Y'
                 AND t.due_date IS NOT NULL
                 AND t.due_date < TRUNC(SYSDATE) + 14
               GROUP BY TRUNC(t.due_date) - TRUNC(SYSDATE)) LOOP
      -- Anything already overdue piles onto day 0, which is where the
      -- reader has to deal with it anyway.
      DECLARE l_i PLS_INTEGER := GREATEST(0, LEAST(13, r.d)); BEGIN
        l_day(l_i) := l_day(l_i) + r.c;
        l_lt(l_i)  := l_lt(l_i) + r.lt;
      END;
    END LOOP;
    FOR i IN 0 .. 13 LOOP IF l_day(i) > l_mx THEN l_mx := l_day(i); END IF; END LOOP;
    FOR i IN 0 .. 13 LOOP
      l_bars := l_bars || '<i class="'
             || CASE WHEN l_lt(i) > 0 THEN 'late' WHEN l_day(i) > 0 THEN 'has' ELSE '' END
             || CASE WHEN i = 0 THEN ' today' END
             || '" style="height:'
             || CASE WHEN l_mx = 0 OR l_day(i) = 0 THEN 5
                     ELSE GREATEST(9, ROUND(l_day(i) / l_mx * 42)) END
             || 'px;" title="'||TO_CHAR(SYSDATE + i,'Dy DD Mon')||': '||l_day(i)||' due"></i>';
      l_lbl := l_lbl || '<span>'
             || CASE WHEN MOD(i,2) = 0 THEN TO_CHAR(SYSDATE + i,'DD') END || '</span>';
    END LOOP;
    p('<div class="tl">'||l_bars||'</div><div class="tld">'||l_lbl||'</div>');
  END;

  p('<div class="rows" style="margin-top:20px;">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT t.task_id, t.task_name, t.due_date, pj.project_name, pr.priority_name, pr.priority_code,
             e.first_name, e.last_name, TRUNC(t.due_date) - TRUNC(SYSDATE) days_left
        FROM task t
        JOIN status s ON s.status_id = t.status_id
        LEFT JOIN project pj ON pj.project_id = t.project_id
        LEFT JOIN priority pr ON pr.priority_id = t.priority_id
        LEFT JOIN employee e ON e.employee_id = t.assigned_to_employee_id
       WHERE s.status_code NOT IN ('DONE','CANCELLED')
         AND t.active_flag = 'Y'
         AND t.due_date IS NOT NULL
       ORDER BY t.due_date
       FETCH FIRST 5 ROWS ONLY
    ) LOOP
      l_any := TRUE;
      DECLARE l_c VARCHAR2(4); l_l VARCHAR2(40); BEGIN
        IF r.days_left < 0 THEN l_c := 'l'; l_l := ABS(r.days_left)||'d late';
        ELSIF r.days_left = 0 THEN l_c := 's'; l_l := 'today';
        ELSIF r.days_left <= 3 THEN l_c := 's';
          l_l := CASE WHEN r.days_left = 1 THEN 'tomorrow' ELSE r.days_left||'d' END;
        ELSE l_c := ''; l_l := r.days_left||'d';
        END IF;
        p('<a class="row" href="'||APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID',
                                                     p_values => TO_CHAR(r.task_id))||'">');
        p('<span class="dt '||l_c||'">'||TO_CHAR(r.due_date,'DD Mon')||'</span>');
        p('<span class="bd"><span class="nm">'||esc(r.task_name)||'</span><span class="sub">'
          ||esc(NVL(r.project_name,'No project'))
          ||CASE WHEN r.priority_code IN ('HIGH','CRITICAL') THEN ' &middot; '||esc(r.priority_name) END
          ||CASE WHEN r.first_name IS NOT NULL
                 THEN ' &middot; '||esc(r.first_name||' '||SUBSTR(r.last_name,1,1)||'.')
                 ELSE ' &middot; unassigned' END||'</span></span>');
        p('<span class="rt '||l_c||'">'||l_l||'</span></a>');
      END;
    END LOOP;
    IF NOT l_any THEN
      p('<div class="empty"><b>Nothing scheduled</b>No open task carries a due date.</div>');
    END IF;
  END;
  p('</div></div>');

  -- Capacity
  SELECT NVL(MAX(cnt),0), NVL(MEDIAN(cnt),0) INTO l_max_open, l_med_open
    FROM (SELECT COUNT(*) cnt
            FROM task t JOIN status s ON s.status_id = t.status_id
           WHERE s.status_code NOT IN ('DONE','CANCELLED')
             AND t.active_flag = 'Y'
             AND t.assigned_to_employee_id IS NOT NULL
           GROUP BY t.assigned_to_employee_id);

  p('<div class="cd">');
  head('Capacity', l_emps||' '||plural(l_emps,'person','people')
       ||CASE WHEN l_med_open > 0 THEN ' &middot; median '||ROUND(l_med_open)||' open' END,
       APEX_PAGE.GET_URL(p_page => 13), 'All employees');
  p('<div class="rows">');
  DECLARE
    l_any BOOLEAN := FALSE;
  BEGIN
    FOR r IN (
      SELECT e.employee_id, e.first_name, e.last_name, rl.role_name, d.department_name,
             (SELECT COUNT(*) FROM task t JOIN status s ON s.status_id = t.status_id
               WHERE t.assigned_to_employee_id = e.employee_id
                 AND t.active_flag = 'Y'
                 AND s.status_code NOT IN ('DONE','CANCELLED')) open_cnt,
             (SELECT COUNT(*) FROM task t JOIN status s ON s.status_id = t.status_id
               WHERE t.assigned_to_employee_id = e.employee_id
                 AND t.active_flag = 'Y'
                 AND s.status_code NOT IN ('DONE','CANCELLED')
                 AND t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE)) od_cnt
        FROM employee e
        LEFT JOIN role rl ON rl.role_id = e.role_id
        LEFT JOIN department d ON d.department_id = e.department_id
       WHERE e.active_flag = 'Y'
       ORDER BY open_cnt DESC, e.last_name
       FETCH FIRST 5 ROWS ONLY
    ) LOOP
      l_any := TRUE;
      DECLARE
        -- "Heavy" is relative to the team median so it scales, but with
        -- an absolute floor: with a median of 1, a bare ratio would
        -- label two tasks as overloaded, which is noise.
        l_over BOOLEAN := (l_med_open > 0 AND r.open_cnt > l_med_open * 1.5 AND r.open_cnt >= 3);
      BEGIN
        p('<a class="row" href="'||APEX_PAGE.GET_URL(p_page => 14, p_items => 'P14_EMPLOYEE_ID',
                                                     p_values => TO_CHAR(r.employee_id))||'">');
        p('<span class="av">'||esc(SUBSTR(r.first_name,1,1)||SUBSTR(r.last_name,1,1))||'</span>');
        p('<span class="bd"><span class="nm">'||esc(r.first_name||' '||r.last_name)
          ||'</span><span class="sub">'||esc(NVL(r.role_name,'-'))||' &middot; '
          ||esc(NVL(r.department_name,'-'))||'</span></span>');
        IF r.od_cnt > 0 THEN
          p('<span class="tag d">'||r.od_cnt||' late</span>');
        ELSIF l_over THEN
          p('<span class="tag o">heavy</span>');
        END IF;
        p('<span class="load"><span class="t2"><span class="f'
          ||CASE WHEN l_over THEN ' over' END||'" style="width:'
          ||CASE WHEN l_max_open = 0 THEN 0 ELSE ROUND(r.open_cnt / l_max_open * 100) END
          ||'%;"></span></span><span class="c">'||r.open_cnt||' open</span></span>');
        p('</a>');
      END;
    END LOOP;
    IF NOT l_any THEN
      p('<div class="empty"><b>No active employees</b>Add people to see capacity.</div>');
    END IF;
  END;
  p('</div></div>');

  p('</div>');  -- g2

  --------------------------------------------------------------------
  -- WORKSPACE (reference counts + drill-downs)
  --------------------------------------------------------------------
  p('<div class="cd">');
  head('Workspace', 'reference', APEX_PAGE.GET_URL(p_page => 51), 'Audit log');
  p('<div class="ws">');
  p('<a href="'||APEX_PAGE.GET_URL(p_page=>5)||'"><span class="l">Organizations</span><span class="n">'||l_orgs||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page=>9)||'"><span class="l">Departments</span><span class="n">'||l_depts||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page=>13)||'"><span class="l">Employees</span><span class="n">'||l_emps||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page=>15)||'"><span class="l">Roles</span><span class="n">'||l_roles||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page=>19)||'"><span class="l">Clients</span><span class="n">'||l_clients||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page=>4)||'"><span class="l">Locations</span><span class="n">'||l_locs||'</span></a>');
  p('<a href="'||APEX_PAGE.GET_URL(p_page=>17)||'"><span class="l">User accounts</span><span class="n">'||l_users||'</span></a>');
  p('</div></div>');

  p('</div>');  -- .ef

  --------------------------------------------------------------------
  -- COMMAND PALETTE INDEX
  --
  -- Inlined rather than fetched: the whole workspace is a few dozen
  -- rows, and shipping it with the page means Ctrl-K is instant and
  -- needs no AJAX process (which a region cannot create anyway).
  -- Each URL is checksummed by APEX_PAGE.GET_URL, so palette
  -- navigation obeys the same session-state protection as any link.
  --------------------------------------------------------------------
  -- Streamed straight into the CLOB, one item at a time. An earlier
  -- version accumulated the JSON in a VARCHAR2 and bailed out at 28KB
  -- to stay inside the type limit; once the workspace grew past ~50
  -- records that cap started silently swallowing every employee,
  -- client and navigation command. There is no cap now.
  DECLARE
    l_n PLS_INTEGER := 0;
    PROCEDURE item(p_k VARCHAR2, p_n VARCHAR2, p_s VARCHAR2, p_u VARCHAR2) IS
    BEGIN
      IF l_n > 0 THEN p(','); END IF;
      l_n := l_n + 1;
      p(REPLACE('{"k":"'||p_k||'","n":"'||js(p_n)||'","s":"'||js(p_s)
                ||'","u":"'||js(p_u)||'"}', '</', '<\/'));
    END item;
  BEGIN
    p('<script type="application/json" id="efIndex">[');
    FOR r IN (SELECT pj.project_id, pj.project_name, s.status_name
                FROM project pj JOIN status s ON s.status_id = pj.status_id
               WHERE pj.active_flag = 'Y'
               ORDER BY pj.project_name) LOOP
      item('Project', r.project_name, r.status_name,
           APEX_PAGE.GET_URL(p_page => 41, p_items => 'P41_PROJECT_ID',
                             p_values => TO_CHAR(r.project_id)));
    END LOOP;

    FOR r IN (SELECT t.task_id, t.task_name, pj.project_name
                FROM task t LEFT JOIN project pj ON pj.project_id = t.project_id
               WHERE t.active_flag = 'Y'
               ORDER BY t.task_name FETCH FIRST 200 ROWS ONLY) LOOP
      item('Task', r.task_name, NVL(r.project_name,'No project'),
           APEX_PAGE.GET_URL(p_page => 43, p_items => 'P43_TASK_ID',
                             p_values => TO_CHAR(r.task_id)));
    END LOOP;

    FOR r IN (SELECT e.employee_id, e.first_name||' '||e.last_name nm, rl.role_name
                FROM employee e LEFT JOIN role rl ON rl.role_id = e.role_id
               WHERE e.active_flag = 'Y'
               ORDER BY e.last_name FETCH FIRST 200 ROWS ONLY) LOOP
      item('Person', r.nm, NVL(r.role_name,'-'),
           APEX_PAGE.GET_URL(p_page => 14, p_items => 'P14_EMPLOYEE_ID',
                             p_values => TO_CHAR(r.employee_id)));
    END LOOP;

    FOR r IN (SELECT c.client_id, c.client_name FROM client c
               WHERE c.active_flag = 'Y' ORDER BY c.client_name) LOOP
      item('Client', r.client_name, 'Client',
           APEX_PAGE.GET_URL(p_page => 20, p_items => 'P20_CLIENT_ID',
                             p_values => TO_CHAR(r.client_id)));
    END LOOP;

    item('Go to', 'Projects',      'Page', APEX_PAGE.GET_URL(p_page => 40));
    item('Go to', 'Tasks',         'Page', l_url_tasks);
    item('Go to', 'Employees',     'Page', APEX_PAGE.GET_URL(p_page => 13));
    item('Go to', 'Clients',       'Page', APEX_PAGE.GET_URL(p_page => 19));
    item('Go to', 'Organizations', 'Page', APEX_PAGE.GET_URL(p_page => 5));
    item('Go to', 'Departments',   'Page', APEX_PAGE.GET_URL(p_page => 9));
    item('Go to', 'Audit log',     'Page', APEX_PAGE.GET_URL(p_page => 51));
    item('Go to', 'AI Assistant',  'Page', l_url_ai);

    p(']</script>');
  END;

  --------------------------------------------------------------------
  -- BEHAVIOUR
  --------------------------------------------------------------------
  -- Emitted before the script that reads it, so the fallback is
  -- available even if the assistant widget never loaded.
  p('<input type="hidden" id="efAiUrl" value="'||l_url_ai||'">');

  p(q'~<script>
(function(){
  var root = document.querySelector('.ef');
  if (root && !window.__efDashSeen) { root.classList.add('anim'); window.__efDashSeen = true; }

  /* ---- relative "live" clock ---- */
  function tick(){
    var ts = document.getElementById('ef-ts'), el = document.getElementById('ef-live');
    if (!ts || !el) { return; }
    var s = Math.floor((Date.now() - new Date(ts.getAttribute('data-ts')).getTime())/1000);
    el.textContent = s < 10 ? 'Live' : s < 60 ? (s+'s ago') : (Math.floor(s/60)+'m ago');
  }
  tick();
  if (!window.__efDashLiveTimer) { window.__efDashLiveTimer = setInterval(tick, 1000); }

  /* ---- index is re-read on every render; the region owns the data ---- */
  try {
    var raw = document.getElementById('efIndex');
    window.__efIndex = raw ? JSON.parse(raw.textContent) : [];
  } catch(e) { window.__efIndex = []; }

  /* ---- ask the floating assistant, in place ---- */
  function efAsk(q){
    var bubble = document.querySelector('.ef-widget-bubble');
    if (!bubble) {
      var f = document.getElementById('efAiUrl');
      if (f) { window.location.href = f.value; }
      return;
    }
    bubble.click();
    setTimeout(function(){
      var i = document.getElementById('efWidgetInput'), s = document.getElementById('efWidgetSend');
      if (!i || !s) { return; }
      i.value = q;
      i.dispatchEvent(new Event('input', {bubbles:true}));
      s.click();
    }, 280);
  }
  /* Delegated so it survives the region replacing its own innerHTML. */
  if (!window.__efAskBound) {
    window.__efAskBound = true;
    document.addEventListener('click', function(e){
      var c = e.target.closest && e.target.closest('[data-ef-ask]');
      if (c) { e.preventDefault(); efAsk(c.getAttribute('data-ef-ask')); }
    });
  }

  /* ---- command palette ---- */
  function pal(){ return document.getElementById('efPal'); }
  function build(){
    if (pal()) { return; }
    var d = document.createElement('div');
    d.id = 'efPal';
    d.innerHTML = '<div id="efPalBox">'
      + '<input id="efPalIn" type="text" autocomplete="off" spellcheck="false" '
      + 'placeholder="Search projects, tasks, people… or type a question">'
      + '<div id="efPalList"></div></div>';
    document.body.appendChild(d);          /* body, not the region - survives refresh */
    d.addEventListener('click', function(e){ if (e.target === d) { close(); } });
    d.querySelector('#efPalIn').addEventListener('input', render);
    d.addEventListener('keydown', keys);
  }
  var sel = 0, shown = [];
  function open(){
    build();
    pal().classList.add('on');
    var i = document.getElementById('efPalIn');
    i.value = ''; i.focus(); sel = 0; render();
  }
  function close(){ if (pal()) { pal().classList.remove('on'); } }
  function render(){
    var q = (document.getElementById('efPalIn').value || '').trim().toLowerCase();
    var idx = window.__efIndex || [];
    if (!q) { shown = idx.slice(0, 8); }
    else {
      var starts = [], has = [];
      for (var i = 0; i < idx.length; i++){
        var n = idx[i].n.toLowerCase();
        if (n.indexOf(q) === 0) { starts.push(idx[i]); }
        else if (n.indexOf(q) > -1 || idx[i].s.toLowerCase().indexOf(q) > -1) { has.push(idx[i]); }
      }
      shown = starts.concat(has).slice(0, 9);
      /* Anything typed can always be sent to the assistant instead. */
      shown.push({k:'Ask', n:'Ask EnterpriseFlow: ' + q, s:'AI', ask:q});
    }
    if (sel >= shown.length) { sel = 0; }
    var h = '';
    for (var j = 0; j < shown.length; j++){
      h += '<div class="efPr' + (j === sel ? ' sel' : '') + '" data-i="' + j + '">'
         + '<span class="efPk">' + shown[j].k + '</span>'
         + '<span class="efPn"></span><span class="efPs"></span></div>';
    }
    var list = document.getElementById('efPalList');
    list.innerHTML = h || '<div class="efPe">No matches</div>';
    /* textContent, never innerHTML, for anything derived from data */
    var rows = list.querySelectorAll('.efPr');
    for (var k = 0; k < rows.length; k++){
      rows[k].querySelector('.efPn').textContent = shown[k].n;
      rows[k].querySelector('.efPs').textContent = shown[k].s;
      rows[k].addEventListener('click', function(){ go(+this.getAttribute('data-i')); });
    }
  }
  function go(i){
    var it = shown[i];
    if (!it) { return; }
    close();
    if (it.ask) { efAsk(it.ask); } else { window.location.href = it.u; }
  }
  function keys(e){
    if (e.key === 'Escape') { close(); }
    else if (e.key === 'ArrowDown') { e.preventDefault(); sel = Math.min(sel + 1, shown.length - 1); render(); }
    else if (e.key === 'ArrowUp')   { e.preventDefault(); sel = Math.max(sel - 1, 0); render(); }
    else if (e.key === 'Enter')     { e.preventDefault(); go(sel); }
  }
  if (!window.__efPalBound) {
    window.__efPalBound = true;
    document.addEventListener('keydown', function(e){
      if ((e.ctrlKey || e.metaKey) && (e.key === 'k' || e.key === 'K')) { e.preventDefault(); open(); }
    });
    document.addEventListener('click', function(e){
      if (e.target.closest && e.target.closest('#efOmni')) { open(); }
    });
  }

  function refreshDash(){
    try {
      var r = window.apex && apex.region
                && (apex.region('R9114769350531102') || apex.region('dashboard-content'));
      if (r && r.refresh) { r.refresh(); }
    } catch (e) { /* region gone - page navigated away */ }
  }

  /* ---- refresh as soon as an edit is saved ----
     Task and project forms are modal dialog pages. Saving one closes
     the dialog and fires apexafterclosedialog on the opener, but
     nothing here was listening, so the reader had to reload by hand to
     see their own change.

     Two details this has to get right:

     1. The event is fired through jQuery, so a native
        addEventListener would never see it. It must be bound with
        apex.jQuery, on document, since the link that opened the
        dialog is destroyed on every region refresh.

     2. This script runs inline while the page renders, and apex.js has
        not necessarily finished loading at that point. A plain
        `if (apex.jQuery)` check is simply false then and the binding
        silently never happens - which is exactly what went wrong in
        v11. Poll for it instead of assuming, giving up after 10s.

     Also fires on cancel, which is a harmless extra refresh. */
  (function bindDialog(tries){
    if (window.__efDlgBound) { return; }
    if (window.apex && window.apex.jQuery) {
      window.__efDlgBound = true;
      window.apex.jQuery(document).on('apexafterclosedialog dialogclosed', function(){
        setTimeout(refreshDash, 200);   /* let the commit land first */
      });
      return;
    }
    if (tries > 0) { setTimeout(function(){ bindDialog(tries - 1); }, 250); }
  })(40);

  /* ---- auto refresh, yielding while the reader is scrolled in ---- */
  if (!window.__efDashRefreshTimer) {
    window.__efDashRefreshTimer = setInterval(function(){
      if (window.scrollY > 40 || document.hidden) { return; }
      if (pal() && pal().classList.contains('on')) { return; }
      refreshDash();
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
