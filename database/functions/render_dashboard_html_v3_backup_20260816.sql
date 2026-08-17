CREATE OR REPLACE FUNCTION "RENDER_DASHBOARD_HTML" RETURN CLOB IS
  l_html CLOB := '';
  l_orgs NUMBER; l_depts NUMBER; l_emps NUMBER; l_clients NUMBER; l_locs NUMBER; l_projects NUMBER; l_tasks NUMBER;
  l_tasks_done NUMBER; l_projects_done NUMBER; l_task_pct NUMBER; l_proj_pct NUMBER;
  l_blocked NUMBER; l_overdue NUMBER; l_prompt CLOB; l_insight CLOB; l_insight_safe VARCHAR2(4000); l_ai_ok BOOLEAN := TRUE;
  l_greeting VARCHAR2(40);
  l_hr NUMBER := TO_NUMBER(TO_CHAR(SYSDATE,'HH24'));
  l_any_deadline BOOLEAN := FALSE;
  l_any_activity BOOLEAN := FALSE;
  l_org_new NUMBER; l_dept_new NUMBER; l_emp_new NUMBER; l_proj_new NUMBER; l_task_new NUMBER;
  l_resolve_task_id   NUMBER;
  l_resolve_task_name VARCHAR2(200);
  l_resolve_label     VARCHAR2(40);
BEGIN
  SELECT COUNT(*) INTO l_orgs FROM organization;
  SELECT COUNT(*) INTO l_depts FROM department;
  SELECT COUNT(*) INTO l_emps FROM employee;
  SELECT COUNT(*) INTO l_clients FROM client;
  SELECT COUNT(*) INTO l_locs FROM location;
  SELECT COUNT(*) INTO l_projects FROM project;
  SELECT COUNT(*) INTO l_tasks FROM task;
  SELECT COUNT(*) INTO l_tasks_done FROM task t JOIN status s ON s.status_id = t.status_id WHERE s.status_code = 'DONE';
  SELECT COUNT(*) INTO l_projects_done FROM project p JOIN status s ON s.status_id = p.status_id WHERE s.status_code = 'COMPLETED';
  SELECT COUNT(*) INTO l_blocked FROM task t JOIN status s ON s.status_id = t.status_id WHERE s.status_code = 'BLOCKED';
  SELECT COUNT(*) INTO l_overdue FROM task t JOIN status s ON s.status_id = t.status_id
    WHERE s.status_code NOT IN ('DONE','CANCELLED') AND t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE);

  -- Weekly trend badges ("+N this week") - only the 5 tables the audit
  -- triggers actually cover. CLIENT/LOCATION have no TRG_<TABLE>_AU, so
  -- they get no badge rather than a fabricated one.
  SELECT COUNT(*) INTO l_org_new  FROM audit_log WHERE table_name = 'ORGANIZATION' AND action = 'INSERT' AND changed_at >= SYSDATE - 7;
  SELECT COUNT(*) INTO l_dept_new FROM audit_log WHERE table_name = 'DEPARTMENT'   AND action = 'INSERT' AND changed_at >= SYSDATE - 7;
  SELECT COUNT(*) INTO l_emp_new  FROM audit_log WHERE table_name = 'EMPLOYEE'     AND action = 'INSERT' AND changed_at >= SYSDATE - 7;
  SELECT COUNT(*) INTO l_proj_new FROM audit_log WHERE table_name = 'PROJECT'      AND action = 'INSERT' AND changed_at >= SYSDATE - 7;
  SELECT COUNT(*) INTO l_task_new FROM audit_log WHERE table_name = 'TASK'         AND action = 'INSERT' AND changed_at >= SYSDATE - 7;

  -- Deterministic "resolve now" target for the AI insight card - picked
  -- by the same rule the AI is asked to reason about (blocked first,
  -- then earliest overdue), not parsed out of the AI's own text. Keeps
  -- the link 100% reliable regardless of how the model phrases things.
  BEGIN
    SELECT t.task_id, t.task_name INTO l_resolve_task_id, l_resolve_task_name
    FROM task t JOIN status s ON s.status_id = t.status_id
    WHERE s.status_code = 'BLOCKED'
    ORDER BY t.task_id
    FETCH FIRST 1 ROW ONLY;
    l_resolve_label := 'Unblock task';
  EXCEPTION WHEN NO_DATA_FOUND THEN
    BEGIN
      SELECT t.task_id, t.task_name INTO l_resolve_task_id, l_resolve_task_name
      FROM task t JOIN status s ON s.status_id = t.status_id
      WHERE s.status_code NOT IN ('DONE','CANCELLED') AND t.due_date IS NOT NULL AND t.due_date < TRUNC(SYSDATE)
      ORDER BY t.due_date ASC
      FETCH FIRST 1 ROW ONLY;
      l_resolve_label := 'Resolve overdue task';
    EXCEPTION WHEN NO_DATA_FOUND THEN
      l_resolve_task_id := NULL;
    END;
  END;

  l_task_pct := CASE WHEN l_tasks = 0 THEN 0 ELSE ROUND(l_tasks_done / l_tasks * 100) END;
  l_proj_pct := CASE WHEN l_projects = 0 THEN 0 ELSE ROUND(l_projects_done / l_projects * 100) END;

  l_greeting := CASE WHEN l_hr < 12 THEN 'Good morning.' WHEN l_hr < 17 THEN 'Good afternoon.' ELSE 'Good evening.' END;

  l_prompt := 'Snapshot of a project management workspace: '||l_orgs||' organizations, '||l_depts||' departments, '||l_emps||' employees, '
    ||l_clients||' clients, '||l_locs||' locations, '||l_projects||' projects ('||l_projects_done||' completed), '
    ||l_tasks||' tasks ('||l_tasks_done||' done, '||l_blocked||' blocked, '||l_overdue||' overdue). '
    ||'Write exactly one short, concrete sentence (max 18 words) pointing out the single most useful thing to notice right now. '
    ||'Plain text only, no markdown, no quotes, no greeting.';

  BEGIN
    l_insight := APEX_AI.GENERATE(
      p_prompt => l_prompt,
      p_system_prompt => 'You are a sharp, concise operations analyst embedded in a SaaS dashboard.',
      p_temperature => 0.4
    );
    l_insight := TRIM(REPLACE(REPLACE(l_insight, CHR(10), ' '), CHR(13), ' '));
    IF l_insight IS NULL OR LENGTH(l_insight) = 0 THEN
      l_ai_ok := FALSE;
    END IF;
  EXCEPTION WHEN OTHERS THEN
    l_ai_ok := FALSE;
  END;

  IF l_ai_ok THEN
    l_insight_safe := APEX_ESCAPE.HTML(SUBSTR(l_insight, 1, 220));
  ELSE
    l_insight_safe := 'Here is what is happening across EnterpriseFlow today.';
  END IF;

  --------------------------------------------------------------------------
  -- STYLES
  --------------------------------------------------------------------------
  l_html := l_html || q'~<style>
.ef{font-family:-apple-system,BlinkMacSystemFont,"SF Pro Display","SF Pro Text","Segoe UI",Roboto,Helvetica,Arial,sans-serif;max-width:100%;margin:0 auto;color:#1d1d1f;}
.ef-hero{position:relative;overflow:hidden;padding:36px 36px;margin-bottom:20px;border-radius:24px;background:linear-gradient(135deg,#0b0f19 0%,#14213d 55%,#0b1a33 100%);animation:ef-fade-in .5s ease both;}
.ef-hero::before{content:"";position:absolute;top:-60px;right:-60px;width:280px;height:280px;border-radius:50%;background:radial-gradient(circle,rgba(66,165,255,.35),transparent 70%);}
.ef-hero::after{content:"";position:absolute;bottom:-80px;left:20%;width:260px;height:260px;border-radius:50%;background:radial-gradient(circle,rgba(0,113,227,.25),transparent 70%);}
.ef-hero-top{position:relative;z-index:1;display:flex;justify-content:space-between;align-items:flex-start;gap:16px;flex-wrap:wrap;}
.ef-hero-inner{position:relative;z-index:1;display:flex;align-items:center;gap:18px;}
.ef-hero-mark{width:56px;height:56px;flex:none;border-radius:16px;background:linear-gradient(135deg,#42a5ff,#0071e3);display:flex;align-items:center;justify-content:center;box-shadow:0 8px 24px rgba(0,113,227,.4);}
.ef-hero h1{font-size:28px;font-weight:700;letter-spacing:-0.02em;margin:0 0 6px;color:#f5f5f7;}
.ef-hero p{font-size:15px;color:#c3cbdb;margin:0;font-weight:400;line-height:1.5;max-width:640px;}
.ef-ai-badge{display:inline-flex;align-items:center;gap:5px;font-size:10.5px;font-weight:700;letter-spacing:.07em;text-transform:uppercase;color:#7dc4ff;margin-bottom:7px;}
.ef-ai-badge .dot{width:6px;height:6px;border-radius:50%;background:#42a5ff;box-shadow:0 0 8px 1px rgba(66,165,255,.7);}
.ef-hero-meta{position:relative;z-index:1;display:flex;gap:10px;flex-wrap:wrap;}
.ef-pill{font-size:12px;font-weight:600;color:#e5eaf5;background:rgba(255,255,255,.08);border:1px solid rgba(255,255,255,.14);padding:6px 12px;border-radius:999px;white-space:nowrap;}
.ef-pill.warn{background:rgba(255,69,58,.16);border-color:rgba(255,69,58,.35);color:#ffb4ae;}
.ef-pill.ef-live{display:inline-flex;align-items:center;gap:7px;}
.ef-pill .pulse{width:7px;height:7px;border-radius:50%;background:#34c759;box-shadow:0 0 0 0 rgba(52,199,89,.7);animation:ef-pulse 2s infinite;flex:none;}
@keyframes ef-pulse{0%{box-shadow:0 0 0 0 rgba(52,199,89,.6);}70%{box-shadow:0 0 0 8px rgba(52,199,89,0);}100%{box-shadow:0 0 0 0 rgba(52,199,89,0);}}
@keyframes ef-fade-in{from{opacity:0;transform:translateY(6px);}to{opacity:1;transform:translateY(0);}}
.ef-quick{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:24px;}
.ef-quick a{text-decoration:none;font-size:13.5px;font-weight:600;color:#1d1d1f;background:#fff;border:1px solid rgba(16,24,40,.08);padding:10px 16px;border-radius:12px;display:inline-flex;align-items:center;gap:8px;box-shadow:0 1px 2px rgba(16,24,40,.04);transition:transform .15s ease,box-shadow .15s ease;}
.ef-quick a:hover{transform:translateY(-2px);box-shadow:0 8px 20px -8px rgba(16,24,40,.25);}
.ef-quick a .qd{width:7px;height:7px;border-radius:2px;}
.ef-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:16px;margin-bottom:20px;}
.ef-card{position:relative;display:block;background:#fff;border-radius:18px;padding:20px 20px 20px;box-shadow:0 1px 2px rgba(16,24,40,.04),0 8px 24px -12px rgba(16,24,40,.10);border:1px solid rgba(16,24,40,.04);border-top:3px solid var(--ac);transition:transform .2s ease,box-shadow .2s ease;animation:ef-fade-in .5s ease both;text-decoration:none;color:inherit;}
.ef-card:hover{transform:translateY(-3px);box-shadow:0 4px 10px rgba(16,24,40,.06),0 20px 36px -14px rgba(16,24,40,.16);}
.ef-card-top{display:flex;align-items:center;gap:10px;margin-bottom:14px;}
.ef-icon-tile{width:32px;height:32px;border-radius:10px;display:flex;align-items:center;justify-content:center;background:linear-gradient(135deg,var(--ac2),var(--ac));flex:none;box-shadow:0 4px 10px -2px var(--ac2);}
.ef-card-label{font-size:12.5px;font-weight:700;color:#667085;letter-spacing:.02em;text-transform:uppercase;}
.ef-card-value{font-size:28px;font-weight:700;letter-spacing:-0.02em;color:#101828;line-height:1;margin-bottom:5px;}
.ef-card-sub{font-size:12px;color:#8a94a6;font-weight:500;}
.ef-trend{font-size:10.5px;font-weight:700;color:#1a7f4e;background:#e7f7ee;padding:2px 7px;border-radius:999px;margin-left:auto;flex:none;}
.ef-resolve-btn{display:inline-flex;align-items:center;gap:6px;margin-top:14px;font-size:13px;font-weight:600;color:#0b0f19;background:#fff;padding:9px 15px;border-radius:10px;text-decoration:none;transition:transform .15s ease,box-shadow .15s ease;box-shadow:0 1px 2px rgba(0,0,0,.1);}
.ef-resolve-btn:hover{transform:translateY(-2px);box-shadow:0 8px 16px -6px rgba(0,0,0,.3);}
.ef-spark-wrap{background:#fff;border-radius:18px;padding:22px 26px;box-shadow:0 1px 2px rgba(16,24,40,.04),0 8px 24px -12px rgba(16,24,40,.10);border:1px solid rgba(16,24,40,.04);margin-bottom:20px;animation:ef-fade-in .5s ease both;}
.ef-spark-head{display:flex;justify-content:space-between;align-items:baseline;margin-bottom:14px;}
.ef-spark-head h3{font-size:15.5px;font-weight:700;color:#101828;margin:0;letter-spacing:-0.01em;}
.ef-spark-head span{font-size:12px;color:#8a94a6;font-weight:600;}
.ef-spark{display:flex;align-items:flex-end;gap:8px;height:44px;}
.ef-spark-bar{flex:1;background:linear-gradient(180deg,#42a5ff,#0071e3);border-radius:4px 4px 2px 2px;min-height:4px;transition:height .4s ease;}
.ef-spark-days{display:flex;gap:8px;margin-top:8px;}
.ef-spark-days span{flex:1;text-align:center;font-size:10.5px;color:#98a2b3;font-weight:600;}
.ef-overview{display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-bottom:20px;}
.ef-donut-card{background:#fff;border-radius:18px;padding:24px;display:flex;align-items:center;gap:20px;box-shadow:0 1px 2px rgba(16,24,40,.04),0 8px 24px -12px rgba(16,24,40,.10);border:1px solid rgba(16,24,40,.04);}
.ef-donut{width:92px;height:92px;border-radius:50%;flex:none;background:conic-gradient(var(--ac) calc(var(--pct)*1%), #eef1f5 0);display:flex;align-items:center;justify-content:center;}
.ef-donut-inner{width:70px;height:70px;border-radius:50%;background:#fff;display:flex;flex-direction:column;align-items:center;justify-content:center;}
.ef-donut-inner .pct{font-size:18px;font-weight:700;color:#101828;letter-spacing:-0.02em;}
.ef-donut-title{font-size:15px;font-weight:700;color:#101828;margin:0 0 4px;letter-spacing:-0.01em;}
.ef-donut-sub{font-size:13px;color:#667085;margin:0;}
.ef-two-col{display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-bottom:16px;}
.ef-section{background:#fff;border-radius:18px;padding:26px;box-shadow:0 1px 2px rgba(16,24,40,.04),0 8px 24px -12px rgba(16,24,40,.10);border:1px solid rgba(16,24,40,.04);}
.ef-section h2{font-size:15.5px;font-weight:700;letter-spacing:-0.01em;margin:0 0 18px;color:#101828;display:flex;align-items:center;gap:8px;}
.ef-section h2 .sw{width:8px;height:8px;border-radius:2px;background:var(--ac);display:inline-block;}
.ef-bar-row{display:flex;align-items:center;margin-bottom:13px;}
.ef-bar-label{width:104px;font-size:13px;color:#344054;font-weight:500;flex-shrink:0;}
.ef-bar-track{flex:1;background:#f2f4f7;border-radius:8px;height:8px;overflow:hidden;margin:0 12px;}
.ef-bar-fill{height:100%;border-radius:8px;background:linear-gradient(90deg,#0071e3,#42a5ff);}
.ef-bar-count{width:24px;text-align:right;font-size:13px;font-weight:600;color:#101828;}
.ef-list{list-style:none;margin:0;padding:0;}
.ef-list li{display:flex;align-items:center;gap:12px;padding:11px 0;border-bottom:1px solid rgba(16,24,40,.05);}
.ef-list li:last-child{border-bottom:none;padding-bottom:0;}
.ef-list-dot{width:8px;height:8px;border-radius:50%;flex:none;background:#d0d5dd;}
.ef-list-dot.red{background:#ff3b30;}
.ef-list-dot.orange{background:#ff9500;}
.ef-list-body{flex:1;min-width:0;}
.ef-list-title{font-size:13.5px;font-weight:600;color:#101828;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.ef-list-meta{font-size:12px;color:#8a94a6;margin-top:2px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.ef-badge{font-size:11px;font-weight:700;padding:3px 9px;border-radius:999px;white-space:nowrap;flex:none;}
.ef-badge.crit{background:#fdecea;color:#c0362c;}
.ef-badge.warn{background:#fff4e5;color:#b25e00;}
.ef-badge.ok{background:#e7f7ee;color:#1a7f4e;}
.ef-badge.neutral{background:#f2f4f7;color:#475467;}
.ef-empty{font-size:13px;color:#98a2b3;padding:20px 0;text-align:center;}
.ef-activity-icon{width:30px;height:30px;border-radius:9px;display:flex;align-items:center;justify-content:center;flex:none;font-size:12px;font-weight:700;color:#fff;}
@media (max-width:820px){.ef-two-col,.ef-overview{grid-template-columns:1fr;}}
html[data-theme="dark"] .ef{color:#f5f5f7;}
html[data-theme="dark"] .ef-card,
html[data-theme="dark"] .ef-spark-wrap,
html[data-theme="dark"] .ef-donut-card,
html[data-theme="dark"] .ef-section{background:#1c1c1e;border-color:rgba(255,255,255,.08);box-shadow:0 1px 2px rgba(0,0,0,.3),0 8px 24px -12px rgba(0,0,0,.6);}
html[data-theme="dark"] .ef-card-value,
html[data-theme="dark"] .ef-donut-inner .pct,
html[data-theme="dark"] .ef-donut-title,
html[data-theme="dark"] .ef-section h2,
html[data-theme="dark"] .ef-list-title,
html[data-theme="dark"] .ef-bar-count,
html[data-theme="dark"] .ef-spark-head h3{color:#f5f5f7;}
html[data-theme="dark"] .ef-card-label,
html[data-theme="dark"] .ef-card-sub,
html[data-theme="dark"] .ef-donut-sub,
html[data-theme="dark"] .ef-bar-label,
html[data-theme="dark"] .ef-list-meta,
html[data-theme="dark"] .ef-spark-head span,
html[data-theme="dark"] .ef-spark-days span{color:#9a9aa0;}
html[data-theme="dark"] .ef-donut-inner{background:#1c1c1e;}
html[data-theme="dark"] .ef-donut{background:conic-gradient(var(--ac) calc(var(--pct)*1%), #2c2c2e 0);}
html[data-theme="dark"] .ef-bar-track{background:#2c2c2e;}
html[data-theme="dark"] .ef-list li{border-bottom-color:rgba(255,255,255,.08);}
html[data-theme="dark"] .ef-quick a{background:#1c1c1e;color:#f5f5f7;border-color:rgba(255,255,255,.1);}
html[data-theme="dark"] .ef-badge.neutral{background:#2c2c2e;color:#c7c7cc;}
html[data-theme="dark"] .ef-badge.crit{background:rgba(255,105,97,.16);color:#ff8a80;}
html[data-theme="dark"] .ef-badge.warn{background:rgba(255,184,77,.16);color:#ffb84d;}
html[data-theme="dark"] .ef-badge.ok{background:rgba(74,222,128,.16);color:#4ade80;}
html[data-theme="dark"] .ef-empty{color:#6e6e73;}
html[data-theme="dark"] .ef-trend{background:rgba(74,222,128,.16);color:#4ade80;}
</style>~';

  --------------------------------------------------------------------------
  -- HERO
  --------------------------------------------------------------------------
  l_html := l_html || q'~<div class="ef">
<div class="ef-hero"><div class="ef-hero-top"><div class="ef-hero-inner">
<div class="ef-hero-mark"><svg width="26" height="18" viewBox="0 0 48 32" xmlns="http://www.w3.org/2000/svg"><circle cx="16" cy="16" r="11" fill="none" stroke="white" stroke-width="5"/><circle cx="32" cy="16" r="11" fill="none" stroke="white" stroke-width="5"/></svg></div>
<div>~';
  IF l_ai_ok THEN
    l_html := l_html || '<div class="ef-ai-badge"><span class="dot"></span>AI Insight</div>';
  END IF;
  l_html := l_html || '<h1>'||l_greeting||'</h1><p>'||l_insight_safe||'</p>';
  IF l_resolve_task_id IS NOT NULL THEN
    l_html := l_html || '<a class="ef-resolve-btn" href="'||APEX_PAGE.GET_URL(p_page=>43, p_items=>'P43_TASK_ID', p_values=>l_resolve_task_id)||'">'
      ||APEX_ESCAPE.HTML(l_resolve_label)||': '||APEX_ESCAPE.HTML(l_resolve_task_name)||' &rarr;</a>';
  END IF;
  l_html := l_html || '</div></div>';

  l_html := l_html || '<div class="ef-hero-meta">';
  l_html := l_html || '<span class="ef-pill ef-live" id="ef-updated-pill" data-ts="'||TO_CHAR(SYSTIMESTAMP AT TIME ZONE 'UTC','YYYY-MM-DD"T"HH24:MI:SS"Z"')||'"><span class="pulse"></span><span id="ef-updated-text">Live</span></span>';
  l_html := l_html || '<span class="ef-pill">'||TO_CHAR(SYSDATE,'Dy, DD Mon YYYY')||'</span>';
  IF l_overdue > 0 THEN
    l_html := l_html || '<span class="ef-pill warn">'||l_overdue||' task'||CASE WHEN l_overdue=1 THEN '' ELSE 's' END||' overdue</span>';
  END IF;
  IF l_blocked > 0 THEN
    l_html := l_html || '<span class="ef-pill warn">'||l_blocked||' blocked</span>';
  END IF;
  l_html := l_html || '</div>';
  l_html := l_html || '</div></div>';

  --------------------------------------------------------------------------
  -- QUICK ACTIONS
  --------------------------------------------------------------------------
  l_html := l_html || '<div class="ef-quick">';
  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>40)||'"><span class="qd" style="background:#00c7be;"></span>View Projects</a>';
  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>42)||'"><span class="qd" style="background:#5856d6;"></span>View Tasks</a>';
  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>13)||'"><span class="qd" style="background:#ff9500;"></span>View Employees</a>';
  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>5)||'"><span class="qd" style="background:#0071e3;"></span>View Organizations</a>';
  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>51)||'"><span class="qd" style="background:#8a94a6;"></span>View Audit Log</a>';
  l_html := l_html || '</div>';

  --------------------------------------------------------------------------
  -- KPI CARDS
  --------------------------------------------------------------------------
  l_html := l_html || '<div class="ef-grid">';

  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>5)||'" class="ef-card" style="--ac:#0071e3;--ac2:#42a5ff;">';
  l_html := l_html || q'~<div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 21V5a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v16"/><path d="M9 9h1M9 13h1M14 9h1M14 13h1"/><path d="M17 21v-7a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7"/><path d="M3 21h18"/></svg></div><span class="ef-card-label">Organizations</span>~';
  IF l_org_new > 0 THEN l_html := l_html || '<span class="ef-trend">+'||l_org_new||'</span>'; END IF;
  l_html := l_html || '</div><div class="ef-card-value">'||l_orgs||'</div><div class="ef-card-sub">Business units</div></a>';

  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>9)||'" class="ef-card" style="--ac:#34c759;--ac2:#6adf87;">';
  l_html := l_html || q'~<div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="5" r="2"/><circle cx="5" cy="19" r="2"/><circle cx="19" cy="19" r="2"/><path d="M12 7v4M12 11l-6 6M12 11l6 6"/></svg></div><span class="ef-card-label">Departments</span>~';
  IF l_dept_new > 0 THEN l_html := l_html || '<span class="ef-trend">+'||l_dept_new||'</span>'; END IF;
  l_html := l_html || '</div><div class="ef-card-value">'||l_depts||'</div><div class="ef-card-sub">Across '||l_orgs||' org'||CASE WHEN l_orgs=1 THEN '' ELSE 's' END||'</div></a>';

  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>13)||'" class="ef-card" style="--ac:#ff9500;--ac2:#ffb84d;">';
  l_html := l_html || q'~<div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H7a4 4 0 0 0-4 4v2"/><circle cx="10" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg></div><span class="ef-card-label">Employees</span>~';
  IF l_emp_new > 0 THEN l_html := l_html || '<span class="ef-trend">+'||l_emp_new||'</span>'; END IF;
  l_html := l_html || '</div><div class="ef-card-value">'||l_emps||'</div><div class="ef-card-sub">Headcount</div></a>';

  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>19)||'" class="ef-card" style="--ac:#af52de;--ac2:#cf8bef;">';
  l_html := l_html || q'~<div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/><path d="M2 13h20"/></svg></div><span class="ef-card-label">Clients</span></div>~' || '<div class="ef-card-value">' || l_clients || '</div><div class="ef-card-sub">Active accounts</div></a>';

  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>4)||'" class="ef-card" style="--ac:#ff3b30;--ac2:#ff7a70;">';
  l_html := l_html || q'~<div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg></div><span class="ef-card-label">Locations</span></div>~' || '<div class="ef-card-value">' || l_locs || '</div><div class="ef-card-sub">Sites</div></a>';

  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>40)||'" class="ef-card" style="--ac:#00c7be;--ac2:#5fe6de;">';
  l_html := l_html || q'~<div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg></div><span class="ef-card-label">Projects</span>~';
  IF l_proj_new > 0 THEN l_html := l_html || '<span class="ef-trend">+'||l_proj_new||'</span>'; END IF;
  l_html := l_html || '</div><div class="ef-card-value">'||l_projects||'</div><div class="ef-card-sub">'||l_projects_done||' completed</div></a>';

  l_html := l_html || '<a href="'||APEX_PAGE.GET_URL(p_page=>42)||'" class="ef-card" style="--ac:#5856d6;--ac2:#8a89e8;">';
  l_html := l_html || q'~<div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg></div><span class="ef-card-label">Tasks</span>~';
  IF l_task_new > 0 THEN l_html := l_html || '<span class="ef-trend">+'||l_task_new||'</span>'; END IF;
  l_html := l_html || '</div><div class="ef-card-value">'||l_tasks||'</div><div class="ef-card-sub">'||l_tasks_done||' done &middot; '||l_blocked||' blocked</div></a>';

  l_html := l_html || '</div>';

  --------------------------------------------------------------------------
  -- 7-DAY ACTIVITY SPARKLINE (from AUDIT_LOG - genuinely live data)
  --------------------------------------------------------------------------
  DECLARE
    TYPE t_num_tab IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    l_day_cnt  t_num_tab;
    l_max_cnt  NUMBER := 0;
    l_bars     CLOB := '';
    l_daylbls  CLOB := '';
    l_total7   NUMBER := 0;
  BEGIN
    FOR i IN 0 .. 6 LOOP
      SELECT COUNT(*) INTO l_day_cnt(i) FROM audit_log WHERE TRUNC(changed_at) = TRUNC(SYSDATE) - (6 - i);
      l_total7 := l_total7 + l_day_cnt(i);
      IF l_day_cnt(i) > l_max_cnt THEN l_max_cnt := l_day_cnt(i); END IF;
    END LOOP;
    FOR i IN 0 .. 6 LOOP
      l_bars := l_bars || '<div class="ef-spark-bar" style="height:'
        ||(CASE WHEN l_max_cnt = 0 THEN 4 ELSE GREATEST(4, ROUND(l_day_cnt(i) / l_max_cnt * 44)) END)
        ||'px;" title="'||l_day_cnt(i)||' change'||CASE WHEN l_day_cnt(i) = 1 THEN '' ELSE 's' END||'"></div>';
      l_daylbls := l_daylbls || '<span>'||TO_CHAR(SYSDATE - (6 - i), 'Dy')||'</span>';
    END LOOP;
    l_html := l_html || '<div class="ef-spark-wrap"><div class="ef-spark-head"><h3>Activity, last 7 days</h3><span>'
      ||l_total7||' change'||CASE WHEN l_total7 = 1 THEN '' ELSE 's' END||'</span></div>'
      ||'<div class="ef-spark">'||l_bars||'</div><div class="ef-spark-days">'||l_daylbls||'</div></div>';
  END;

  --------------------------------------------------------------------------
  -- COMPLETION DONUTS
  --------------------------------------------------------------------------
  l_html := l_html || '<div class="ef-overview">';
  l_html := l_html || '<div class="ef-donut-card"><div class="ef-donut" style="--ac:#0071e3;--pct:'||l_task_pct||';"><div class="ef-donut-inner"><div class="pct">'||l_task_pct||'%</div></div></div><div><p class="ef-donut-title">Task Completion</p><p class="ef-donut-sub">'||l_tasks_done||' of '||l_tasks||' tasks done</p></div></div>';
  l_html := l_html || '<div class="ef-donut-card"><div class="ef-donut" style="--ac:#00c7be;--pct:'||l_proj_pct||';"><div class="ef-donut-inner"><div class="pct">'||l_proj_pct||'%</div></div></div><div><p class="ef-donut-title">Project Completion</p><p class="ef-donut-sub">'||l_projects_done||' of '||l_projects||' projects done</p></div></div>';
  l_html := l_html || '</div>';

  --------------------------------------------------------------------------
  -- UPCOMING DEADLINES + RECENT ACTIVITY (now sourced from AUDIT_LOG)
  --------------------------------------------------------------------------
  l_html := l_html || '<div class="ef-two-col">';

  l_html := l_html || '<div class="ef-section"><h2><span class="sw" style="--ac:#ff3b30;"></span>Upcoming Deadlines</h2><ul class="ef-list">';
  FOR r IN (
    SELECT t.task_name, p.project_name, t.due_date,
           TRUNC(t.due_date) - TRUNC(SYSDATE) days_left
    FROM task t
    LEFT JOIN project p ON p.project_id = t.project_id
    LEFT JOIN status s ON s.status_id = t.status_id
    WHERE s.status_code NOT IN ('DONE','CANCELLED') AND t.due_date IS NOT NULL
    ORDER BY t.due_date ASC
    FETCH FIRST 5 ROWS ONLY
  ) LOOP
    l_any_deadline := TRUE;
    l_html := l_html || '<li><span class="ef-list-dot '||CASE WHEN r.days_left < 0 THEN 'red' WHEN r.days_left <= 3 THEN 'orange' ELSE '' END||'"></span>';
    l_html := l_html || '<div class="ef-list-body"><div class="ef-list-title">'||APEX_ESCAPE.HTML(r.task_name)||'</div><div class="ef-list-meta">'||APEX_ESCAPE.HTML(NVL(r.project_name,'No project'))||'</div></div>';
    l_html := l_html || '<span class="ef-badge '||CASE WHEN r.days_left < 0 THEN 'crit' WHEN r.days_left <= 3 THEN 'warn' ELSE 'neutral' END||'">'
      ||CASE WHEN r.days_left < 0 THEN ABS(r.days_left)||'d overdue' WHEN r.days_left = 0 THEN 'Due today' WHEN r.days_left = 1 THEN 'Tomorrow' ELSE r.days_left||' days' END
      ||'</span></li>';
  END LOOP;
  IF NOT l_any_deadline THEN
    l_html := l_html || '<div class="ef-empty">No open tasks with a due date. You are all caught up.</div>';
  END IF;
  l_html := l_html || '</ul></div>';

  l_html := l_html || '<div class="ef-section"><h2><span class="sw" style="--ac:#0071e3;"></span>Recent Activity</h2><ul class="ef-list">';
  FOR r IN (
    SELECT audit_log_id, table_name, record_id, action, old_values, new_values, changed_at, changed_by
    FROM audit_log
    ORDER BY audit_log_id DESC
    FETCH FIRST 6 ROWS ONLY
  ) LOOP
    l_any_activity := TRUE;
    DECLARE
      l_old     JSON_OBJECT_T;
      l_new     JSON_OBJECT_T;
      l_keys    JSON_KEY_LIST;
      l_summary VARCHAR2(300);
      l_color   VARCHAR2(20);
      l_letter  VARCHAR2(2);
      l_old_v   VARCHAR2(4000);
      l_new_v   VARCHAR2(4000);
    BEGIN
      l_color := CASE r.table_name
                   WHEN 'ORGANIZATION' THEN '#0071e3'
                   WHEN 'DEPARTMENT'   THEN '#34c759'
                   WHEN 'EMPLOYEE'     THEN '#ff9500'
                   WHEN 'PROJECT'      THEN '#00c7be'
                   WHEN 'TASK'         THEN '#5856d6'
                   ELSE '#8a94a6'
                 END;
      l_letter := SUBSTR(r.table_name, 1, 1);

      IF r.action = 'UPDATE' THEN
        l_old  := JSON_OBJECT_T.parse(r.old_values);
        l_new  := JSON_OBJECT_T.parse(r.new_values);
        l_keys := l_new.get_keys();
        FOR i IN 1 .. l_keys.COUNT LOOP
          BEGIN
            l_old_v := l_old.get_string(l_keys(i));
          EXCEPTION WHEN OTHERS THEN
            l_old_v := NULL;
          END;
          BEGIN
            l_new_v := l_new.get_string(l_keys(i));
          EXCEPTION WHEN OTHERS THEN
            l_new_v := NULL;
          END;
          l_old_v := NVL(l_old_v, 'null');
          l_new_v := NVL(l_new_v, 'null');
          IF l_old_v != l_new_v AND l_summary IS NULL THEN
            l_summary := LOWER(l_keys(i))||' changed';
          END IF;
        END LOOP;
        IF l_summary IS NULL THEN
          l_summary := 'updated, no field changes';
        END IF;
      ELSIF r.action = 'INSERT' THEN
        l_summary := 'created';
      ELSE
        l_summary := 'deleted';
      END IF;

      l_html := l_html || '<li><div class="ef-activity-icon" style="background:'||l_color||';">'||l_letter||'</div>';
      l_html := l_html || '<div class="ef-list-body"><div class="ef-list-title">'||INITCAP(r.table_name)||' #'||r.record_id||'</div><div class="ef-list-meta">'
        ||APEX_ESCAPE.HTML(l_summary)||' &middot; '||APEX_ESCAPE.HTML(r.changed_by)||'</div></div>';
      l_html := l_html || '<span class="ef-badge '||CASE r.action WHEN 'INSERT' THEN 'ok' WHEN 'DELETE' THEN 'crit' ELSE 'neutral' END||'">'||r.action||'</span></li>';
    EXCEPTION WHEN OTHERS THEN
      l_html := l_html || '<li><div class="ef-list-body"><div class="ef-list-meta">Unable to render entry #'
        ||TO_CHAR(r.audit_log_id)||'</div></div></li>';
    END;
  END LOOP;
  IF NOT l_any_activity THEN
    l_html := l_html || '<div class="ef-empty">No activity recorded yet.</div>';
  END IF;
  l_html := l_html || '</ul></div>';

  l_html := l_html || '</div>';

  --------------------------------------------------------------------------
  -- STATUS / PRIORITY / DEPARTMENT BREAKDOWNS
  --------------------------------------------------------------------------
  l_html := l_html || '<div class="ef-two-col">';

  l_html := l_html || '<div class="ef-section"><h2><span class="sw" style="--ac:#0071e3;"></span>Projects by Status</h2>';
  FOR r IN (
    SELECT s.status_name, COUNT(p.project_id) cnt
    FROM status s LEFT JOIN project p ON p.status_id = s.status_id
    WHERE s.entity_type = 'PROJECT'
    GROUP BY s.status_name, s.sort_order ORDER BY s.sort_order
  ) LOOP
    l_html := l_html || '<div class="ef-bar-row"><div class="ef-bar-label">'||r.status_name||'</div><div class="ef-bar-track"><div class="ef-bar-fill" style="width:'||(CASE WHEN l_projects=0 THEN 0 ELSE ROUND(r.cnt/l_projects*100) END)||'%"></div></div><div class="ef-bar-count">'||r.cnt||'</div></div>';
  END LOOP;
  l_html := l_html || '</div>';

  l_html := l_html || '<div class="ef-section"><h2><span class="sw" style="--ac:#5856d6;"></span>Tasks by Status</h2>';
  FOR r IN (
    SELECT s.status_name, COUNT(t.task_id) cnt
    FROM status s LEFT JOIN task t ON t.status_id = s.status_id
    WHERE s.entity_type = 'TASK'
    GROUP BY s.status_name, s.sort_order ORDER BY s.sort_order
  ) LOOP
    l_html := l_html || '<div class="ef-bar-row"><div class="ef-bar-label">'||r.status_name||'</div><div class="ef-bar-track"><div class="ef-bar-fill" style="width:'||(CASE WHEN l_tasks=0 THEN 0 ELSE ROUND(r.cnt/l_tasks*100) END)||'%"></div></div><div class="ef-bar-count">'||r.cnt||'</div></div>';
  END LOOP;
  l_html := l_html || '</div>';

  l_html := l_html || '</div>';

  l_html := l_html || '<div class="ef-two-col">';

  l_html := l_html || '<div class="ef-section"><h2><span class="sw" style="--ac:#ff9500;"></span>Tasks by Priority</h2>';
  FOR r IN (
    SELECT pr.priority_name, COUNT(t.task_id) cnt
    FROM priority pr LEFT JOIN task t ON t.priority_id = pr.priority_id
    GROUP BY pr.priority_name, pr.sort_order ORDER BY pr.sort_order
  ) LOOP
    l_html := l_html || '<div class="ef-bar-row"><div class="ef-bar-label">'||r.priority_name||'</div><div class="ef-bar-track"><div class="ef-bar-fill" style="width:'||(CASE WHEN l_tasks=0 THEN 0 ELSE ROUND(r.cnt/l_tasks*100) END)||'%"></div></div><div class="ef-bar-count">'||r.cnt||'</div></div>';
  END LOOP;
  l_html := l_html || '</div>';

  l_html := l_html || '<div class="ef-section"><h2><span class="sw" style="--ac:#34c759;"></span>Employees by Department</h2>';
  FOR r IN (
    SELECT d.department_name, COUNT(e.employee_id) cnt
    FROM department d LEFT JOIN employee e ON e.department_id = d.department_id
    GROUP BY d.department_name ORDER BY COUNT(e.employee_id) DESC
  ) LOOP
    l_html := l_html || '<div class="ef-bar-row"><div class="ef-bar-label">'||r.department_name||'</div><div class="ef-bar-track"><div class="ef-bar-fill" style="width:'||(CASE WHEN l_emps=0 THEN 0 ELSE ROUND(r.cnt/l_emps*100) END)||'%"></div></div><div class="ef-bar-count">'||r.cnt||'</div></div>';
  END LOOP;
  l_html := l_html || '</div>';

  l_html := l_html || '</div>';

  l_html := l_html || '</div>';

  --------------------------------------------------------------------------
  -- LIVE: ticking "Xs ago" text next to the Live pill, re-applied every
  -- second since apex.region().refresh() swaps the region's DOM via
  -- innerHTML, which does NOT re-execute this <script> tag - a "run once"
  -- timer would keep finding a stale pill element after every 60s
  -- refresh. Dark mode itself lives entirely in custom.css / widget.js
  -- now (html[data-theme] set by the global header toggle), so this
  -- region doesn't need to manage theme state at all - it just inherits
  -- whatever the rest of the app is showing. The refresh uses the
  -- region's auto-generated internal id ("R" || region id), since the
  -- Static ID shown in Page Designer isn't wired into APEX's JS registry
  -- for this region type. Both intervals are guarded against stacking if
  -- this script is ever re-inserted into the DOM.
  --------------------------------------------------------------------------
  l_html := l_html || q'~<script>
(function(){
  function tick(){
    var pill = document.getElementById('ef-updated-pill');
    var txt = document.getElementById('ef-updated-text');
    if (!pill || !txt) { return; }
    var ts = new Date(pill.getAttribute('data-ts'));
    var secs = Math.floor((Date.now() - ts.getTime()) / 1000);
    txt.textContent = secs < 5 ? 'Live' : secs < 60 ? (secs + 's ago') : (Math.floor(secs / 60) + 'm ago');
  }
  tick();
  if (!window.__efDashLiveTimer) {
    window.__efDashLiveTimer = setInterval(tick, 1000);
  }
  if (!window.__efDashRefreshTimer) {
    window.__efDashRefreshTimer = setInterval(function(){
      var r = window.apex && apex.region && apex.region('R9114769350531102');
      if (r && r.refresh) { r.refresh(); }
    }, 60000);
  }
})();
</script>~';

  RETURN l_html;
END render_dashboard_html;
/
