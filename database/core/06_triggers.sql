-- ============================================================
-- EnterpriseFlow - Core Module
-- 06_triggers.sql
--
-- Naming convention: TRG_<TABLE>_BI (before insert) / _BU (before update)
--
-- BI trigger:  assigns the surrogate key from the table's sequence
--              when the caller doesn't supply one.
-- BU trigger:  maintains updated_at/updated_by automatically and
--              protects created_at/created_by from being overwritten
--              by an application update statement. Audit trails must
--              not depend on every caller remembering to set these.
-- ============================================================

CREATE OR REPLACE TRIGGER trg_organization_bi
BEFORE INSERT ON organization
FOR EACH ROW
BEGIN
    IF :NEW.organization_id IS NULL THEN
        :NEW.organization_id := seq_organization.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_organization_bu
BEFORE UPDATE ON organization
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

CREATE OR REPLACE TRIGGER trg_department_bi
BEFORE INSERT ON department
FOR EACH ROW
BEGIN
    IF :NEW.department_id IS NULL THEN
        :NEW.department_id := seq_department.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_department_bu
BEFORE UPDATE ON department
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

CREATE OR REPLACE TRIGGER trg_role_bi
BEFORE INSERT ON role
FOR EACH ROW
BEGIN
    IF :NEW.role_id IS NULL THEN
        :NEW.role_id := seq_role.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_role_bu
BEFORE UPDATE ON role
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

CREATE OR REPLACE TRIGGER trg_status_bi
BEFORE INSERT ON status
FOR EACH ROW
BEGIN
    IF :NEW.status_id IS NULL THEN
        :NEW.status_id := seq_status.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_status_bu
BEFORE UPDATE ON status
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

CREATE OR REPLACE TRIGGER trg_priority_bi
BEFORE INSERT ON priority
FOR EACH ROW
BEGIN
    IF :NEW.priority_id IS NULL THEN
        :NEW.priority_id := seq_priority.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_priority_bu
BEFORE UPDATE ON priority
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

CREATE OR REPLACE TRIGGER trg_client_bi
BEFORE INSERT ON client
FOR EACH ROW
BEGIN
    IF :NEW.client_id IS NULL THEN
        :NEW.client_id := seq_client.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_client_bu
BEFORE UPDATE ON client
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

CREATE OR REPLACE TRIGGER trg_location_bi
BEFORE INSERT ON location
FOR EACH ROW
BEGIN
    IF :NEW.location_id IS NULL THEN
        :NEW.location_id := seq_location.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_location_bu
BEFORE UPDATE ON location
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

CREATE OR REPLACE TRIGGER trg_employee_bi
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF :NEW.employee_id IS NULL THEN
        :NEW.employee_id := seq_employee.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_employee_bu
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

CREATE OR REPLACE TRIGGER trg_user_account_bi
BEFORE INSERT ON user_account
FOR EACH ROW
BEGIN
    IF :NEW.user_account_id IS NULL THEN
        :NEW.user_account_id := seq_user_account.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_user_account_bu
BEFORE UPDATE ON user_account
FOR EACH ROW
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;
END;
/

-- PROJECT.status_id must reference a STATUS row where entity_type =
-- 'PROJECT'. The FK constraint alone can't express that, so both the
-- BI and BU triggers validate it explicitly and raise a clear error
-- rather than let a mismatched status silently attach.
CREATE OR REPLACE TRIGGER trg_project_bi
BEFORE INSERT ON project
FOR EACH ROW
DECLARE
    v_entity_type status.entity_type%TYPE;
BEGIN
    IF :NEW.project_id IS NULL THEN
        :NEW.project_id := seq_project.NEXTVAL;
    END IF;

    SELECT entity_type INTO v_entity_type
    FROM status
    WHERE status_id = :NEW.status_id;

    IF v_entity_type != 'PROJECT' THEN
        RAISE_APPLICATION_ERROR(-20001,
            'PROJECT.status_id must reference a STATUS row with entity_type = ''PROJECT''.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'PROJECT.status_id does not reference an existing STATUS row.');
END;
/

CREATE OR REPLACE TRIGGER trg_project_bu
BEFORE UPDATE ON project
FOR EACH ROW
DECLARE
    v_entity_type status.entity_type%TYPE;
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;

    SELECT entity_type INTO v_entity_type
    FROM status
    WHERE status_id = :NEW.status_id;

    IF v_entity_type != 'PROJECT' THEN
        RAISE_APPLICATION_ERROR(-20001,
            'PROJECT.status_id must reference a STATUS row with entity_type = ''PROJECT''.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'PROJECT.status_id does not reference an existing STATUS row.');
END;
/

-- TASK.status_id must reference a STATUS row where entity_type =
-- 'TASK'. Same rationale as PROJECT above.
CREATE OR REPLACE TRIGGER trg_task_bi
BEFORE INSERT ON task
FOR EACH ROW
DECLARE
    v_entity_type status.entity_type%TYPE;
BEGIN
    IF :NEW.task_id IS NULL THEN
        :NEW.task_id := seq_task.NEXTVAL;
    END IF;

    SELECT entity_type INTO v_entity_type
    FROM status
    WHERE status_id = :NEW.status_id;

    IF v_entity_type != 'TASK' THEN
        RAISE_APPLICATION_ERROR(-20003,
            'TASK.status_id must reference a STATUS row with entity_type = ''TASK''.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20004, 'TASK.status_id does not reference an existing STATUS row.');
END;
/

CREATE OR REPLACE TRIGGER trg_task_bu
BEFORE UPDATE ON task
FOR EACH ROW
DECLARE
    v_entity_type status.entity_type%TYPE;
BEGIN
    :NEW.updated_at := SYSTIMESTAMP;
    :NEW.updated_by := USER;

    :NEW.created_at := :OLD.created_at;
    :NEW.created_by := :OLD.created_by;

    SELECT entity_type INTO v_entity_type
    FROM status
    WHERE status_id = :NEW.status_id;

    IF v_entity_type != 'TASK' THEN
        RAISE_APPLICATION_ERROR(-20003,
            'TASK.status_id must reference a STATUS row with entity_type = ''TASK''.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20004, 'TASK.status_id does not reference an existing STATUS row.');
END;
/
