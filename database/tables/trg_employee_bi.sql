CREATE OR REPLACE TRIGGER trg_employee_bi 
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF :NEW.employee_id IS NULL THEN
     :NEW.employee_id := seq_employee.NEXTVAL;
    END IF;
END;