CREATE OR REPLACE TRIGGER trg_department_bi
BEFORE INSERT ON department
FOR EACH ROW
BEGIN
    IF :NEW.department_id IS NULL THEN
        :NEW.department_id := seq_department.NEXTVAL;
    END IF;
END;
/