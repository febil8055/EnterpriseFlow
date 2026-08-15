-- ============================================================
-- EnterpriseFlow - Core Module
-- 04_indexes.sql
--
-- Only indexes NOT already created implicitly by a PRIMARY KEY or
-- UNIQUE constraint belong here. Oracle auto-creates a unique index
-- for both, so ORGANIZATION needs nothing extra yet: organization_id
-- (PK) and organization_code (UK) are already indexed.
--
-- Rule of thumb applied from here on: every FOREIGN KEY column gets
-- an explicit index, because - unlike PK/UK - Oracle does NOT create
-- one automatically, and an un-indexed FK column causes full table
-- locks on the parent during child deletes/updates.
-- ============================================================

-- DEPARTMENT.organization_id (FK -> organization)
CREATE INDEX ix_department_organization
    ON department (organization_id);

-- ROLE.department_id (FK -> department)
CREATE INDEX ix_role_department
    ON role (department_id);

-- CLIENT.organization_id (FK -> organization)
CREATE INDEX ix_client_organization
    ON client (organization_id);

-- LOCATION.organization_id (FK -> organization)
CREATE INDEX ix_location_organization
    ON location (organization_id);

-- EMPLOYEE FK columns
CREATE INDEX ix_employee_organization
    ON employee (organization_id);

CREATE INDEX ix_employee_department
    ON employee (department_id);

CREATE INDEX ix_employee_role
    ON employee (role_id);

-- USER_ACCOUNT FK columns
CREATE INDEX ix_user_account_organization
    ON user_account (organization_id);

CREATE INDEX ix_user_account_employee
    ON user_account (employee_id);

-- PROJECT FK columns
CREATE INDEX ix_project_organization
    ON project (organization_id);

CREATE INDEX ix_project_client
    ON project (client_id);

CREATE INDEX ix_project_status
    ON project (status_id);

-- TASK FK columns
CREATE INDEX ix_task_project
    ON task (project_id);

CREATE INDEX ix_task_assigned_employee
    ON task (assigned_to_employee_id);

CREATE INDEX ix_task_status
    ON task (status_id);

CREATE INDEX ix_task_priority
    ON task (priority_id);

-- AUDIT_LOG is queried two ways: "show history for this record"
-- (table_name, record_id) and "show recent activity" (changed_at).
CREATE INDEX ix_audit_log_table_record
    ON audit_log (table_name, record_id);

CREATE INDEX ix_audit_log_changed_at
    ON audit_log (changed_at);
