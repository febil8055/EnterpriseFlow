-- ============================================================
-- EnterpriseFlow - Core Module
-- 09_seed_enterprise_scenarios.sql
--
-- Adds four programmes and the kind of work that actually shows up on
-- an operations dashboard in a real company: audit evidence, quarter
-- end, DR testing, CVE patching, licence true-ups, segregation of
-- duties, regulator submissions.
--
-- Why this file exists: the earlier seed produced technically valid
-- but generic work ("SEO audit", "Social media rollout"), so the
-- dashboard's headline action and AI brief read like a demo. The
-- scenarios below are recognisable to anyone who has worked in an
-- enterprise, which is what makes the brief credible.
--
-- The spread is deliberate. Worst overdue is the SOX evidence task at
-- 11 days, so it becomes the headline recommendation; the S/4HANA
-- programme carries the most flags, so it becomes the riskiest
-- project. Everything else fills in behind those two.
--
-- Conventions as per 07/08: FKs resolved by business code, PKs left to
-- the BEFORE INSERT triggers, codes carry an E marker so a second run
-- fails on the unique constraint instead of duplicating, and due dates
-- are relative to SYSDATE so the mix stays realistic over time.
-- ============================================================

-- PROGRAMMES ------------------------------------------------------

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'IN_PROGRESS'),
        'PRJE_S4HANA', 'S/4HANA Upgrade', 'Upgrade core ERP from ECC to S/4HANA',
        TRUNC(SYSDATE) - 240, TRUNC(SYSDATE) + 120);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'IN_PROGRESS'),
        'PRJE_DCEXIT', 'Data Centre Exit', 'Close the on-premise data centre and move remaining workloads',
        TRUNC(SYSDATE) - 180, TRUNC(SYSDATE) + 95);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_ACME'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'IN_PROGRESS'),
        'PRJE_SOX', 'SOX Controls Remediation', 'Close findings raised in the external audit',
        TRUNC(SYSDATE) - 90, TRUNC(SYSDATE) + 45);

INSERT INTO project (organization_id, client_id, status_id, project_code, project_name, description, start_date, end_date)
VALUES ((SELECT organization_id FROM organization WHERE organization_code = 'ORG_GLOBEX'),
        NULL,
        (SELECT status_id FROM status WHERE entity_type = 'PROJECT' AND status_code = 'OPEN'),
        'PRJE_REGREP', 'Regulatory Reporting Automation', 'Automate quarterly regulator submissions',
        TRUNC(SYSDATE) - 25, TRUNC(SYSDATE) + 150);

-- WORK ------------------------------------------------------------

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
    -- S/4HANA Upgrade - carries the most risk, becomes the headline programme
    SELECT 'PRJE_S4HANA' pcode,'EMPX04' ecode,'IN_PROGRESS' scode,'CRITICAL' prcode,'TSKE_S4_SOXEVID' tcode,'SOX access recertification evidence' tname,'Collect and sign off user access evidence for the auditors' tdesc,-11 due_offset FROM dual UNION ALL
    SELECT 'PRJE_S4HANA','EMPX01','IN_PROGRESS','HIGH','TSKE_S4_UAT','Finance module UAT sign-off','Business sign-off on finance test cycle',-4 FROM dual UNION ALL
    SELECT 'PRJE_S4HANA','EMPX05','BLOCKED','HIGH','TSKE_S4_MIGDRY','Data migration dry run 2','Blocked: source extract from ECC not delivered',-6 FROM dual UNION ALL
    SELECT 'PRJE_S4HANA','EMPX03','TODO','MEDIUM','TSKE_S4_LICENCE','Vendor licence true-up','Reconcile named users against contracted entitlement',5 FROM dual UNION ALL
    SELECT 'PRJE_S4HANA',NULL,'TODO','HIGH','TSKE_S4_RUNBOOK','Cutover runbook review','Walk the go-live runbook with infrastructure',9 FROM dual UNION ALL
    SELECT 'PRJE_S4HANA','EMPX02','TODO','MEDIUM','TSKE_S4_DECOM','Legacy interface decommission plan','Retire the 14 interfaces S/4HANA replaces',21 FROM dual UNION ALL
    SELECT 'PRJE_S4HANA','EMPX01','DONE','HIGH','TSKE_S4_BLUEPRINT','Phase 1 blueprint sign-off','Design authority approval of target architecture',-70 FROM dual UNION ALL
    -- Data Centre Exit
    SELECT 'PRJE_DCEXIT','EMPX06','IN_PROGRESS','CRITICAL','TSKE_DC_DRTEST','DR failover test report','Evidence the failover test result for the risk committee',-7 FROM dual UNION ALL
    SELECT 'PRJE_DCEXIT','EMPX07','IN_PROGRESS','MEDIUM','TSKE_DC_RACK','Rack decommission schedule','Sequence rack teardown around remaining workloads',12 FROM dual UNION ALL
    SELECT 'PRJE_DCEXIT','EMPX08','BLOCKED','LOW','TSKE_DC_CIRCUIT','Network circuit cancellation','Blocked: carrier requires 90 days written notice',3 FROM dual UNION ALL
    SELECT 'PRJE_DCEXIT',NULL,'TODO','MEDIUM','TSKE_DC_ASSETS','Asset disposal certificates','Certificates of destruction for decommissioned disks',18 FROM dual UNION ALL
    SELECT 'PRJE_DCEXIT','EMPX06','DONE','HIGH','TSKE_DC_NOTICE','Colocation contract termination notice','Formal notice served to the colo provider',-52 FROM dual UNION ALL
    -- SOX Controls Remediation
    SELECT 'PRJE_SOX','EMPX09','IN_PROGRESS','CRITICAL','TSKE_SOX_SOD','Segregation of duties review','Resolve conflicting roles flagged in the audit',-3 FROM dual UNION ALL
    SELECT 'PRJE_SOX','EMPX03','IN_PROGRESS','HIGH','TSKE_SOX_QCLOSE','Quarter-end close checklist sign-off','Controller sign-off on the Q3 close checklist',-1 FROM dual UNION ALL
    SELECT 'PRJE_SOX','EMPX09','IN_REVIEW','MEDIUM','TSKE_SOX_EVID','Control evidence upload - Q3','Upload evidence for the 22 in-scope controls',2 FROM dual UNION ALL
    SELECT 'PRJE_SOX','EMPX01','TODO','HIGH','TSKE_SOX_WALK','External auditor walkthrough','Walk the remediated controls with the audit team',8 FROM dual UNION ALL
    SELECT 'PRJE_SOX','EMPX10','BLOCKED','MEDIUM','TSKE_SOX_PLAN','Remediation plan approval','Blocked: awaiting audit committee date',6 FROM dual UNION ALL
    SELECT 'PRJE_SOX','EMPX09','DONE','MEDIUM','TSKE_SOX_SCOPE','SOX scoping workshop','Agree in-scope processes and controls',-62 FROM dual UNION ALL
    -- Regulatory Reporting Automation
    SELECT 'PRJE_REGREP','EMPX05','IN_PROGRESS','MEDIUM','TSKE_RR_LINEAGE','Define reporting data lineage','Trace every reported figure to its source system',14 FROM dual UNION ALL
    SELECT 'PRJE_REGREP','EMPX04','TODO','HIGH','TSKE_RR_FORMAT','Regulator submission format spec','Confirm the required schema with the regulator',25 FROM dual UNION ALL
    SELECT 'PRJE_REGREP',NULL,'TODO','LOW','TSKE_RR_BACKFILL','Historical data backfill','Load three years of prior submissions',30 FROM dual UNION ALL
    -- Security work on the existing Zero Trust programme
    SELECT 'PRJX_ZEROTRUST','EMPX07','IN_PROGRESS','CRITICAL','TSKE_ZT_CVE','Patch critical CVEs on payment gateway','Two criticals outstanding past the SLA window',-5 FROM dual UNION ALL
    SELECT 'PRJX_ZEROTRUST','EMPX06','TODO','HIGH','TSKE_ZT_ACCESS','Quarterly access review','Recertify privileged access across production',4 FROM dual
  ) s;

COMMIT;
