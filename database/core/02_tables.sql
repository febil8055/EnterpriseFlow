-- ============================================================
-- EnterpriseFlow - Core Module
-- 02_tables.sql
--
-- Contains CREATE TABLE statements only, with column-level
-- PRIMARY KEY, NOT NULL, CHECK and DEFAULT constraints.
-- Foreign keys and unique keys are added separately in
-- 03_constraints.sql so relationships between core tables can be
-- wired up independent of creation order.
--
-- Audit column pattern (every table in this schema):
--   created_at   TIMESTAMP      -- SYSTIMESTAMP at insert, never changes
--   created_by   VARCHAR2(100)  -- who inserted the row
--   updated_at   TIMESTAMP      -- set by BEFORE UPDATE trigger, NULL until first update
--   updated_by   VARCHAR2(100)  -- set by BEFORE UPDATE trigger
--   active_flag  CHAR(1)        -- Y/N soft-delete / enable-disable switch
--
-- STATUS (multi-value lifecycle state) is a separate concept from
-- ACTIVE_FLAG and only appears on tables that actually need a state
-- machine (e.g. PROJECT: OPEN/IN_PROGRESS/COMPLETED/CANCELLED).
-- Simple master tables like ORGANIZATION do not carry a STATUS column.
-- ============================================================

CREATE TABLE organization (
    organization_id      NUMBER(19,0)
        CONSTRAINT pk_organization PRIMARY KEY,

    organization_name    VARCHAR2(200 CHAR)
        CONSTRAINT nn_organization_name NOT NULL,

    organization_code    VARCHAR2(50 CHAR)
        CONSTRAINT nn_organization_code NOT NULL,

    email                VARCHAR2(255 CHAR),

    phone                VARCHAR2(30 CHAR),

    active_flag          CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_organization_active_flag NOT NULL,

    created_at           TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_organization_created_at NOT NULL,

    created_by           VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_organization_created_by NOT NULL,

    updated_at           TIMESTAMP,

    updated_by           VARCHAR2(100 CHAR)
);

CREATE TABLE department (
    department_id        NUMBER(19,0)
        CONSTRAINT pk_department PRIMARY KEY,

    organization_id      NUMBER(19,0)
        CONSTRAINT nn_department_organization NOT NULL,

    department_name      VARCHAR2(200 CHAR)
        CONSTRAINT nn_department_name NOT NULL,

    department_code      VARCHAR2(50 CHAR)
        CONSTRAINT nn_department_code NOT NULL,

    active_flag           CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_department_active_flag NOT NULL,

    created_at           TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_department_created_at NOT NULL,

    created_by           VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_department_created_by NOT NULL,

    updated_at           TIMESTAMP,

    updated_by           VARCHAR2(100 CHAR)
);

CREATE TABLE role (
    role_id               NUMBER(19,0)
        CONSTRAINT pk_role PRIMARY KEY,

    department_id         NUMBER(19,0)
        CONSTRAINT nn_role_department NOT NULL,

    role_name             VARCHAR2(100 CHAR)
        CONSTRAINT nn_role_name NOT NULL,

    role_code              VARCHAR2(50 CHAR)
        CONSTRAINT nn_role_code NOT NULL,

    description            VARCHAR2(500 CHAR),

    active_flag             CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_role_active_flag NOT NULL,

    created_at             TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_role_created_at NOT NULL,

    created_by             VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_role_created_by NOT NULL,

    updated_at             TIMESTAMP,

    updated_by             VARCHAR2(100 CHAR)
);

-- STATUS and PRIORITY are shared lookup tables rather than one table
-- per owning entity. STATUS carries an ENTITY_TYPE discriminator
-- because lifecycle states genuinely differ per entity (PROJECT vs
-- TASK); PRIORITY does not, since priority levels (Low/Medium/High)
-- are the same concept regardless of what they're attached to.

CREATE TABLE status (
    status_id              NUMBER(19,0)
        CONSTRAINT pk_status PRIMARY KEY,

    entity_type            VARCHAR2(30 CHAR)
        CONSTRAINT nn_status_entity_type NOT NULL,

    status_code            VARCHAR2(50 CHAR)
        CONSTRAINT nn_status_code NOT NULL,

    status_name            VARCHAR2(100 CHAR)
        CONSTRAINT nn_status_name NOT NULL,

    sort_order             NUMBER(5,0)
        DEFAULT 0
        CONSTRAINT nn_status_sort_order NOT NULL,

    active_flag            CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_status_active_flag NOT NULL,

    created_at             TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_status_created_at NOT NULL,

    created_by             VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_status_created_by NOT NULL,

    updated_at             TIMESTAMP,

    updated_by             VARCHAR2(100 CHAR)
);

CREATE TABLE priority (
    priority_id            NUMBER(19,0)
        CONSTRAINT pk_priority PRIMARY KEY,

    priority_code          VARCHAR2(50 CHAR)
        CONSTRAINT nn_priority_code NOT NULL,

    priority_name          VARCHAR2(100 CHAR)
        CONSTRAINT nn_priority_name NOT NULL,

    sort_order             NUMBER(5,0)
        DEFAULT 0
        CONSTRAINT nn_priority_sort_order NOT NULL,

    active_flag            CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_priority_active_flag NOT NULL,

    created_at             TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_priority_created_at NOT NULL,

    created_by             VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_priority_created_by NOT NULL,

    updated_at             TIMESTAMP,

    updated_by             VARCHAR2(100 CHAR)
);

CREATE TABLE client (
    client_id              NUMBER(19,0)
        CONSTRAINT pk_client PRIMARY KEY,

    organization_id        NUMBER(19,0)
        CONSTRAINT nn_client_organization NOT NULL,

    client_code            VARCHAR2(50 CHAR)
        CONSTRAINT nn_client_code NOT NULL,

    client_name            VARCHAR2(200 CHAR)
        CONSTRAINT nn_client_name NOT NULL,

    email                  VARCHAR2(255 CHAR),

    phone                  VARCHAR2(30 CHAR),

    active_flag            CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_client_active_flag NOT NULL,

    created_at             TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_client_created_at NOT NULL,

    created_by             VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_client_created_by NOT NULL,

    updated_at             TIMESTAMP,

    updated_by             VARCHAR2(100 CHAR)
);

CREATE TABLE location (
    location_id            NUMBER(19,0)
        CONSTRAINT pk_location PRIMARY KEY,

    organization_id        NUMBER(19,0)
        CONSTRAINT nn_location_organization NOT NULL,

    location_code          VARCHAR2(50 CHAR)
        CONSTRAINT nn_location_code NOT NULL,

    location_name          VARCHAR2(200 CHAR)
        CONSTRAINT nn_location_name NOT NULL,

    address_line1          VARCHAR2(200 CHAR),

    address_line2          VARCHAR2(200 CHAR),

    city                   VARCHAR2(100 CHAR),

    state_province         VARCHAR2(100 CHAR),

    postal_code            VARCHAR2(20 CHAR),

    country                VARCHAR2(100 CHAR),

    active_flag            CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_location_active_flag NOT NULL,

    created_at             TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_location_created_at NOT NULL,

    created_by             VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_location_created_by NOT NULL,

    updated_at             TIMESTAMP,

    updated_by             VARCHAR2(100 CHAR)
);

CREATE TABLE employee (
    employee_id           NUMBER(19,0)
        CONSTRAINT pk_employee PRIMARY KEY,

    organization_id       NUMBER(19,0)
        CONSTRAINT nn_employee_organization NOT NULL,

    department_id         NUMBER(19,0)
        CONSTRAINT nn_employee_department NOT NULL,

    role_id               NUMBER(19,0)
        CONSTRAINT nn_employee_role NOT NULL,

    employee_code         VARCHAR2(50 CHAR)
        CONSTRAINT nn_employee_code NOT NULL,

    first_name            VARCHAR2(100 CHAR)
        CONSTRAINT nn_employee_first_name NOT NULL,

    last_name             VARCHAR2(100 CHAR)
        CONSTRAINT nn_employee_last_name NOT NULL,

    email                 VARCHAR2(255 CHAR)
        CONSTRAINT nn_employee_email NOT NULL,

    phone                 VARCHAR2(30 CHAR),

    hire_date             DATE
        DEFAULT SYSDATE
        CONSTRAINT nn_employee_hire_date NOT NULL,

    active_flag           CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_employee_active_flag NOT NULL,

    created_at            TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_employee_created_at NOT NULL,

    created_by             VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_employee_created_by NOT NULL,

    updated_at             TIMESTAMP,

    updated_by             VARCHAR2(100 CHAR)
);

-- USER_ACCOUNT is a login/security identity, deliberately separate
-- from EMPLOYEE: not every login is an employee (contractors, client
-- portal users, service accounts) and not every employee needs a
-- login. employee_id is therefore nullable.
CREATE TABLE user_account (
    user_account_id        NUMBER(19,0)
        CONSTRAINT pk_user_account PRIMARY KEY,

    organization_id        NUMBER(19,0)
        CONSTRAINT nn_user_account_organization NOT NULL,

    employee_id             NUMBER(19,0),

    username                VARCHAR2(100 CHAR)
        CONSTRAINT nn_user_account_username NOT NULL,

    email                   VARCHAR2(255 CHAR)
        CONSTRAINT nn_user_account_email NOT NULL,

    -- Store only a salted hash (e.g. via APEX/ORDS auth or a PL/SQL
    -- package using DBMS_CRYPTO) - the application layer must never
    -- write plaintext here.
    password_hash            VARCHAR2(255 CHAR)
        CONSTRAINT nn_user_account_password_hash NOT NULL,

    user_type                VARCHAR2(30 CHAR)
        DEFAULT 'EMPLOYEE'
        CONSTRAINT nn_user_account_user_type NOT NULL
        CONSTRAINT ck_user_account_user_type
            CHECK (user_type IN ('EMPLOYEE', 'CONTRACTOR', 'CLIENT', 'SERVICE')),

    last_login_at            TIMESTAMP,

    active_flag              CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_user_account_active_flag NOT NULL,

    created_at               TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_user_account_created_at NOT NULL,

    created_by               VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_user_account_created_by NOT NULL,

    updated_at               TIMESTAMP,

    updated_by               VARCHAR2(100 CHAR)
);

-- PROJECT.status_id and TASK.status_id both reference the shared
-- STATUS table. The FK only guarantees status_id exists somewhere in
-- STATUS - it does not by itself guarantee entity_type = 'PROJECT' or
-- 'TASK'. A declarative CHECK constraint can't safely enforce that
-- (CHECK constraints assume row-level immutability and won't re-fire
-- if STATUS.entity_type changes later), so that match is validated in
-- TRG_PROJECT_BI/BU and TRG_TASK_BI/BU in 06_triggers.sql instead.
CREATE TABLE project (
    project_id              NUMBER(19,0)
        CONSTRAINT pk_project PRIMARY KEY,

    organization_id         NUMBER(19,0)
        CONSTRAINT nn_project_organization NOT NULL,

    client_id                NUMBER(19,0),

    status_id                NUMBER(19,0)
        CONSTRAINT nn_project_status NOT NULL,

    project_code             VARCHAR2(50 CHAR)
        CONSTRAINT nn_project_code NOT NULL,

    project_name             VARCHAR2(200 CHAR)
        CONSTRAINT nn_project_name NOT NULL,

    description               VARCHAR2(1000 CHAR),

    start_date                DATE,

    end_date                  DATE,

    active_flag               CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_project_active_flag NOT NULL,

    created_at                TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_project_created_at NOT NULL,

    created_by                VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_project_created_by NOT NULL,

    updated_at                TIMESTAMP,

    updated_by                VARCHAR2(100 CHAR)
);

CREATE TABLE task (
    task_id                   NUMBER(19,0)
        CONSTRAINT pk_task PRIMARY KEY,

    project_id                NUMBER(19,0)
        CONSTRAINT nn_task_project NOT NULL,

    assigned_to_employee_id   NUMBER(19,0),

    status_id                 NUMBER(19,0)
        CONSTRAINT nn_task_status NOT NULL,

    priority_id                NUMBER(19,0)
        CONSTRAINT nn_task_priority NOT NULL,

    task_code                  VARCHAR2(50 CHAR)
        CONSTRAINT nn_task_code NOT NULL,

    task_name                  VARCHAR2(200 CHAR)
        CONSTRAINT nn_task_name NOT NULL,

    description                 VARCHAR2(1000 CHAR),

    due_date                    DATE,

    active_flag                 CHAR(1)
        DEFAULT 'Y'
        CONSTRAINT nn_task_active_flag NOT NULL,

    created_at                  TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_task_created_at NOT NULL,

    created_by                  VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_task_created_by NOT NULL,

    updated_at                  TIMESTAMP,

    updated_by                  VARCHAR2(100 CHAR)
);

-- AUDIT_LOG records INSERT/UPDATE/DELETE activity on key business
-- tables (see 06_triggers.sql for TRG_<TABLE>_AU). It intentionally
-- does NOT carry the standard audit columns (created_at/created_by/
-- updated_at/updated_by/active_flag) from the naming standard - a log
-- row is itself an audit record, is never updated or soft-deleted,
-- and changed_at/changed_by already capture who/when for the row.
CREATE TABLE audit_log (
    audit_log_id      NUMBER(19,0)
        CONSTRAINT pk_audit_log PRIMARY KEY,

    table_name         VARCHAR2(128 CHAR)
        CONSTRAINT nn_audit_log_table_name NOT NULL,

    record_id          NUMBER(19,0)
        CONSTRAINT nn_audit_log_record_id NOT NULL,

    action              VARCHAR2(10 CHAR)
        CONSTRAINT nn_audit_log_action NOT NULL,

    old_values           CLOB,

    new_values           CLOB,

    changed_at            TIMESTAMP
        DEFAULT SYSTIMESTAMP
        CONSTRAINT nn_audit_log_changed_at NOT NULL,

    changed_by            VARCHAR2(100 CHAR)
        DEFAULT USER
        CONSTRAINT nn_audit_log_changed_by NOT NULL
);
