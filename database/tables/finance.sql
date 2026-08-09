-- ============================================================
-- EnterpriseFlow
-- Finance Module
-- ============================================================

-- Tables
-- 1. EXPENSE_CATEGORY
-- 2. EXPENSE
-- 3. INVOICE
-- 4. INVOICE_ITEM
-- 5. PAYMENT

CREATE TABLE expense_category (
    expense_category_id NUMBER CONSTRAINT pk_expense_category PRIMARY KEY,
    category_code VARCHAR2(30) CONSTRAINT nn_exp_cat_code NOT NULL,
    category_name VARCHAR2(100) CONSTRAINT nn_exp_cat_name NOT NULL,
    status VARCHAR2(20) DEFAULT 'ACTIVE'
        CONSTRAINT ck_exp_cat_status CHECK (status IN ('ACTIVE','INACTIVE')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR2(100) DEFAULT USER
);

ALTER TABLE expense_category
ADD CONSTRAINT uk_expense_category_code UNIQUE(category_code);

CREATE SEQUENCE seq_expense_category
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE TRIGGER trg_expense_category_bi
BEFORE INSERT ON expense_category
FOR EACH ROW
BEGIN
    IF :NEW.expense_category_id IS NULL THEN
        :NEW.expense_category_id := seq_expense_category.NEXTVAL;
    END IF;
END;
/

INSERT INTO expense_category
(category_code, category_name)
VALUES
('TRAVEL','Travel');

INSERT INTO expense_category
(category_code, category_name)
VALUES
('SOFTWARE','Software');

COMMIT;

-- ============================================================
-- Remaining Finance Tables
-- ============================================================
-- EXPENSE
-- INVOICE
-- INVOICE_ITEM
-- PAYMENT
--
-- Use the same enterprise standards:
-- PK, FK, UK, CK, NN constraints
-- Sequence
-- Trigger
-- Sample data
