-- ============================================================
-- EnterpriseFlow - Core Module
-- 05_comments.sql
--
-- COMMENT ON documents intent directly in the data dictionary
-- (visible via ALL_TAB_COMMENTS / ALL_COL_COMMENTS), so anyone
-- inspecting the schema years from now - or generating docs from
-- it - understands the design without needing this repo.
-- ============================================================

COMMENT ON TABLE organization IS
    'Top-level tenant entity. Every other business table in the schema '
    'traces back to an ORGANIZATION, directly or through a parent table.';

COMMENT ON COLUMN organization.organization_id IS
    'Surrogate primary key, populated from SEQ_ORGANIZATION by TRG_ORGANIZATION_BI.';

COMMENT ON COLUMN organization.organization_name IS
    'Display name of the organization.';

COMMENT ON COLUMN organization.organization_code IS
    'Short, unique, uppercase system identifier (e.g. used in URLs/APIs). '
    'Not intended to change once assigned.';

COMMENT ON COLUMN organization.email IS
    'Primary contact email for the organization.';

COMMENT ON COLUMN organization.phone IS
    'Primary contact phone number for the organization.';

COMMENT ON COLUMN organization.active_flag IS
    'Y = organization is active/enabled, N = soft-deleted or disabled. '
    'Application queries should filter on this by default.';

COMMENT ON COLUMN organization.created_at IS
    'Timestamp the row was inserted, set once by TRG_ORGANIZATION_BI. Never updated.';

COMMENT ON COLUMN organization.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN organization.updated_at IS
    'Timestamp of the most recent update, set by TRG_ORGANIZATION_BU. NULL until first update.';

COMMENT ON COLUMN organization.updated_by IS
    'User/identity that made the most recent update.';

COMMENT ON TABLE department IS
    'Organizational sub-unit belonging to exactly one ORGANIZATION.';

COMMENT ON COLUMN department.department_id IS
    'Surrogate primary key, populated from SEQ_DEPARTMENT by TRG_DEPARTMENT_BI.';

COMMENT ON COLUMN department.organization_id IS
    'Owning organization. References ORGANIZATION(organization_id).';

COMMENT ON COLUMN department.department_name IS
    'Display name of the department.';

COMMENT ON COLUMN department.department_code IS
    'Short, unique, uppercase system identifier for the department.';

COMMENT ON COLUMN department.active_flag IS
    'Y = department is active/enabled, N = soft-deleted or disabled.';

COMMENT ON COLUMN department.created_at IS
    'Timestamp the row was inserted, set once by TRG_DEPARTMENT_BI. Never updated.';

COMMENT ON COLUMN department.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN department.updated_at IS
    'Timestamp of the most recent update, set by TRG_DEPARTMENT_BU. NULL until first update.';

COMMENT ON COLUMN department.updated_by IS
    'User/identity that made the most recent update.';

COMMENT ON TABLE role IS
    'Job role/title scoped to a single DEPARTMENT, assignable to employees.';

COMMENT ON COLUMN role.role_id IS
    'Surrogate primary key, populated from SEQ_ROLE by TRG_ROLE_BI.';

COMMENT ON COLUMN role.department_id IS
    'Owning department. References DEPARTMENT(department_id).';

COMMENT ON COLUMN role.role_name IS
    'Display name of the role.';

COMMENT ON COLUMN role.role_code IS
    'Short, unique, uppercase system identifier for the role.';

COMMENT ON COLUMN role.description IS
    'Free-text description of the role''s responsibilities.';

COMMENT ON COLUMN role.active_flag IS
    'Y = role is active/enabled, N = soft-deleted or disabled.';

COMMENT ON COLUMN role.created_at IS
    'Timestamp the row was inserted, set once by TRG_ROLE_BI. Never updated.';

COMMENT ON COLUMN role.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN role.updated_at IS
    'Timestamp of the most recent update, set by TRG_ROLE_BU. NULL until first update.';

COMMENT ON COLUMN role.updated_by IS
    'User/identity that made the most recent update.';

COMMENT ON TABLE status IS
    'Shared lookup of lifecycle states, scoped per owning entity via ENTITY_TYPE '
    '(e.g. PROJECT, TASK). Referenced by PROJECT.status_id and TASK.status_id.';

COMMENT ON COLUMN status.status_id IS
    'Surrogate primary key, populated from SEQ_STATUS by TRG_STATUS_BI.';

COMMENT ON COLUMN status.entity_type IS
    'Discriminator identifying which entity this status value applies to (e.g. PROJECT, TASK).';

COMMENT ON COLUMN status.status_code IS
    'Short, uppercase system identifier for the status, unique within ENTITY_TYPE.';

COMMENT ON COLUMN status.status_name IS
    'Display name of the status.';

COMMENT ON COLUMN status.sort_order IS
    'Relative display order within the same ENTITY_TYPE (e.g. in dropdowns/kanban columns).';

COMMENT ON COLUMN status.active_flag IS
    'Y = status value is selectable, N = retired/disabled.';

COMMENT ON COLUMN status.created_at IS
    'Timestamp the row was inserted, set once by TRG_STATUS_BI. Never updated.';

COMMENT ON COLUMN status.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN status.updated_at IS
    'Timestamp of the most recent update, set by TRG_STATUS_BU. NULL until first update.';

COMMENT ON COLUMN status.updated_by IS
    'User/identity that made the most recent update.';

COMMENT ON TABLE priority IS
    'Shared lookup of priority levels (e.g. Low/Medium/High), reused across entities '
    'that need one. Referenced by TASK.priority_id.';

COMMENT ON COLUMN priority.priority_id IS
    'Surrogate primary key, populated from SEQ_PRIORITY by TRG_PRIORITY_BI.';

COMMENT ON COLUMN priority.priority_code IS
    'Short, unique, uppercase system identifier for the priority level.';

COMMENT ON COLUMN priority.priority_name IS
    'Display name of the priority level.';

COMMENT ON COLUMN priority.sort_order IS
    'Relative display order (e.g. Low=1, Medium=2, High=3).';

COMMENT ON COLUMN priority.active_flag IS
    'Y = priority value is selectable, N = retired/disabled.';

COMMENT ON COLUMN priority.created_at IS
    'Timestamp the row was inserted, set once by TRG_PRIORITY_BI. Never updated.';

COMMENT ON COLUMN priority.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN priority.updated_at IS
    'Timestamp of the most recent update, set by TRG_PRIORITY_BU. NULL until first update.';

COMMENT ON COLUMN priority.updated_by IS
    'User/identity that made the most recent update.';

COMMENT ON TABLE client IS
    'Customer of an ORGANIZATION - the party PROJECTs are delivered for.';

COMMENT ON COLUMN client.client_id IS
    'Surrogate primary key, populated from SEQ_CLIENT by TRG_CLIENT_BI.';

COMMENT ON COLUMN client.organization_id IS
    'Owning organization (the tenant this client belongs to). References ORGANIZATION(organization_id).';

COMMENT ON COLUMN client.client_code IS
    'Short, unique, uppercase system identifier for the client.';

COMMENT ON COLUMN client.client_name IS
    'Display name of the client.';

COMMENT ON COLUMN client.email IS
    'Primary contact email for the client.';

COMMENT ON COLUMN client.phone IS
    'Primary contact phone number for the client.';

COMMENT ON COLUMN client.active_flag IS
    'Y = client is active/enabled, N = soft-deleted or disabled.';

COMMENT ON COLUMN client.created_at IS
    'Timestamp the row was inserted, set once by TRG_CLIENT_BI. Never updated.';

COMMENT ON COLUMN client.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN client.updated_at IS
    'Timestamp of the most recent update, set by TRG_CLIENT_BU. NULL until first update.';

COMMENT ON COLUMN client.updated_by IS
    'User/identity that made the most recent update.';

COMMENT ON TABLE location IS
    'Physical site/address belonging to an ORGANIZATION (e.g. office, branch, warehouse).';

COMMENT ON COLUMN location.location_id IS
    'Surrogate primary key, populated from SEQ_LOCATION by TRG_LOCATION_BI.';

COMMENT ON COLUMN location.organization_id IS
    'Owning organization. References ORGANIZATION(organization_id).';

COMMENT ON COLUMN location.location_code IS
    'Short, unique, uppercase system identifier for the location.';

COMMENT ON COLUMN location.location_name IS
    'Display name of the location.';

COMMENT ON COLUMN location.address_line1 IS
    'Street address, line 1.';

COMMENT ON COLUMN location.address_line2 IS
    'Street address, line 2 (suite/unit/floor).';

COMMENT ON COLUMN location.city IS
    'City.';

COMMENT ON COLUMN location.state_province IS
    'State or province.';

COMMENT ON COLUMN location.postal_code IS
    'Postal/ZIP code.';

COMMENT ON COLUMN location.country IS
    'Country.';

COMMENT ON COLUMN location.active_flag IS
    'Y = location is active/enabled, N = soft-deleted or disabled.';

COMMENT ON COLUMN location.created_at IS
    'Timestamp the row was inserted, set once by TRG_LOCATION_BI. Never updated.';

COMMENT ON COLUMN location.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN location.updated_at IS
    'Timestamp of the most recent update, set by TRG_LOCATION_BU. NULL until first update.';

COMMENT ON COLUMN location.updated_by IS
    'User/identity that made the most recent update.';

COMMENT ON TABLE employee IS
    'Person employed by an ORGANIZATION, assigned to one DEPARTMENT and one ROLE.';

COMMENT ON COLUMN employee.employee_id IS
    'Surrogate primary key, populated from SEQ_EMPLOYEE by TRG_EMPLOYEE_BI.';

COMMENT ON COLUMN employee.organization_id IS
    'Owning organization. References ORGANIZATION(organization_id).';

COMMENT ON COLUMN employee.department_id IS
    'Assigned department. References DEPARTMENT(department_id).';

COMMENT ON COLUMN employee.role_id IS
    'Assigned role. References ROLE(role_id).';

COMMENT ON COLUMN employee.employee_code IS
    'Short, unique, uppercase system identifier for the employee (e.g. badge/payroll number).';

COMMENT ON COLUMN employee.first_name IS
    'Employee first name.';

COMMENT ON COLUMN employee.last_name IS
    'Employee last name.';

COMMENT ON COLUMN employee.email IS
    'Unique work email address, used for login/notifications.';

COMMENT ON COLUMN employee.phone IS
    'Contact phone number.';

COMMENT ON COLUMN employee.hire_date IS
    'Date the employee was hired.';

COMMENT ON COLUMN employee.active_flag IS
    'Y = employee is active/enabled, N = soft-deleted or disabled (e.g. terminated).';

COMMENT ON COLUMN employee.created_at IS
    'Timestamp the row was inserted, set once by TRG_EMPLOYEE_BI. Never updated.';

COMMENT ON COLUMN employee.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN employee.updated_at IS
    'Timestamp of the most recent update, set by TRG_EMPLOYEE_BU. NULL until first update.';

COMMENT ON COLUMN employee.updated_by IS
    'User/identity that made the most recent update.';

COMMENT ON TABLE user_account IS
    'Login/security identity, scoped to an ORGANIZATION. Deliberately separate '
    'from EMPLOYEE - not every login is an employee (contractor, client portal '
    'user, service account) and not every employee has a login.';

COMMENT ON COLUMN user_account.user_account_id IS
    'Surrogate primary key, populated from SEQ_USER_ACCOUNT by TRG_USER_ACCOUNT_BI.';

COMMENT ON COLUMN user_account.organization_id IS
    'Owning organization (the tenant this login belongs to). References ORGANIZATION(organization_id).';

COMMENT ON COLUMN user_account.employee_id IS
    'Optional link to the EMPLOYEE this account belongs to. NULL for contractor/client/service accounts.';

COMMENT ON COLUMN user_account.username IS
    'Unique login name.';

COMMENT ON COLUMN user_account.email IS
    'Unique email address for the account, used for notifications/password reset.';

COMMENT ON COLUMN user_account.password_hash IS
    'Salted password hash only. The application layer must never write plaintext to this column.';

COMMENT ON COLUMN user_account.user_type IS
    'Kind of identity this account represents: EMPLOYEE, CONTRACTOR, CLIENT, or SERVICE.';

COMMENT ON COLUMN user_account.last_login_at IS
    'Timestamp of the most recent successful login, maintained by the application/auth layer.';

COMMENT ON COLUMN user_account.active_flag IS
    'Y = account can log in, N = disabled/locked out.';

COMMENT ON COLUMN user_account.created_at IS
    'Timestamp the row was inserted, set once by TRG_USER_ACCOUNT_BI. Never updated.';

COMMENT ON COLUMN user_account.created_by IS
    'User/identity that inserted the row.';

COMMENT ON COLUMN user_account.updated_at IS
    'Timestamp of the most recent update, set by TRG_USER_ACCOUNT_BU. NULL until first update.';

COMMENT ON COLUMN user_account.updated_by IS
    'User/identity that made the most recent update.';
