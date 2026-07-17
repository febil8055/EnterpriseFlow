-- ============================================================
-- EnterpriseFlow - Core Module
-- 01_sequences.sql
--
-- Naming convention: SEQ_<TABLE_NAME>
-- Identity columns are intentionally NOT used. Sequences give us
-- control over caching/ordering and match Oracle enterprise
-- convention for surrogate keys populated via BEFORE INSERT triggers.
-- ============================================================

CREATE SEQUENCE seq_organization
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
