CREATE TABLE role (
    role_id              NUMBER
        CONSTRAINT pk_role PRIMARY KEY,

    department_id        NUMBER
        CONSTRAINT nn_role_department NOT NULL,

    role_name            VARCHAR2(100)
        CONSTRAINT nn_role_name NOT NULL,

    role_code            VARCHAR2(50)
        CONSTRAINT nn_role_code NOT NULL,

    description          VARCHAR2(500),

    status               VARCHAR2(20)
        DEFAULT 'ACTIVE'
        CONSTRAINT nn_role_status NOT NULL
        CONSTRAINT ck_role_status
            CHECK (status IN ('ACTIVE', 'INACTIVE')),

    created_at           TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        CONSTRAINT nn_role_created_at NOT NULL,

    created_by           VARCHAR2(100)
        DEFAULT USER
        CONSTRAINT nn_role_created_by NOT NULL,

    updated_at           TIMESTAMP,

    updated_by           VARCHAR2(100)
);

ALTER TABLE role
ADD CONSTRAINT uk_role_code
UNIQUE (role_code);

ALTER TABLE role
ADD CONSTRAINT fk_role_department
FOREIGN KEY (department_id)
REFERENCES department (department_id);