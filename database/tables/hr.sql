-- ============================================================
-- EnterpriseFlow
-- HR Module
-- ============================================================

-- Creation Order
-- 1. LEAVE_TYPE
-- 2. LEAVE_REQUEST
-- 3. SHIFT
-- 4. EMPLOYEE_SHIFT
-- 5. ATTENDANCE
-- 6. HOLIDAY
-- 7. TIMESHEET
-- 8. TIMESHEET_ENTRY

-- =====================================================================
-- LEAVE_TYPE
-- =====================================================================

CREATE TABLE leave_type (
    leave_type_id NUMBER CONSTRAINT pk_leave_type PRIMARY KEY,
    leave_code VARCHAR2(30) CONSTRAINT nn_leave_code NOT NULL,
    leave_name VARCHAR2(100) CONSTRAINT nn_leave_name NOT NULL,
    max_days NUMBER(5,2),
    status VARCHAR2(20) DEFAULT 'ACTIVE'
        CONSTRAINT ck_leave_type_status CHECK (status IN ('ACTIVE','INACTIVE')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR2(100) DEFAULT USER
);

ALTER TABLE leave_type
ADD CONSTRAINT uk_leave_type_code UNIQUE (leave_code);

CREATE SEQUENCE seq_leave_type START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_leave_type_bi
BEFORE INSERT ON leave_type
FOR EACH ROW
BEGIN
    IF :NEW.leave_type_id IS NULL THEN
        :NEW.leave_type_id := seq_leave_type.NEXTVAL;
    END IF;
END;
/

INSERT INTO leave_type
(leave_code, leave_name, max_days)
VALUES
('ANNUAL','Annual Leave',20);

INSERT INTO leave_type
(leave_code, leave_name, max_days)
VALUES
('SICK','Sick Leave',10);

COMMIT;

-- =====================================================================
-- Remaining HR tables
-- =====================================================================
-- LEAVE_REQUEST
-- SHIFT
-- EMPLOYEE_SHIFT
-- ATTENDANCE
-- HOLIDAY
-- TIMESHEET
-- TIMESHEET_ENTRY
--
-- Continue building these using the same standards:
-- PK, FK, UK, CK, NN constraints
-- Sequence
-- Before Insert Trigger
-- Sample Data
