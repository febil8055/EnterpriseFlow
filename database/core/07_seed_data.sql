-- ============================================================
-- EnterpriseFlow - Core Module
-- 07_seed_data.sql
--
-- STATUS and PRIORITY are lookup tables and get their fixed value
-- sets seeded below.
--
-- ORGANIZATION, DEPARTMENT, ROLE, CLIENT, LOCATION, EMPLOYEE,
-- USER_ACCOUNT, PROJECT, and TASK hold real tenant data in production,
-- but are seeded here with sample/demo rows so the schema has data to
-- build and test the APEX front end against. All FK links below are
-- resolved by unique business code (organization_code, department_code,
-- etc.) rather than hardcoded IDs, so this script doesn't depend on
-- assumed sequence values. Remove or replace this demo data before any
-- production load.
-- ============================================================

-- STATUS: PROJECT lifecycle -------------------------------------

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'OPEN', 'Open', 10);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'IN_PROGRESS', 'In Progress', 20);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'ON_HOLD', 'On Hold', 30);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'COMPLETED', 'Completed', 40);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('PROJECT', 'CANCELLED', 'Cancelled', 50);

-- STATUS: TASK lifecycle -----------------------------------------

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'TODO', 'To Do', 10);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'IN_PROGRESS', 'In Progress', 20);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'IN_REVIEW', 'In Review', 30);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'BLOCKED', 'Blocked', 40);

INSERT INTO status (entity_type, status_code, status_name, sort_order)
VALUES ('TASK', 'DONE', 'Done', 50);

-- PRIORITY (shared) -----------------------------------------------

INSERT INTO priority (priority_code, priority_name, sort_order)
VALUES ('LOW', 'Low', 10);

INSERT INTO priority (priority_code, priority_name, sort_order)
VALUES ('MEDIUM', 'Medium', 20);

INSERT INTO priority (priority_code, priority_name, sort_order)
VALUES ('HIGH', 'High', 30);

INSERT INTO priority (priority_code, priority_name, sort_order)
VALUES ('CRITICAL', 'Critical', 40);

-- ORGANIZATION (tenant root) --------------------------------------

INSERT INTO organization (organization_name, organization_code, email, phone)
VALUES ('Acme Corporation', 'ORG_ACME', 'contact@acme-demo.com', '+1-212-555-0100');

INSERT INTO organization (organization_name, organization_code, email, phone)
VALUES ('Globex Industries', 'ORG_GLOBEX', 'contact@globex-demo.com', '+1-312-555-0200');

-- DEPARTMENT --------------------------------------------------------

INSERT INTO department (organization_id, department_name, department_code)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'Engineering', 'DEPT_ENG');

INSERT INTO department (organization_id, department_name, department_code)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'Sales', 'DEPT_SALES');

INSERT INTO department (organization_id, department_name, department_code)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'Operations', 'DEPT_OPS');

INSERT INTO department (organization_id, department_name, department_code)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'Finance', 'DEPT_FIN');

-- ROLE ----------------------------------------------------------------

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPT_ENG'),
        'Software Developer', 'ROLE_DEV', 'Builds and maintains application code');

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPT_ENG'),
        'QA Engineer', 'ROLE_QA', 'Tests and verifies application quality');

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPT_SALES'),
        'Sales Representative', 'ROLE_SALESREP', 'Manages client relationships and deals');

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPT_OPS'),
        'Operations Manager', 'ROLE_OPSMGR', 'Oversees day-to-day operations');

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPT_FIN'),
        'Accountant', 'ROLE_ACCT', 'Handles financial records and reporting');

-- CLIENT ----------------------------------------------------------------

INSERT INTO client (organization_id, client_code, client_name, email, phone)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'CLIENT_NORTHWIND', 'Northwind Traders', 'ap@northwind-demo.com', '+1-212-555-0301');

INSERT INTO client (organization_id, client_code, client_name, email, phone)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'CLIENT_CONTOSO', 'Contoso Ltd', 'ap@contoso-demo.com', '+1-212-555-0302');

INSERT INTO client (organization_id, client_code, client_name, email, phone)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'CLIENT_INITECH', 'Initech LLC', 'ap@initech-demo.com', '+1-312-555-0303');

-- LOCATION ----------------------------------------------------------------

INSERT INTO location (organization_id, location_code, location_name, address_line1, city, state_province, postal_code, country)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'LOC_NYC', 'New York HQ', '350 5th Ave', 'New York', 'NY', '10118', 'USA');

INSERT INTO location (organization_id, location_code, location_name, address_line1, city, state_province, postal_code, country)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'LOC_SF', 'San Francisco Office', '1 Market St', 'San Francisco', 'CA', '94105', 'USA');

INSERT INTO location (organization_id, location_code, location_name, address_line1, city, state_province, postal_code, country)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'LOC_CHI', 'Chicago HQ', '233 S Wacker Dr', 'Chicago', 'IL', '60606', 'USA');

-- EMPLOYEE ----------------------------------------------------------------

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT department_id FROM department WHERE department_code = 'DEPT_ENG'),
        (SELECT role_id FROM role WHERE role_code = 'ROLE_DEV'),
        'EMP_JSMITH', 'John', 'Smith', 'john.smith@acme-demo.com', '+1-212-555-0401', DATE '2022-03-14');

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT department_id FROM department WHERE department_code = 'DEPT_ENG'),
        (SELECT role_id FROM role WHERE role_code = 'ROLE_QA'),
        'EMP_PNAIR', 'Priya', 'Nair', 'priya.nair@acme-demo.com', '+1-212-555-0402', DATE '2022-07-01');

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT department_id FROM department WHERE department_code = 'DEPT_SALES'),
        (SELECT role_id FROM role WHERE role_code = 'ROLE_SALESREP'),
        'EMP_MLEE', 'Mark', 'Lee', 'mark.lee@acme-demo.com', '+1-212-555-0403', DATE '2021-11-20');

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        (SELECT department_id FROM department WHERE department_code = 'DEPT_OPS'),
        (SELECT role_id FROM role WHERE role_code = 'ROLE_OPSMGR'),
        'EMP_SCONNOR', 'Sara', 'Connor', 'sara.connor@globex-demo.com', '+1-312-555-0404', DATE '2020-05-11');

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        (SELECT department_id FROM department WHERE department_code = 'DEPT_FIN'),
        (SELECT role_id FROM role WHERE role_code = 'ROLE_ACCT'),
        'EMP_TBAKER', 'Tom', 'Baker', 'tom.baker@globex-demo.com', '+1-312-555-0405', DATE '2023-01-09');

-- USER_ACCOUNT ----------------------------------------------------------------
-- password_hash is a placeholder string, not a real hash - see the column
-- comment/naming standards doc. Never used for actual authentication.

INSERT INTO user_account (organization_id, employee_id, username, email, password_hash, user_type)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT employee_id FROM employee WHERE employee_code = 'EMP_JSMITH'),
        'jsmith', 'john.smith@acme-demo.com', 'PLACEHOLDER_HASH_NOT_FOR_PROD', 'EMPLOYEE');

INSERT INTO user_account (organization_id, employee_id, username, email, password_hash, user_type)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT employee_id FROM employee WHERE employee_code = 'EMP_PNAIR'),
        'pnair', 'priya.nair@acme-demo.com', 'PLACEHOLDER_HASH_NOT_FOR_PROD', 'EMPLOYEE');

INSERT INTO user_account (organization_id, employee_id, username, email, password_hash, user_type)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT employee_id FROM employee WHERE employee_code = 'EMP_MLEE'),
        'mlee', 'mark.lee@acme-demo.com', 'PLACEHOLDER_HASH_NOT_FOR_PROD', 'EMPLOYEE');

INSERT INTO user_account (organization_id, employee_id, username, email, password_hash, user_type)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        (SELECT employee_id FROM employee WHERE employee_code = 'EMP_SCONNOR'),
        'sconnor', 'sara.connor@globex-demo.com', 'PLACEHOLDER_HASH_NOT_FOR_PROD', 'EMPLOYEE');

INSERT INTO user_account (organization_id, employee_id, username, email, password_hash, user_type)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        (SELECT employee_id FROM employee WHERE employee_code = 'EMP_TBAKER'),
        'tbaker', 'tom.baker@globex-demo.com', 'PLACEHOLDER_HASH_NOT_FOR_PROD', 'EMPLOYEE');

-- employee_id is nullable - this account is a client-portal login with no HR record.
INSERT INTO user_account (organization_id, employee_id, username, email, password_hash, user_type)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        NULL,
        'northwind.portal', 'portal@northwind-demo.com', 'PLACEHOLDER_HASH_NOT_FOR_PROD', 'CLIENT');

-- PROJECT ----------------------------------------------------------------

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT client_id FROM client WHERE client_code = 'CLIENT_NORTHWIND'),
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'OPEN'),
        'PRJ_WEBSITE', 'Website Redesign', 'Redesign of the public marketing website',
        DATE '2026-01-05', NULL);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT client_id FROM client WHERE client_code = 'CLIENT_CONTOSO'),
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'IN_PROGRESS'),
        'PRJ_ERP', 'ERP Integration', 'Integrate order data with client ERP system',
        DATE '2025-11-01', NULL);

-- client_id is nullable - internal projects need not be tied to an external client.
INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'ON_HOLD'),
        'PRJ_TOOLING', 'Internal Tooling Upgrade', 'Upgrade internal build and deployment tooling',
        DATE '2025-09-15', NULL);

-- TASK ----------------------------------------------------------------

INSERT INTO task (project_id, assigned_to_employee_id, status_id, priority_id, task_code, task_name, description, due_date)
VALUES ((SELECT project_id FROM project WHERE project_code = 'PRJ_WEBSITE'),
        (SELECT employee_id FROM employee WHERE employee_code = 'EMP_JSMITH'),
        (SELECT status_id FROM status WHERE entity_type = 'TASK' AND status_code = 'IN_PROGRESS'),
        (SELECT priority_id FROM priority WHERE priority_code = 'HIGH'),
        'TSK_HOMEPAGE', 'Build new homepage layout', 'Implement the approved homepage design',
        DATE '2026-08-20');

INSERT INTO task (project_id, assigned_to_employee_id, status_id, priority_id, task_code, task_name, description, due_date)
VALUES ((SELECT project_id FROM project WHERE project_code = 'PRJ_WEBSITE'),
        (SELECT employee_id FROM employee WHERE employee_code = 'EMP_PNAIR'),
        (SELECT status_id FROM status WHERE entity_type = 'TASK' AND status_code = 'TODO'),
        (SELECT priority_id FROM priority WHERE priority_code = 'MEDIUM'),
        'TSK_HOMEPAGE_QA', 'QA test new homepage', 'Cross-browser and responsive testing',
        DATE '2026-08-27');

INSERT INTO task (project_id, assigned_to_employee_id, status_id, priority_id, task_code, task_name, description, due_date)
VALUES ((SELECT project_id FROM project WHERE project_code = 'PRJ_ERP'),
        (SELECT employee_id FROM employee WHERE employee_code = 'EMP_JSMITH'),
        (SELECT status_id FROM status WHERE entity_type = 'TASK' AND status_code = 'IN_REVIEW'),
        (SELECT priority_id FROM priority WHERE priority_code = 'CRITICAL'),
        'TSK_ERP_API', 'Build ERP sync API', 'REST endpoint syncing order data to client ERP',
        DATE '2026-08-15');

-- assigned_to_employee_id is nullable - this task is not yet claimed.
INSERT INTO task (project_id, assigned_to_employee_id, status_id, priority_id, task_code, task_name, description, due_date)
VALUES ((SELECT project_id FROM project WHERE project_code = 'PRJ_TOOLING'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'TASK' AND status_code = 'BLOCKED'),
        (SELECT priority_id FROM priority WHERE priority_code = 'LOW'),
        'TSK_CI_UPGRADE', 'Upgrade CI pipeline', 'Blocked pending new build server provisioning',
        NULL);

COMMIT;
