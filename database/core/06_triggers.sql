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

-- ============================================================
-- Audit triggers (BR-009: every important action must be recorded
-- in the audit log)
--
-- Naming convention: TRG_<TABLE>_AU (after, for audit)
--
-- AU trigger: fires AFTER INSERT/UPDATE/DELETE, writes one AUDIT_LOG
--             row per change with a JSON snapshot of the business
--             columns (not the audit columns themselves - those are
--             redundant with CHANGED_AT/CHANGED_BY). Runs in the same
--             transaction as the change, deliberately not autonomous,
--             so a rolled-back change never leaves a phantom log row.
-- ============================================================

CREATE OR REPLACE TRIGGER trg_organization_au
AFTER INSERT OR UPDATE OR DELETE ON organization
FOR EACH ROW
DECLARE
    v_action     VARCHAR2(10);
    v_record_id  NUMBER(19,0);
    v_old_values CLOB;
    v_new_values CLOB;
BEGIN
    IF INSERTING THEN
        v_action     := 'INSERT';
        v_record_id  := :NEW.organization_id;
        v_new_values := JSON_OBJECT(
            'organization_name' VALUE :NEW.organization_name,
            'organization_code' VALUE :NEW.organization_code,
            'email'             VALUE :NEW.email,
            'phone'             VALUE :NEW.phone,
            'active_flag'       VALUE :NEW.active_flag
        );
    ELSIF UPDATING THEN
        v_action     := 'UPDATE';
        v_record_id  := :NEW.organization_id;
        v_old_values := JSON_OBJECT(
            'organization_name' VALUE :OLD.organization_name,
            'organization_code' VALUE :OLD.organization_code,
            'email'             VALUE :OLD.email,
            'phone'             VALUE :OLD.phone,
            'active_flag'       VALUE :OLD.active_flag
        );
        v_new_values := JSON_OBJECT(
            'organization_name' VALUE :NEW.organization_name,
            'organization_code' VALUE :NEW.organization_code,
            'email'             VALUE :NEW.email,
            'phone'             VALUE :NEW.phone,
            'active_flag'       VALUE :NEW.active_flag
        );
    ELSE
        v_action     := 'DELETE';
        v_record_id  := :OLD.organization_id;
        v_old_values := JSON_OBJECT(
            'organization_name' VALUE :OLD.organization_name,
            'organization_code' VALUE :OLD.organization_code,
            'email'             VALUE :OLD.email,
            'phone'             VALUE :OLD.phone,
            'active_flag'       VALUE :OLD.active_flag
        );
    END IF;

    INSERT INTO audit_log (
        audit_log_id, table_name, record_id, action,
        old_values, new_values, changed_at, changed_by
    ) VALUES (
        seq_audit_log.NEXTVAL, 'ORGANIZATION', v_record_id, v_action,
        v_old_values, v_new_values, SYSTIMESTAMP,
        NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER)
    );
END;
/

CREATE OR REPLACE TRIGGER trg_department_au
AFTER INSERT OR UPDATE OR DELETE ON department
FOR EACH ROW
DECLARE
    v_action     VARCHAR2(10);
    v_record_id  NUMBER(19,0);
    v_old_values CLOB;
    v_new_values CLOB;
BEGIN
    IF INSERTING THEN
        v_action     := 'INSERT';
        v_record_id  := :NEW.department_id;
        v_new_values := JSON_OBJECT(
            'department_name' VALUE :NEW.department_name,
            'department_code' VALUE :NEW.department_code,
            'organization_id' VALUE :NEW.organization_id,
            'active_flag'     VALUE :NEW.active_flag
        );
    ELSIF UPDATING THEN
        v_action     := 'UPDATE';
        v_record_id  := :NEW.department_id;
        v_old_values := JSON_OBJECT(
            'department_name' VALUE :OLD.department_name,
            'department_code' VALUE :OLD.department_code,
            'organization_id' VALUE :OLD.organization_id,
            'active_flag'     VALUE :OLD.active_flag
        );
        v_new_values := JSON_OBJECT(
            'department_name' VALUE :NEW.department_name,
            'department_code' VALUE :NEW.department_code,
            'organization_id' VALUE :NEW.organization_id,
            'active_flag'     VALUE :NEW.active_flag
        );
    ELSE
        v_action     := 'DELETE';
        v_record_id  := :OLD.department_id;
        v_old_values := JSON_OBJECT(
            'department_name' VALUE :OLD.department_name,
            'department_code' VALUE :OLD.department_code,
            'organization_id' VALUE :OLD.organization_id,
            'active_flag'     VALUE :OLD.active_flag
        );
    END IF;

    INSERT INTO audit_log (
        audit_log_id, table_name, record_id, action,
        old_values, new_values, changed_at, changed_by
    ) VALUES (
        seq_audit_log.NEXTVAL, 'DEPARTMENT', v_record_id, v_action,
        v_old_values, v_new_values, SYSTIMESTAMP,
        NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER)
    );
END;
/

CREATE OR REPLACE TRIGGER trg_employee_au
AFTER INSERT OR UPDATE OR DELETE ON employee
FOR EACH ROW
DECLARE
    v_action     VARCHAR2(10);
    v_record_id  NUMBER(19,0);
    v_old_values CLOB;
    v_new_values CLOB;
BEGIN
    IF INSERTING THEN
        v_action     := 'INSERT';
        v_record_id  := :NEW.employee_id;
        v_new_values := JSON_OBJECT(
            'first_name'    VALUE :NEW.first_name,
            'last_name'     VALUE :NEW.last_name,
            'email'         VALUE :NEW.email,
            'department_id' VALUE :NEW.department_id,
            'role_id'       VALUE :NEW.role_id,
            'active_flag'   VALUE :NEW.active_flag
        );
    ELSIF UPDATING THEN
        v_action     := 'UPDATE';
        v_record_id  := :NEW.employee_id;
        v_old_values := JSON_OBJECT(
            'first_name'    VALUE :OLD.first_name,
            'last_name'     VALUE :OLD.last_name,
            'email'         VALUE :OLD.email,
            'department_id' VALUE :OLD.department_id,
            'role_id'       VALUE :OLD.role_id,
            'active_flag'   VALUE :OLD.active_flag
        );
        v_new_values := JSON_OBJECT(
            'first_name'    VALUE :NEW.first_name,
            'last_name'     VALUE :NEW.last_name,
            'email'         VALUE :NEW.email,
            'department_id' VALUE :NEW.department_id,
            'role_id'       VALUE :NEW.role_id,
            'active_flag'   VALUE :NEW.active_flag
        );
    ELSE
        v_action     := 'DELETE';
        v_record_id  := :OLD.employee_id;
        v_old_values := JSON_OBJECT(
            'first_name'    VALUE :OLD.first_name,
            'last_name'     VALUE :OLD.last_name,
            'email'         VALUE :OLD.email,
            'department_id' VALUE :OLD.department_id,
            'role_id'       VALUE :OLD.role_id,
            'active_flag'   VALUE :OLD.active_flag
        );
    END IF;

    INSERT INTO audit_log (
        audit_log_id, table_name, record_id, action,
        old_values, new_values, changed_at, changed_by
    ) VALUES (
        seq_audit_log.NEXTVAL, 'EMPLOYEE', v_record_id, v_action,
        v_old_values, v_new_values, SYSTIMESTAMP,
        NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER)
    );
END;
/

CREATE OR REPLACE TRIGGER trg_project_au
AFTER INSERT OR UPDATE OR DELETE ON project
FOR EACH ROW
DECLARE
    v_action     VARCHAR2(10);
    v_record_id  NUMBER(19,0);
    v_old_values CLOB;
    v_new_values CLOB;
BEGIN
    IF INSERTING THEN
        v_action     := 'INSERT';
        v_record_id  := :NEW.project_id;
        v_new_values := JSON_OBJECT(
            'project_name'    VALUE :NEW.project_name,
            'project_code'    VALUE :NEW.project_code,
            'organization_id' VALUE :NEW.organization_id,
            'client_id'       VALUE :NEW.client_id,
            'status_id'       VALUE :NEW.status_id,
            'start_date'      VALUE :NEW.start_date,
            'end_date'        VALUE :NEW.end_date,
            'active_flag'     VALUE :NEW.active_flag
        );
    ELSIF UPDATING THEN
        v_action     := 'UPDATE';
        v_record_id  := :NEW.project_id;
        v_old_values := JSON_OBJECT(
            'project_name'    VALUE :OLD.project_name,
            'project_code'    VALUE :OLD.project_code,
            'organization_id' VALUE :OLD.organization_id,
            'client_id'       VALUE :OLD.client_id,
            'status_id'       VALUE :OLD.status_id,
            'start_date'      VALUE :OLD.start_date,
            'end_date'        VALUE :OLD.end_date,
            'active_flag'     VALUE :OLD.active_flag
        );
        v_new_values := JSON_OBJECT(
            'project_name'    VALUE :NEW.project_name,
            'project_code'    VALUE :NEW.project_code,
            'organization_id' VALUE :NEW.organization_id,
            'client_id'       VALUE :NEW.client_id,
            'status_id'       VALUE :NEW.status_id,
            'start_date'      VALUE :NEW.start_date,
            'end_date'        VALUE :NEW.end_date,
            'active_flag'     VALUE :NEW.active_flag
        );
    ELSE
        v_action     := 'DELETE';
        v_record_id  := :OLD.project_id;
        v_old_values := JSON_OBJECT(
            'project_name'    VALUE :OLD.project_name,
            'project_code'    VALUE :OLD.project_code,
            'organization_id' VALUE :OLD.organization_id,
            'client_id'       VALUE :OLD.client_id,
            'status_id'       VALUE :OLD.status_id,
            'start_date'      VALUE :OLD.start_date,
            'end_date'        VALUE :OLD.end_date,
            'active_flag'     VALUE :OLD.active_flag
        );
    END IF;

    INSERT INTO audit_log (
        audit_log_id, table_name, record_id, action,
        old_values, new_values, changed_at, changed_by
    ) VALUES (
        seq_audit_log.NEXTVAL, 'PROJECT', v_record_id, v_action,
        v_old_values, v_new_values, SYSTIMESTAMP,
        NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER)
    );
END;
/

CREATE OR REPLACE TRIGGER trg_task_au
AFTER INSERT OR UPDATE OR DELETE ON task
FOR EACH ROW
DECLARE
    v_action     VARCHAR2(10);
    v_record_id  NUMBER(19,0);
    v_old_values CLOB;
    v_new_values CLOB;
BEGIN
    IF INSERTING THEN
        v_action     := 'INSERT';
        v_record_id  := :NEW.task_id;
        v_new_values := JSON_OBJECT(
            'task_name'               VALUE :NEW.task_name,
            'task_code'               VALUE :NEW.task_code,
            'project_id'              VALUE :NEW.project_id,
            'assigned_to_employee_id' VALUE :NEW.assigned_to_employee_id,
            'status_id'               VALUE :NEW.status_id,
            'priority_id'             VALUE :NEW.priority_id,
            'due_date'                VALUE :NEW.due_date,
            'active_flag'             VALUE :NEW.active_flag
        );
    ELSIF UPDATING THEN
        v_action     := 'UPDATE';
        v_record_id  := :NEW.task_id;
        v_old_values := JSON_OBJECT(
            'task_name'               VALUE :OLD.task_name,
            'task_code'               VALUE :OLD.task_code,
            'project_id'              VALUE :OLD.project_id,
            'assigned_to_employee_id' VALUE :OLD.assigned_to_employee_id,
            'status_id'               VALUE :OLD.status_id,
            'priority_id'             VALUE :OLD.priority_id,
            'due_date'                VALUE :OLD.due_date,
            'active_flag'             VALUE :OLD.active_flag
        );
        v_new_values := JSON_OBJECT(
            'task_name'               VALUE :NEW.task_name,
            'task_code'               VALUE :NEW.task_code,
            'project_id'              VALUE :NEW.project_id,
            'assigned_to_employee_id' VALUE :NEW.assigned_to_employee_id,
            'status_id'               VALUE :NEW.status_id,
            'priority_id'             VALUE :NEW.priority_id,
            'due_date'                VALUE :NEW.due_date,
            'active_flag'             VALUE :NEW.active_flag
        );
    ELSE
        v_action     := 'DELETE';
        v_record_id  := :OLD.task_id;
        v_old_values := JSON_OBJECT(
            'task_name'               VALUE :OLD.task_name,
            'task_code'               VALUE :OLD.task_code,
            'project_id'              VALUE :OLD.project_id,
            'assigned_to_employee_id' VALUE :OLD.assigned_to_employee_id,
            'status_id'               VALUE :OLD.status_id,
            'priority_id'             VALUE :OLD.priority_id,
            'due_date'                VALUE :OLD.due_date,
            'active_flag'             VALUE :OLD.active_flag
        );
    END IF;

    INSERT INTO audit_log (
        audit_log_id, table_name, record_id, action,
        old_values, new_values, changed_at, changed_by
    ) VALUES (
        seq_audit_log.NEXTVAL, 'TASK', v_record_id, v_action,
        v_old_values, v_new_values, SYSTIMESTAMP,
        NVL(SYS_CONTEXT('APEX$SESSION', 'APP_USER'), USER)
    );
END;
/
