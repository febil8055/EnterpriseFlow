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
