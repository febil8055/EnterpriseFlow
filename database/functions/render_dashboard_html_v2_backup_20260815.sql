CREATE OR REPLACE FUNCTION "RENDER_DASHBOARD_HTML" RETURN CLOB IS
  l_html CLOB := '';
  l_orgs NUMBER; l_depts NUMBER; l_emps NUMBER; l_clients NUMBER; l_locs NUMBER; l_projects NUMBER; l_tasks NUMBER;
  l_tasks_done NUMBER; l_projects_done NUMBER; l_task_pct NUMBER; l_proj_pct NUMBER;
  l_blocked NUMBER; l_overdue NUMBER; l_prompt CLOB; l_insight CLOB; l_insight_safe VARCHAR2(4000); l_ai_ok BOOLEAN := TRUE;
  l_greeting VARCHAR2(40);
  l_hr NUMBER := TO_NUMBER(TO_CHAR(SYSDATE,'HH24'));
  l_any_deadline BOOLEAN := FALSE;
  l_any_activity BOOLEAN := FALSE;
  l_app_id VARCHAR2(10) := 'APP_ID';
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
.ef-hero{position:relative;overflow:hidden;padding:36px 36px;margin-bottom:20px;border-radius:24px;background:linear-gradient(135deg,#0b0f19 0%,#14213d 55%,#0b1a33 100%);}
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
.ef-quick{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:24px;}
.ef-quick a{text-decoration:none;font-size:13.5px;font-weight:600;color:#1d1d1f;background:#fff;border:1px solid rgba(16,24,40,.08);padding:10px 16px;border-radius:12px;display:inline-flex;align-items:center;gap:8px;box-shadow:0 1px 2px rgba(16,24,40,.04);transition:transform .15s ease,box-shadow .15s ease;}
.ef-quick a:hover{transform:translateY(-2px);box-shadow:0 8px 20px -8px rgba(16,24,40,.25);}
.ef-quick a .qd{width:7px;height:7px;border-radius:2px;}
.ef-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(170px,1fr));gap:16px;margin-bottom:20px;}
.ef-card{position:relative;background:#fff;border-radius:18px;padding:20px 20px 20px;box-shadow:0 1px 2px rgba(16,24,40,.04),0 8px 24px -12px rgba(16,24,40,.10);border:1px solid rgba(16,24,40,.04);border-top:3px solid var(--ac);transition:transform .2s ease,box-shadow .2s ease;}
.ef-card:hover{transform:translateY(-3px);box-shadow:0 4px 10px rgba(16,24,40,.06),0 20px 36px -14px rgba(16,24,40,.16);}
.ef-card-top{display:flex;align-items:center;gap:10px;margin-bottom:14px;}
.ef-icon-tile{width:32px;height:32px;border-radius:10px;display:flex;align-items:center;justify-content:center;background:linear-gradient(135deg,var(--ac2),var(--ac));flex:none;box-shadow:0 4px 10px -2px var(--ac2);}
.ef-card-label{font-size:12.5px;font-weight:700;color:#667085;letter-spacing:.02em;text-transform:uppercase;}
.ef-card-value{font-size:28px;font-weight:700;letter-spacing:-0.02em;color:#101828;line-height:1;margin-bottom:5px;}
.ef-card-sub{font-size:12px;color:#8a94a6;font-weight:500;}
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
.ef-list-meta{font-size:12px;color:#8a94a6;margin-top:2px;}
.ef-badge{font-size:11px;font-weight:700;padding:3px 9px;border-radius:999px;white-space:nowrap;flex:none;}
.ef-badge.crit{background:#fdecea;color:#c0362c;}
.ef-badge.warn{background:#fff4e5;color:#b25e00;}
.ef-badge.ok{background:#e7f7ee;color:#1a7f4e;}
.ef-badge.neutral{background:#f2f4f7;color:#475467;}
.ef-empty{font-size:13px;color:#98a2b3;padding:20px 0;text-align:center;}
.ef-activity-icon{width:30px;height:30px;border-radius:9px;display:flex;align-items:center;justify-content:center;flex:none;font-size:12px;font-weight:700;color:#fff;}
@media (max-width:820px){.ef-two-col,.ef-overview{grid-template-columns:1fr;}}
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
  l_html := l_html || '<h1>'||l_greeting||'</h1><p>'||l_insight_safe||'</p></div></div>';

  l_html := l_html || '<div class="ef-hero-meta">';
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
  l_html := l_html || '</div>';

  --------------------------------------------------------------------------
  -- KPI CARDS
  --------------------------------------------------------------------------
  l_html := l_html || '<div class="ef-grid">';

  l_html := l_html || q'~<div class="ef-card" style="--ac:#0071e3;--ac2:#42a5ff;"><div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 21V5a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v16"/><path d="M9 9h1M9 13h1M14 9h1M14 13h1"/><path d="M17 21v-7a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v7"/><path d="M3 21h18"/></svg></div><span class="ef-card-label">Organizations</span></div><div class="ef-card-value">~' || l_orgs || '</div><div class="ef-card-sub">Business units</div></div>';

  l_html := l_html || q'~<div class="ef-card" style="--ac:#34c759;--ac2:#6adf87;"><div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="5" r="2"/><circle cx="5" cy="19" r="2"/><circle cx="19" cy="19" r="2"/><path d="M12 7v4M12 11l-6 6M12 11l6 6"/></svg></div><span class="ef-card-label">Departments</span></div><div class="ef-card-value">~' || l_depts || '</div><div class="ef-card-sub">Across '||l_orgs||' org'||CASE WHEN l_orgs=1 THEN '' ELSE 's' END||'</div></div>';

  l_html := l_html || q'~<div class="ef-card" style="--ac:#ff9500;--ac2:#ffb84d;"><div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H7a4 4 0 0 0-4 4v2"/><circle cx="10" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></svg></div><span class="ef-card-label">Employees</span></div><div class="ef-card-value">~' || l_emps || '</div><div class="ef-card-sub">Headcount</div></div>';

  l_html := l_html || q'~<div class="ef-card" style="--ac:#af52de;--ac2:#cf8bef;"><div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/><path d="M2 13h20"/></svg></div><span class="ef-card-label">Clients</span></div><div class="ef-card-value">~' || l_clients || '</div><div class="ef-card-sub">Active accounts</div></div>';

  l_html := l_html || q'~<div class="ef-card" style="--ac:#ff3b30;--ac2:#ff7a70;"><div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg></div><span class="ef-card-label">Locations</span></div><div class="ef-card-value">~' || l_locs || '</div><div class="ef-card-sub">Sites</div></div>';

  l_html := l_html || q'~<div class="ef-card" style="--ac:#00c7be;--ac2:#5fe6de;"><div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"/></svg></div><span class="ef-card-label">Projects</span></div><div class="ef-card-value">~' || l_projects || '</div><div class="ef-card-sub">~'||l_projects_done||' completed</div></div>';

  l_html := l_html || q'~<div class="ef-card" style="--ac:#5856d6;--ac2:#8a89e8;"><div class="ef-card-top"><div class="ef-icon-tile"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 11l3 3L22 4"/><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"/></svg></div><span class="ef-card-label">Tasks</span></div><div class="ef-card-value">~' || l_tasks || '</div><div class="ef-card-sub">~'||l_tasks_done||' done &middot; '||l_blocked||' blocked</div></div>';

  l_html := l_html || '</div>';

  --------------------------------------------------------------------------
  -- COMPLETION DONUTS
  --------------------------------------------------------------------------
  l_html := l_html || '<div class="ef-overview">';
  l_html := l_html || '<div class="ef-donut-card"><div class="ef-donut" style="--ac:#0071e3;--pct:'||l_task_pct||';"><div class="ef-donut-inner"><div class="pct">'||l_task_pct||'%</div></div></div><div><p class="ef-donut-title">Task Completion</p><p class="ef-donut-sub">'||l_tasks_done||' of '||l_tasks||' tasks done</p></div></div>';
  l_html := l_html || '<div class="ef-donut-card"><div class="ef-donut" style="--ac:#00c7be;--pct:'||l_proj_pct||';"><div class="ef-donut-inner"><div class="pct">'||l_proj_pct||'%</div></div></div><div><p class="ef-donut-title">Project Completion</p><p class="ef-donut-sub">'||l_projects_done||' of '||l_projects||' projects done</p></div></div>';
  l_html := l_html || '</div>';

  --------------------------------------------------------------------------
  -- UPCOMING DEADLINES + RECENT ACTIVITY
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
    SELECT * FROM (
      SELECT 'Project' typ, project_name nm, created_at, updated_at, NVL(updated_by,created_by) who
      FROM project
      UNION ALL
      SELECT 'Task' typ, task_name nm, created_at, updated_at, NVL(updated_by,created_by) who
      FROM task
    )
    ORDER BY COALESCE(updated_at, created_at) DESC NULLS LAST
    FETCH FIRST 6 ROWS ONLY
  ) LOOP
    l_any_activity := TRUE;
    l_html := l_html || '<li><div class="ef-activity-icon" style="background:'||CASE WHEN r.typ='Project' THEN '#00c7be' ELSE '#5856d6' END||';">'||CASE WHEN r.typ='Project' THEN 'P' ELSE 'T' END||'</div>';
    l_html := l_html || '<div class="ef-list-body"><div class="ef-list-title">'||APEX_ESCAPE.HTML(r.nm)||'</div><div class="ef-list-meta">'
      ||CASE WHEN r.updated_at IS NOT NULL AND r.updated_at != r.created_at THEN 'Updated' ELSE 'Created' END
      ||CASE WHEN r.who IS NOT NULL THEN ' by '||APEX_ESCAPE.HTML(r.who) ELSE '' END||'</div></div>';
    l_html := l_html || '<span class="ef-badge neutral">'||r.typ||'</span></li>';
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

  RETURN l_html;
END render_dashboard_html;
/
