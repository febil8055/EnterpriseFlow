-- ============================================================
-- EnterpriseFlow - Core Module
-- 03_constraints.sql
--
-- Unique keys, check constraints, and foreign keys, added after
-- table creation so relationships can reference tables regardless
-- of the order they were created in.
--
-- Naming convention:
--   UK_<TABLE>_<COLUMN>       unique key
--   CK_<TABLE>_<COLUMN>       check constraint
--   FK_<TABLE>_<REF_TABLE>    foreign key
-- ============================================================

-- ORGANIZATION -------------------------------------------------

ALTER TABLE organization
ADD CONSTRAINT uk_organization_code
UNIQUE (organization_code);

-- Codes are system identifiers used in URLs/APIs, not free text -
-- enforce a predictable, uppercase, no-whitespace format.
ALTER TABLE organization
ADD CONSTRAINT ck_organization_code
CHECK (REGEXP_LIKE(organization_code, '^[A-Z0-9_]+$'));

ALTER TABLE organization
ADD CONSTRAINT ck_organization_active_flag
CHECK (active_flag IN ('Y', 'N'));
