-- ============================================================
-- EnterpriseFlow - Core Module
-- 04_indexes.sql
--
-- Only indexes NOT already created implicitly by a PRIMARY KEY or
-- UNIQUE constraint belong here. Oracle auto-creates a unique index
-- for both, so ORGANIZATION needs nothing extra yet: organization_id
-- (PK) and organization_code (UK) are already indexed.
--
-- Rule of thumb applied from here on: every FOREIGN KEY column gets
-- an explicit index, because - unlike PK/UK - Oracle does NOT create
-- one automatically, and an un-indexed FK column causes full table
-- locks on the parent during child deletes/updates.
-- ============================================================

-- DEPARTMENT.organization_id (FK -> organization)
CREATE INDEX ix_department_organization
    ON department (organization_id);

-- ROLE.department_id (FK -> department)
CREATE INDEX ix_role_department
    ON role (department_id);
