-- ============================================================
-- EnterpriseFlow - Core Module
-- 03_constraints.sql
--
-- Unique keys, check constraints, and foreign keys, added after
-- table creation so relationships can reference tables regardless
-- of the order they were created in.
--
-- Naming convention:
--   UK_<TABLE>_<COLUMN>       unique key
--   CK_<TABLE>_<COLUMN>       check constraint
--   FK_<TABLE>_<REF_TABLE>    foreign key
-- ============================================================

-- ORGANIZATION -------------------------------------------------

ALTER TABLE organization
ADD CONSTRAINT uk_organization_code
UNIQUE (organization_code);

-- Codes are system identifiers used in URLs/APIs, not free text -
-- enforce a predictable, uppercase, no-whitespace format.
ALTER TABLE organization
ADD CONSTRAINT ck_organization_code
CHECK (REGEXP_LIKE(organization_code, '^[A-Z0-9_]+$'));

ALTER TABLE organization
ADD CONSTRAINT ck_organization_active_flag
CHECK (active_flag IN ('Y', 'N'));

-- DEPARTMENT -----------------------------------------------------

ALTER TABLE department
ADD CONSTRAINT uk_department_code
UNIQUE (department_code);

ALTER TABLE department
ADD CONSTRAINT ck_department_code
CHECK (REGEXP_LIKE(department_code, '^[A-Z0-9_]+$'));

ALTER TABLE department
ADD CONSTRAINT ck_department_active_flag
CHECK (active_flag IN ('Y', 'N'));

ALTER TABLE department
ADD CONSTRAINT fk_department_organization
FOREIGN KEY (organization_id)
REFERENCES organization (organization_id);

-- ROLE -------------------------------------------------------------

ALTER TABLE role
ADD CONSTRAINT uk_role_code
UNIQUE (role_code);

ALTER TABLE role
ADD CONSTRAINT ck_role_code
CHECK (REGEXP_LIKE(role_code, '^[A-Z0-9_]+$'));

ALTER TABLE role
ADD CONSTRAINT ck_role_active_flag
CHECK (active_flag IN ('Y', 'N'));

ALTER TABLE role
ADD CONSTRAINT fk_role_department
FOREIGN KEY (department_id)
REFERENCES department (department_id);

-- STATUS -------------------------------------------------------

-- A status code is only unique within its entity type - PROJECT and
-- TASK can each have their own 'OPEN' without colliding.
ALTER TABLE status
ADD CONSTRAINT uk_status_entity_code
UNIQUE (entity_type, status_code);

ALTER TABLE status
ADD CONSTRAINT ck_status_code
CHECK (REGEXP_LIKE(status_code, '^[A-Z0-9_]+$'));

ALTER TABLE status
ADD CONSTRAINT ck_status_active_flag
CHECK (active_flag IN ('Y', 'N'));

-- PRIORITY -------------------------------------------------------

ALTER TABLE priority
ADD CONSTRAINT uk_priority_code
UNIQUE (priority_code);

ALTER TABLE priority
ADD CONSTRAINT ck_priority_code
CHECK (REGEXP_LIKE(priority_code, '^[A-Z0-9_]+$'));

ALTER TABLE priority
ADD CONSTRAINT ck_priority_active_flag
CHECK (active_flag IN ('Y', 'N'));

-- CLIENT -------------------------------------------------------

ALTER TABLE client
ADD CONSTRAINT uk_client_code
UNIQUE (client_code);

ALTER TABLE client
ADD CONSTRAINT ck_client_code
CHECK (REGEXP_LIKE(client_code, '^[A-Z0-9_]+$'));

ALTER TABLE client
ADD CONSTRAINT ck_client_active_flag
CHECK (active_flag IN ('Y', 'N'));

ALTER TABLE client
ADD CONSTRAINT fk_client_organization
FOREIGN KEY (organization_id)
REFERENCES organization (organization_id);

-- LOCATION -------------------------------------------------------

ALTER TABLE location
ADD CONSTRAINT uk_location_code
UNIQUE (location_code);

ALTER TABLE location
ADD CONSTRAINT ck_location_code
CHECK (REGEXP_LIKE(location_code, '^[A-Z0-9_]+$'));

ALTER TABLE location
ADD CONSTRAINT ck_location_active_flag
CHECK (active_flag IN ('Y', 'N'));

ALTER TABLE location
ADD CONSTRAINT fk_location_organization
FOREIGN KEY (organization_id)
REFERENCES organization (organization_id);

-- EMPLOYEE -----------------------------------------------------

ALTER TABLE employee
ADD CONSTRAINT uk_employee_code
UNIQUE (employee_code);

ALTER TABLE employee
ADD CONSTRAINT uk_employee_email
UNIQUE (email);

ALTER TABLE employee
ADD CONSTRAINT ck_employee_code
CHECK (REGEXP_LIKE(employee_code, '^[A-Z0-9_]+$'));

-- Basic shape check, not full RFC 5322 validation - that belongs in
-- the application layer. This just catches obviously malformed data
-- entered directly against the database.
ALTER TABLE employee
ADD CONSTRAINT ck_employee_email
CHECK (REGEXP_LIKE(email, '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]+$'));

ALTER TABLE employee
ADD CONSTRAINT ck_employee_active_flag
CHECK (active_flag IN ('Y', 'N'));

ALTER TABLE employee
ADD CONSTRAINT fk_employee_organization
FOREIGN KEY (organization_id)
REFERENCES organization (organization_id);

ALTER TABLE employee
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES department (department_id);

ALTER TABLE employee
ADD CONSTRAINT fk_employee_role
FOREIGN KEY (role_id)
REFERENCES role (role_id);

-- USER_ACCOUNT ---------------------------------------------------

ALTER TABLE user_account
ADD CONSTRAINT uk_user_account_username
UNIQUE (username);

ALTER TABLE user_account
ADD CONSTRAINT uk_user_account_email
UNIQUE (email);

ALTER TABLE user_account
ADD CONSTRAINT ck_user_account_email
CHECK (REGEXP_LIKE(email, '^[^@[:space:]]+@[^@[:space:]]+\.[^@[:space:]]+$'));

ALTER TABLE user_account
ADD CONSTRAINT ck_user_account_active_flag
CHECK (active_flag IN ('Y', 'N'));

ALTER TABLE user_account
ADD CONSTRAINT fk_user_account_organization
FOREIGN KEY (organization_id)
REFERENCES organization (organization_id);

-- Deliberately nullable - see comment on the table definition.
ALTER TABLE user_account
ADD CONSTRAINT fk_user_account_employee
FOREIGN KEY (employee_id)
REFERENCES employee (employee_id);
