-- ============================================================
-- EnterpriseFlow
-- CRM Module
-- ============================================================

-- Tables
-- 1. CLIENT
-- 2. CLIENT_CONTACT
-- 3. CLIENT_ADDRESS
-- 4. CONTRACT

CREATE TABLE client (
    client_id NUMBER CONSTRAINT pk_client PRIMARY KEY,
    client_code VARCHAR2(30) CONSTRAINT nn_client_code NOT NULL,
    client_name VARCHAR2(200) CONSTRAINT nn_client_name NOT NULL,
    email VARCHAR2(200),
    phone VARCHAR2(30),
    status VARCHAR2(20) DEFAULT 'ACTIVE'
        CONSTRAINT ck_client_status CHECK (status IN ('ACTIVE','INACTIVE')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR2(100) DEFAULT USER
);

ALTER TABLE client
ADD CONSTRAINT uk_client_code UNIQUE(client_code);

CREATE SEQUENCE seq_client
START WITH 1
INCREMENT BY 1
NOCACHE;

CREATE OR REPLACE TRIGGER trg_client_bi
BEFORE INSERT ON client
FOR EACH ROW
BEGIN
    IF :NEW.client_id IS NULL THEN
        :NEW.client_id := seq_client.NEXTVAL;
    END IF;
END;
/

INSERT INTO client
(client_code, client_name, email, phone)
VALUES
('CLI001',
 'OpenAI',
 'contact@example.com',
 '+1-555-123-4567');

COMMIT;

-- ============================================================
-- Remaining tables
-- ============================================================
-- CLIENT_CONTACT
-- CLIENT_ADDRESS
-- CONTRACT
--
-- Implement using the same enterprise pattern:
-- PK, FK, UK, CK, NN constraints
-- Sequence
-- Trigger
-- Sample data
