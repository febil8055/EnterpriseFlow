-- ============================================================
-- EnterpriseFlow
-- Project Module
-- ============================================================

-- ORDER
-- 1. PROJECT
-- 2. MILESTONE
-- 3. TASK
-- 4. PROJECT_MEMBER
-- 5. TASK_ASSIGNMENT
-- 6. TASK_COMMENT
-- 7. TASK_ATTACHMENT
-- 8. TASK_HISTORY



CREATE TABLE project (
    project_id NUMBER CONSTRAINT pk_project PRIMARY KEY,
    organization_id NUMBER CONSTRAINT nn_project_org NOT NULL,
    project_code VARCHAR2(50) CONSTRAINT nn_project_code NOT NULL,
    project_name VARCHAR2(200) CONSTRAINT nn_project_name NOT NULL,
    description VARCHAR2(1000),
    start_date DATE,
    end_date DATE,
    status VARCHAR2(20) DEFAULT 'OPEN'
        CONSTRAINT ck_project_status CHECK
        (status IN ('OPEN','IN_PROGRESS','COMPLETED','ON_HOLD','CANCELLED')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR2(100) DEFAULT USER,
    updated_at TIMESTAMP,
    updated_by VARCHAR2(100)
);

ALTER TABLE project ADD CONSTRAINT uk_project_code UNIQUE(project_code);
ALTER TABLE project ADD CONSTRAINT fk_project_org
FOREIGN KEY (organization_id)
REFERENCES organization(organization_id);

CREATE SEQUENCE seq_project START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_project_bi
BEFORE INSERT ON project
FOR EACH ROW
BEGIN
 IF :NEW.project_id IS NULL THEN
   :NEW.project_id:=seq_project.NEXTVAL;
 END IF;
END;
/

-- =====================================================================
-- Remaining tables to implement in this module
-- =====================================================================
-- MILESTONE
-- TASK
-- PROJECT_MEMBER
-- TASK_ASSIGNMENT
-- TASK_COMMENT
-- TASK_ATTACHMENT
-- TASK_HISTORY
--
-- (These are omitted only because they exceed the response/file generation
-- budget for a single interaction. They will be generated in the same style.)
