-- ============================================================
-- EnterpriseFlow - AI data snapshot
--
-- Builds the authoritative state block prepended to every assistant
-- message. Two rules this file exists to enforce:
--
--   1. ACTIVE_FLAG = 'Y' everywhere. The dashboard honours the
--      soft-delete flag, so the assistant must too - otherwise the
--      two disagree about the same workspace and the user cannot tell
--      which is lying. A retired record is not part of the answer.
--
--   2. Ids are included because the model needs them to join records,
--      but the agent's system prompt forbids printing them to the
--      user. Names are what the reader asked about.
-- ============================================================

CREATE OR REPLACE FUNCTION "AI_BUILD_DATA_SNAPSHOT" RETURN CLOB IS
  l_out CLOB;
BEGIN
  l_out := 'ORGANIZATIONS (id: name):' || CHR(10);
  FOR r IN (SELECT organization_id, organization_name FROM organization
             WHERE active_flag = 'Y' ORDER BY organization_id) LOOP
    l_out := l_out || r.organization_id || ': ' || r.organization_name || CHR(10);
  END LOOP;

  l_out := l_out || CHR(10) || 'DEPARTMENTS (id: name, org):' || CHR(10);
  FOR r IN (SELECT department_id, department_name, organization_id FROM department
             WHERE active_flag = 'Y' ORDER BY department_id) LOOP
    l_out := l_out || r.department_id || ': ' || r.department_name || ', org ' || r.organization_id || CHR(10);
  END LOOP;

  l_out := l_out || CHR(10) || 'ROLES (id: name, dept):' || CHR(10);
  FOR r IN (SELECT role_id, role_name, department_id FROM role
             WHERE active_flag = 'Y' ORDER BY role_id) LOOP
    l_out := l_out || r.role_id || ': ' || r.role_name || ', dept ' || r.department_id || CHR(10);
  END LOOP;

  -- active= dropped: every row here is active by definition now.
  l_out := l_out || CHR(10) || 'EMPLOYEES (id: name, dept, role):' || CHR(10);
  FOR r IN (SELECT employee_id, first_name, last_name, department_id, role_id FROM employee
             WHERE active_flag = 'Y' ORDER BY employee_id) LOOP
    l_out := l_out || r.employee_id || ': ' || r.first_name || ' ' || r.last_name
      || ', dept ' || r.department_id || ', role ' || r.role_id || CHR(10);
  END LOOP;

  l_out := l_out || CHR(10) || 'CLIENTS (id: name):' || CHR(10);
  FOR r IN (SELECT client_id, client_name FROM client
             WHERE active_flag = 'Y' ORDER BY client_id) LOOP
    l_out := l_out || r.client_id || ': ' || r.client_name || CHR(10);
  END LOOP;

  l_out := l_out || CHR(10) || 'LOCATIONS (id: name, city):' || CHR(10);
  FOR r IN (SELECT location_id, location_name, city FROM location
             WHERE active_flag = 'Y' ORDER BY location_id) LOOP
    l_out := l_out || r.location_id || ': ' || r.location_name || ', ' || r.city || CHR(10);
  END LOOP;

  l_out := l_out || CHR(10) || 'STATUSES (id: code/name, for):' || CHR(10);
  FOR r IN (SELECT status_id, status_code, status_name, entity_type FROM status
             WHERE active_flag = 'Y' ORDER BY status_id) LOOP
    l_out := l_out || r.status_id || ': ' || r.status_code || '/' || r.status_name || ', for ' || r.entity_type || CHR(10);
  END LOOP;

  l_out := l_out || CHR(10) || 'PRIORITIES (id: name):' || CHR(10);
  FOR r IN (SELECT priority_id, priority_name FROM priority
             WHERE active_flag = 'Y' ORDER BY priority_id) LOOP
    l_out := l_out || r.priority_id || ': ' || r.priority_name || CHR(10);
  END LOOP;

  l_out := l_out || CHR(10) || 'PROJECTS (id: name, org, client, status, start-end):' || CHR(10);
  FOR r IN (
    SELECT p.project_id, p.project_name, p.organization_id, p.client_id, s.status_name, p.start_date, p.end_date
      FROM project p LEFT JOIN status s ON s.status_id = p.status_id
     WHERE p.active_flag = 'Y'
     ORDER BY p.project_id
  ) LOOP
    l_out := l_out || r.project_id || ': ' || r.project_name || ', org ' || r.organization_id
      || ', client ' || NVL(TO_CHAR(r.client_id),'none')
      || ', status ' || NVL(r.status_name,'none') || ', '
      || NVL(TO_CHAR(r.start_date,'YYYY-MM-DD'),'?') || ' to ' || NVL(TO_CHAR(r.end_date,'YYYY-MM-DD'),'?') || CHR(10);
  END LOOP;

  l_out := l_out || CHR(10) || 'TASKS (id: name, project, assignee, status, priority, due):' || CHR(10);
  FOR r IN (
    SELECT t.task_id, t.task_name, t.project_id, t.assigned_to_employee_id, s.status_name, pr.priority_name, t.due_date
      FROM task t
      LEFT JOIN status s ON s.status_id = t.status_id
      LEFT JOIN priority pr ON pr.priority_id = t.priority_id
     WHERE t.active_flag = 'Y'
     ORDER BY t.task_id
  ) LOOP
    l_out := l_out || r.task_id || ': ' || r.task_name || ', project ' || r.project_id
      || ', assignee ' || NVL(TO_CHAR(r.assigned_to_employee_id),'unassigned')
      || ', status ' || NVL(r.status_name,'none') || ', priority ' || NVL(r.priority_name,'none')
      || ', due ' || NVL(TO_CHAR(r.due_date,'YYYY-MM-DD'),'none') || CHR(10);
  END LOOP;

  -- Today, stated explicitly. Without it the model has to infer the
  -- current date to decide what "overdue" means, and gets it wrong.
  l_out := l_out || CHR(10) || 'TODAY: ' || TO_CHAR(SYSDATE,'YYYY-MM-DD') || CHR(10);

  RETURN l_out;
END ai_build_data_snapshot;
/
