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
