-- ============================================================
-- EnterpriseFlow - Assets Module
-- ============================================================

CREATE TABLE asset_category (
    asset_category_id NUMBER CONSTRAINT pk_asset_category PRIMARY KEY,
    category_code VARCHAR2(30) CONSTRAINT nn_asset_cat_code NOT NULL,
    category_name VARCHAR2(100) CONSTRAINT nn_asset_cat_name NOT NULL,
    status VARCHAR2(20) DEFAULT 'ACTIVE'
        CONSTRAINT ck_asset_cat_status CHECK (status IN ('ACTIVE','INACTIVE')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR2(100) DEFAULT USER
);

ALTER TABLE asset_category
ADD CONSTRAINT uk_asset_category_code UNIQUE(category_code);

CREATE SEQUENCE seq_asset_category START WITH 1 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE TRIGGER trg_asset_category_bi
BEFORE INSERT ON asset_category
FOR EACH ROW
BEGIN
  IF :NEW.asset_category_id IS NULL THEN
    :NEW.asset_category_id:=seq_asset_category.NEXTVAL;
  END IF;
END;
/

INSERT INTO asset_category(category_code,category_name)
VALUES('LAPTOP','Laptop');

INSERT INTO asset_category(category_code,category_name)
VALUES('MONITOR','Monitor');

COMMIT;

-- Remaining tables:
-- ASSET
-- ASSET_ASSIGNMENT
-- ASSET_MAINTENANCE
