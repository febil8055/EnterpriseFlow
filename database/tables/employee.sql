CREATE TABLE employee (
    employee_id          NUMBER
        CONSTRAINT pk_employee PRIMARY KEY,

    organization_id      NUMBER
        CONSTRAINT nn_employee_organization NOT NULL,

    department_id        NUMBER
        CONSTRAINT nn_employee_department NOT NULL,

    role_id              NUMBER
        CONSTRAINT nn_employee_role NOT NULL,

    employee_code        VARCHAR2(50)
        CONSTRAINT nn_employee_code NOT NULL,

    first_name           VARCHAR2(100)
        CONSTRAINT nn_employee_first_name NOT NULL,

    last_name            VARCHAR2(100)
        CONSTRAINT nn_employee_last_name NOT NULL,

    email                VARCHAR2(255)
        CONSTRAINT nn_employee_email NOT NULL,

    phone                VARCHAR2(30),

    hire_date            DATE
        DEFAULT SYSDATE
        CONSTRAINT nn_employee_hire_date NOT NULL,

    status               VARCHAR2(20)
        DEFAULT 'ACTIVE'
        CONSTRAINT nn_employee_status NOT NULL
        CONSTRAINT ck_employee_status
            CHECK (status IN ('ACTIVE', 'INACTIVE')),

    created_at           TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        CONSTRAINT nn_employee_created_at NOT NULL,

    created_by           VARCHAR2(100)
        DEFAULT USER
        CONSTRAINT nn_employee_created_by NOT NULL,

    updated_at           TIMESTAMP,

    updated_by           VARCHAR2(100)
);

ALTER TABLE employee
ADD CONSTRAINT uk_employee_code
UNIQUE (employee_code);

ALTER TABLE employee
ADD CONSTRAINT uk_employee_email
UNIQUE (email);

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