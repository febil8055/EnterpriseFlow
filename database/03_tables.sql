-- =====================================================
-- EnterpriseFlow
-- File: 03_tables.sql
-- Purpose: Create application tables
-- Author: Feb
-- =====================================================

CREATE TABLE organization (
    organization_id      NUMBER PRIMARY KEY,
    organization_name    VARCHAR2(200) NOT NULL,
    organization_code    VARCHAR2(50) NOT NULL,
    email                VARCHAR2(255),
    phone                VARCHAR2(30),
    status               VARCHAR2(20) DEFAULT 'ACTIVE' NOT NULL,
    created_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at           TIMESTAMP
);