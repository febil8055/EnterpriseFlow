-- ============================================================
-- EnterpriseFlow - Core Module
-- 07_seed_data.sql
--
-- ORGANIZATION, DEPARTMENT, ROLE, and EMPLOYEE hold real tenant data,
-- not reference/lookup values, so no seed rows belong here for them.
-- STATUS and PRIORITY are lookup tables and get their fixed value
-- sets seeded below.
-- ============================================================

-- STATUS: PROJECT lifecycle -------------------------------------

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'OPEN', 'Open', 10);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'IN_PROGRESS', 'In Progress', 20);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'ON_HOLD', 'On Hold', 30);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'COMPLETED', 'Completed', 40);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'CANCELLED', 'Cancelled', 50);

-- STATUS: TASK lifecycle -----------------------------------------

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'TODO', 'To Do', 10);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'IN_PROGRESS', 'In Progress', 20);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'IN_REVIEW', 'In Review', 30);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'BLOCKED', 'Blocked', 40);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'DONE', 'Done', 50);

-- PRIORITY (shared) -----------------------------------------------

INSERT INTO priority (priority_code, priority_name, sort_order)
VALUES ('LOW', 'Low', 10);

INSERT INTO priority (priority_code, priority_name, sort_order)
VALUES ('MEDIUM', 'Medium', 20);

INSERT INTO priority (priority_code, priority_name, sort_order)
VALUES ('HIGH', 'High', 30);

INSERT INTO priority (priority_code, priority_name, sort_order)
VALUES ('CRITICAL', 'Critical', 40);

COMMIT;
