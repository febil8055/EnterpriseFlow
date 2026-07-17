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
