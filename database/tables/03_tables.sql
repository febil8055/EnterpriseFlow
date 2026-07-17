CREATE TABLE organization (
    organization_id      NUMBER
        CONSTRAINT pk_organization PRIMARY KEY,

    organization_name    VARCHAR2(200)
        CONSTRAINT nn_organization_name NOT NULL,

    organization_code    VARCHAR2(50)
        CONSTRAINT nn_organization_code NOT NULL,

    email                VARCHAR2(255),

    phone                VARCHAR2(30),

    status               VARCHAR2(20)
        DEFAULT 'ACTIVE'
        CONSTRAINT nn_organization_status NOT NULL
        CONSTRAINT ck_organization_status
            CHECK (status IN ('ACTIVE', 'INACTIVE')),

    created_at           TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
        CONSTRAINT nn_organization_created_at NOT NULL,

    created_by           VARCHAR2(100)
        DEFAULT USER
        CONSTRAINT nn_organization_created_by NOT NULL,

    updated_at           TIMESTAMP,

    updated_by           VARCHAR2(100)
);

ALTER TABLE organization
ADD CONSTRAINT uk_organization_code
UNIQUE (organization_code);