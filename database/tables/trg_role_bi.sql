CREATE OR REPLACE TRIGGER trg_role_bi
BEFORE INSERT ON role
FOR EACH ROW
BEGIN
    IF :NEW.role_id IS NULL THEN
        :NEW.role_id := seq_role.NEXTVAL;
    END IF;
END;
/