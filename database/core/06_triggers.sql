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
