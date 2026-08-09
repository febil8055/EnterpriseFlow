-- ============================================================
-- EnterpriseFlow - Security Module
-- ============================================================

CREATE TABLE permission (
    permission_id NUMBER CONSTRAINT pk_permission PRIMARY KEY,
    permission_code VARCHAR2(50) CONSTRAINT nn_permission_code NOT NULL,
    permission_name VARCHAR2(200) CONSTRAINT nn_permission_name NOT NULL,
    module_name VARCHAR2(100),
    status VARCHAR2(20) DEFAULT 'ACTIVE'
        CONSTRAINT ck_permission_status CHECK(status IN ('ACTIVE','INACTIVE')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR2(100) DEFAULT USER
);

ALTER TABLE permission
ADD CONSTRAINT uk_permission_code UNIQUE(permission_code);

CREATE SEQUENCE seq_permission START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_permission_bi
BEFORE INSERT ON permission
FOR EACH ROW
BEGIN
  IF :NEW.permission_id IS NULL THEN
    :NEW.permission_id:=seq_permission.NEXTVAL;
  END IF;
END;
/

INSERT INTO permission(permission_code,permission_name,module_name)
VALUES('PROJECT_VIEW','View Projects','PROJECT');

COMMIT;

-- Remaining tables:
-- ROLE_PERMISSION
-- USER_SESSION
-- LOGIN_HISTORY
-- AUDIT_LOG
