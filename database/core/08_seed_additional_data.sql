-- ============================================================
-- EnterpriseFlow - Core Module
-- 08_seed_additional_data.sql
--
-- Additive demo data on top of the existing seed, to give the
-- dashboard, reports and AI assistant a workspace with enough volume
-- and variety to be worth looking at.
--
-- Conventions carried over from 07_seed_data.sql:
--   * every foreign key is resolved by unique business code, never by
--     an assumed sequence value
--   * primary keys are left to the BEFORE INSERT triggers
--
-- Two deliberate choices specific to this file:
--
--   1. Every new business code carries an X marker (DEPTX_, ROLEX_,
--      EMPX, CLX_, LOCX_, PRJX_, TSKX_). The unique constraints on
--      those columns mean a second run fails loudly on the first
--      duplicate instead of silently doubling the data, and the marker
--      guarantees no collision with codes already in the workspace.
--
--   2. Task due dates are relative to SYSDATE, not literals. A demo
--      seeded with fixed dates drifts into "everything is nine months
--      overdue" within a year; relative dates keep the overdue /
--      due-soon / upcoming mix realistic whenever it is run.
--
-- The task spread is intentional, so every dashboard state has
-- something to show: a few genuinely overdue, a few blocked, a few
-- unassigned, a cluster inside the next seven days, and enough DONE
-- rows for completion percentages to move.
-- ============================================================

-- DEPARTMENTS -----------------------------------------------------

INSERT INTO department (organization_id, department_name, department_code)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'Product', 'DEPTX_PRODUCT');

INSERT INTO department (organization_id, department_name, department_code)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'Data & Analytics', 'DEPTX_DATA');

INSERT INTO department (organization_id, department_name, department_code)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'Security', 'DEPTX_SEC');

INSERT INTO department (organization_id, department_name, department_code)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'People Operations', 'DEPTX_PEOPLE');

-- ROLES -----------------------------------------------------------

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPTX_PRODUCT'),
        'Product Manager', 'ROLEX_PM', 'Owns roadmap and delivery priorities');

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPTX_PRODUCT'),
        'UX Designer', 'ROLEX_UX', 'Designs product experience and flows');

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPTX_DATA'),
        'Data Engineer', 'ROLEX_DATAENG', 'Builds and maintains data pipelines');

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPTX_SEC'),
        'Security Analyst', 'ROLEX_SECANALYST', 'Monitors and responds to security risk');

INSERT INTO role (department_id, role_name, role_code, description)
VALUES ((SELECT department_id FROM department WHERE department_code = 'DEPTX_PEOPLE'),
        'People Partner', 'ROLEX_PEOPLE', 'Supports hiring and employee experience');

-- CLIENTS ---------------------------------------------------------

INSERT INTO client (organization_id, client_code, client_name, email, phone)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'CLX_UMBRELLA', 'Umbrella Health', 'ap@umbrella-demo.com', '+1-212-555-0410');

INSERT INTO client (organization_id, client_code, client_name, email, phone)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'CLX_SOYLENT', 'Soylent Foods', 'ap@soylent-demo.com', '+1-212-555-0411');

INSERT INTO client (organization_id, client_code, client_name, email, phone)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'CLX_TYRELL', 'Tyrell Corporation', 'ap@tyrell-demo.com', '+1-312-555-0412');

INSERT INTO client (organization_id, client_code, client_name, email, phone)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'CLX_MASSIVE', 'Massive Dynamic', 'ap@massive-demo.com', '+1-312-555-0413');

INSERT INTO client (organization_id, client_code, client_name, email, phone)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'CLX_HOOLI', 'Hooli Systems', 'ap@hooli-demo.com', '+1-212-555-0414');

-- LOCATIONS -------------------------------------------------------

INSERT INTO location (organization_id, location_code, location_name, address_line1, city, state_province, postal_code, country)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'LOCX_AUS', 'Austin Hub', '98 Congress Ave', 'Austin', 'TX', '78701', 'USA');

INSERT INTO location (organization_id, location_code, location_name, address_line1, city, state_province, postal_code, country)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        'LOCX_LON', 'London Office', '20 Fenchurch St', 'London', 'England', 'EC3M 3BY', 'United Kingdom');

INSERT INTO location (organization_id, location_code, location_name, address_line1, city, state_province, postal_code, country)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'LOCX_BLR', 'Bengaluru Centre', 'Outer Ring Rd', 'Bengaluru', 'Karnataka', '560103', 'India');

INSERT INTO location (organization_id, location_code, location_name, address_line1, city, state_province, postal_code, country)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        'LOCX_BER', 'Berlin Studio', 'Torstrasse 140', 'Berlin', 'Berlin', '10119', 'Germany');

-- EMPLOYEES -------------------------------------------------------
-- organization_id is taken from the department so the two can never
-- disagree.

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX01', 'Maya', 'Iyer', 'maya.iyer@acme-demo.com', '+1-212-555-0501', TRUNC(SYSDATE) - 620
  FROM department d JOIN role r ON r.role_code = 'ROLEX_PM'
 WHERE d.department_code = 'DEPTX_PRODUCT';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX02', 'Daniel', 'Okafor', 'daniel.okafor@acme-demo.com', '+1-212-555-0502', TRUNC(SYSDATE) - 410
  FROM department d JOIN role r ON r.role_code = 'ROLEX_UX'
 WHERE d.department_code = 'DEPTX_PRODUCT';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX03', 'Hannah', 'Weiss', 'hannah.weiss@acme-demo.com', '+1-212-555-0503', TRUNC(SYSDATE) - 285
  FROM department d JOIN role r ON r.role_code = 'ROLEX_PM'
 WHERE d.department_code = 'DEPTX_PRODUCT';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX04', 'Arjun', 'Menon', 'arjun.menon@acme-demo.com', '+1-212-555-0504', TRUNC(SYSDATE) - 730
  FROM department d JOIN role r ON r.role_code = 'ROLEX_DATAENG'
 WHERE d.department_code = 'DEPTX_DATA';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX05', 'Clara', 'Nowak', 'clara.nowak@acme-demo.com', '+1-212-555-0505', TRUNC(SYSDATE) - 190
  FROM department d JOIN role r ON r.role_code = 'ROLEX_DATAENG'
 WHERE d.department_code = 'DEPTX_DATA';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX06', 'Victor', 'Almeida', 'victor.almeida@globex-demo.com', '+1-312-555-0506', TRUNC(SYSDATE) - 520
  FROM department d JOIN role r ON r.role_code = 'ROLEX_SECANALYST'
 WHERE d.department_code = 'DEPTX_SEC';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX07', 'Nadia', 'Haddad', 'nadia.haddad@globex-demo.com', '+1-312-555-0507', TRUNC(SYSDATE) - 95
  FROM department d JOIN role r ON r.role_code = 'ROLEX_SECANALYST'
 WHERE d.department_code = 'DEPTX_SEC';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX08', 'Peter', 'Lindqvist', 'peter.lindqvist@globex-demo.com', '+1-312-555-0508', TRUNC(SYSDATE) - 340
  FROM department d JOIN role r ON r.role_code = 'ROLEX_PEOPLE'
 WHERE d.department_code = 'DEPTX_PEOPLE';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX09', 'Rosa', 'Delgado', 'rosa.delgado@globex-demo.com', '+1-312-555-0509', TRUNC(SYSDATE) - 60
  FROM department d JOIN role r ON r.role_code = 'ROLEX_PEOPLE'
 WHERE d.department_code = 'DEPTX_PEOPLE';

INSERT INTO employee (organization_id, department_id, role_id, employee_code, first_name, last_name, email, phone, hire_date)
SELECT d.organization_id, d.department_id, r.role_id,
       'EMPX10', 'Kenji', 'Sato', 'kenji.sato@acme-demo.com', '+1-212-555-0510', TRUNC(SYSDATE) - 800
  FROM department d JOIN role r ON r.role_code = 'ROLEX_UX'
 WHERE d.department_code = 'DEPTX_PRODUCT';

-- PROJECTS --------------------------------------------------------

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT client_id FROM client WHERE client_code = 'CLX_UMBRELLA'),
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'IN_PROGRESS'),
        'PRJX_PATIENT', 'Patient Portal', 'Self-service portal for appointments and records',
        TRUNC(SYSDATE) - 120, TRUNC(SYSDATE) + 75);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT client_id FROM client WHERE client_code = 'CLX_SOYLENT'),
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'IN_PROGRESS'),
        'PRJX_SUPPLY', 'Supply Chain Visibility', 'Real-time tracking across suppliers and depots',
        TRUNC(SYSDATE) - 200, TRUNC(SYSDATE) + 40);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'OPEN'),
        'PRJX_DATALAKE', 'Data Lake Foundation', 'Central analytics store for all business domains',
        TRUNC(SYSDATE) - 30, NULL);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        (SELECT client_id FROM client WHERE client_code = 'CLX_TYRELL'),
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'IN_PROGRESS'),
        'PRJX_ZEROTRUST', 'Zero Trust Rollout', 'Identity-first network access across all offices',
        TRUNC(SYSDATE) - 150, TRUNC(SYSDATE) + 110);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        (SELECT client_id FROM client WHERE client_code = 'CLX_MASSIVE'),
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'ON_HOLD'),
        'PRJX_WAREHOUSE', 'Warehouse Automation', 'Robotics pilot for the Chicago distribution centre',
        TRUNC(SYSDATE) - 260, NULL);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'OPEN'),
        'PRJX_ONBOARD', 'Employee Onboarding Revamp', 'Cut new-hire ramp time from six weeks to two',
        TRUNC(SYSDATE) - 15, TRUNC(SYSDATE) + 90);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        (SELECT client_id FROM client WHERE client_code = 'CLX_HOOLI'),
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'COMPLETED'),
        'PRJX_BILLING', 'Billing Engine Replacement', 'Replaced the legacy invoicing engine',
        TRUNC(SYSDATE) - 400, TRUNC(SYSDATE) - 45);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'IN_PROGRESS'),
        'PRJX_DESIGNSYS', 'Design System v2', 'One component library across web and mobile',
        TRUNC(SYSDATE) - 70, TRUNC(SYSDATE) + 55);

-- TASKS -----------------------------------------------------------
-- Written as INSERT ... SELECT over an inline row set rather than 30
-- separate statements: same code-based FK resolution, a fraction of
-- the noise, and the whole spread is visible in one place.
--
-- due_offset is days from today. NULL means no due date.

INSERT INTO task (project_id, assigned_to_employee_id, status_id, priority_id,
                  task_code, task_name, description, due_date)
SELECT (SELECT p.project_id  FROM project  p WHERE p.project_code  = s.pcode),
       (SELECT e.employee_id FROM employee e WHERE e.employee_code = s.ecode),
       (SELECT st.status_id  FROM status   st WHERE st.entity_type = 'TASK'
                                               AND st.status_code  = s.scode),
       (SELECT pr.priority_id FROM priority pr WHERE pr.priority_code = s.prcode),
       s.tcode, s.tname, s.tdesc,
       CASE WHEN s.due_offset IS NULL THEN NULL ELSE TRUNC(SYSDATE) + s.due_offset END
  FROM (
    -- Patient Portal ------------------------------------------------
    SELECT 'PRJX_PATIENT' pcode,'EMPX01' ecode,'DONE'        scode,'HIGH'     prcode,'TSKX_PP_DISCOVERY' tcode,'Clinical discovery workshops' tname,'Interview clinicians on record access needs' tdesc,-40 due_offset FROM dual UNION ALL
    SELECT 'PRJX_PATIENT','EMPX02','DONE','MEDIUM','TSKX_PP_WIREFRAME','Appointment booking wireframes','Low-fidelity flows for booking and rescheduling',-22 FROM dual UNION ALL
    SELECT 'PRJX_PATIENT','EMPX02','IN_PROGRESS','HIGH','TSKX_PP_UI','Build appointment booking UI','Implement the approved booking flow',6 FROM dual UNION ALL
    SELECT 'PRJX_PATIENT','EMPX04','IN_REVIEW','CRITICAL','TSKX_PP_HL7','HL7 records integration','Pull patient records from the hospital system',3 FROM dual UNION ALL
    SELECT 'PRJX_PATIENT','EMPX06','BLOCKED','CRITICAL','TSKX_PP_PENTEST','Penetration test sign-off','Blocked pending external auditor availability',-5 FROM dual UNION ALL
    SELECT 'PRJX_PATIENT',NULL,'TODO','MEDIUM','TSKX_PP_A11Y','Accessibility audit','WCAG 2.2 AA review of all patient screens',18 FROM dual UNION ALL
    -- Supply Chain Visibility --------------------------------------
    SELECT 'PRJX_SUPPLY','EMPX04','DONE','HIGH','TSKX_SC_INGEST','Supplier feed ingestion','Nightly ingest from twelve supplier feeds',-60 FROM dual UNION ALL
    SELECT 'PRJX_SUPPLY','EMPX05','DONE','MEDIUM','TSKX_SC_NORMALISE','Normalise supplier schemas','Map supplier formats to the canonical model',-18 FROM dual UNION ALL
    SELECT 'PRJX_SUPPLY','EMPX05','IN_PROGRESS','HIGH','TSKX_SC_DASH','Depot latency dashboard','Surface per-depot delivery latency',9 FROM dual UNION ALL
    SELECT 'PRJX_SUPPLY','EMPX01','TODO','LOW','TSKX_SC_ALERTS','Threshold alerting','Notify ops when latency breaches SLA',26 FROM dual UNION ALL
    SELECT 'PRJX_SUPPLY','EMPX04','IN_PROGRESS','CRITICAL','TSKX_SC_RECONCILE','Stock reconciliation job','Reconcile depot counts against the ledger',-2 FROM dual UNION ALL
    -- Data Lake Foundation -----------------------------------------
    SELECT 'PRJX_DATALAKE','EMPX04','IN_PROGRESS','HIGH','TSKX_DL_ZONES','Define landing and curated zones','Zone layout, retention and access rules',12 FROM dual UNION ALL
    SELECT 'PRJX_DATALAKE','EMPX05','TODO','MEDIUM','TSKX_DL_CATALOG','Stand up data catalogue','Searchable catalogue with ownership metadata',30 FROM dual UNION ALL
    SELECT 'PRJX_DATALAKE',NULL,'TODO','HIGH','TSKX_DL_GOVERN','Data governance policy','Classification and retention policy sign-off',21 FROM dual UNION ALL
    SELECT 'PRJX_DATALAKE','EMPX04','TODO','LOW','TSKX_DL_COST','Storage cost model','Forecast storage spend across zones',45 FROM dual UNION ALL
    -- Zero Trust Rollout -------------------------------------------
    SELECT 'PRJX_ZEROTRUST','EMPX06','DONE','CRITICAL','TSKX_ZT_IDP','Identity provider migration','Consolidate onto a single IdP',-35 FROM dual UNION ALL
    SELECT 'PRJX_ZEROTRUST','EMPX06','IN_PROGRESS','CRITICAL','TSKX_ZT_MFA','Enforce MFA everywhere','Phased MFA enforcement by department',4 FROM dual UNION ALL
    SELECT 'PRJX_ZEROTRUST','EMPX07','IN_PROGRESS','HIGH','TSKX_ZT_SEGMENT','Network segmentation','Segment office networks by trust tier',14 FROM dual UNION ALL
    SELECT 'PRJX_ZEROTRUST','EMPX07','BLOCKED','HIGH','TSKX_ZT_LEGACY','Legacy app SSO wiring','Blocked: vendor has not shipped SAML support',-8 FROM dual UNION ALL
    SELECT 'PRJX_ZEROTRUST','EMPX06','IN_REVIEW','MEDIUM','TSKX_ZT_RUNBOOK','Incident response runbook','Runbook for access-related incidents',2 FROM dual UNION ALL
    -- Warehouse Automation (on hold) -------------------------------
    SELECT 'PRJX_WAREHOUSE','EMPX08','TODO','MEDIUM','TSKX_WH_VENDOR','Robotics vendor shortlist','Evaluate three automation vendors',NULL FROM dual UNION ALL
    SELECT 'PRJX_WAREHOUSE',NULL,'TODO','LOW','TSKX_WH_LAYOUT','Floor layout simulation','Model throughput for two floor layouts',NULL FROM dual UNION ALL
    -- Employee Onboarding Revamp -----------------------------------
    SELECT 'PRJX_ONBOARD','EMPX08','IN_PROGRESS','HIGH','TSKX_OB_JOURNEY','Map the new-hire journey','Document every touchpoint in the first 30 days',7 FROM dual UNION ALL
    SELECT 'PRJX_ONBOARD','EMPX09','TODO','MEDIUM','TSKX_OB_AUTOMATE','Automate account provisioning','Accounts and access ready on day one',20 FROM dual UNION ALL
    SELECT 'PRJX_ONBOARD','EMPX09','TODO','LOW','TSKX_OB_BUDDY','Buddy programme pilot','Pair new hires with an onboarding buddy',33 FROM dual UNION ALL
    SELECT 'PRJX_ONBOARD','EMPX03','IN_REVIEW','MEDIUM','TSKX_OB_SURVEY','Day-30 feedback survey','Measure ramp confidence at thirty days',5 FROM dual UNION ALL
    -- Billing Engine Replacement (completed) -----------------------
    SELECT 'PRJX_BILLING','EMPX10','DONE','CRITICAL','TSKX_BL_CUTOVER','Production cutover','Switch invoicing to the new engine',-50 FROM dual UNION ALL
    SELECT 'PRJX_BILLING','EMPX10','DONE','HIGH','TSKX_BL_RECON','Post-cutover reconciliation','Verify invoice totals against legacy',-46 FROM dual UNION ALL
    SELECT 'PRJX_BILLING','EMPX03','DONE','MEDIUM','TSKX_BL_DECOM','Retire legacy billing service','Shut down and archive the old service',-44 FROM dual UNION ALL
    -- Design System v2 ---------------------------------------------
    SELECT 'PRJX_DESIGNSYS','EMPX02','DONE','HIGH','TSKX_DS_AUDIT','Audit existing components','Inventory every component in production',-28 FROM dual UNION ALL
    SELECT 'PRJX_DESIGNSYS','EMPX10','IN_PROGRESS','HIGH','TSKX_DS_TOKENS','Define design tokens','Colour, type and spacing scales as tokens',8 FROM dual UNION ALL
    SELECT 'PRJX_DESIGNSYS','EMPX10','IN_PROGRESS','MEDIUM','TSKX_DS_FORMS','Rebuild form components','Inputs, selects and validation states',16 FROM dual UNION ALL
    SELECT 'PRJX_DESIGNSYS','EMPX02','TODO','LOW','TSKX_DS_DOCS','Component documentation site','Usage guidance and live examples',38 FROM dual UNION ALL
    SELECT 'PRJX_DESIGNSYS',NULL,'TODO','MEDIUM','TSKX_DS_DARK','Dark mode token pass','Second token set for dark surfaces',24 FROM dual
  ) s;

COMMIT;
