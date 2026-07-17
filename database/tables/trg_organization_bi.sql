CREATE OR REPLACE TRIGGER trg_organization_bi
BEFORE INSERT ON organization 
FOR EACH ROW
BEGIN
    IF :NEW.organization_id IS NULL THEN
         :NEW.organization_id := seq_organization.NEXTVAL;
    END IF;
END;
/