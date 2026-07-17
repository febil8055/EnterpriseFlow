CREATE TABLE department (
    department_id        NUMBER
        CONSTRAINT pk_department PRIMARY KEY,

    organization_id      NUMBER
        CONSTRAINT nn_department_organization NOT NULL,

    department_name      VARCHAR2(200)
        CONSTRAINT nn_department_name NOT NULL,

    department_code      VARCHAR2(50)
        CONSTRAINT nn_department_code NOT NULL,

    status               VARCHAR2(20)
        DEFAULT 'ACTIVE'
        CONSTRAINT nn_department_status NOT NULL
        CONSTRAINT ck_department_status
            CHECK (status IN ('ACTIVE', 'INACTIVE')),

    created_at           TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        CONSTRAINT nn_department_created_at NOT NULL,

    created_by           VARCHAR2(100)
        DEFAULT USER
        CONSTRAINT nn_department_created_by NOT NULL,

    updated_at           TIMESTAMP,

    updated_by           VARCHAR2(100)
);

ALTER TABLE department
ADD CONSTRAINT uk_department_code
UNIQUE (department_code);

ALTER TABLE department
ADD CONSTRAINT fk_department_organization
FOREIGN KEY (organization_id)
REFERENCES organization (organization_id);