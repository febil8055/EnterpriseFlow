# EnterpriseFlow — Core Database Design

This documents the *why* behind the `database/core/` schema, not just the DDL.
See `docs/er_diagram.md` for the visual relationship diagram and
`docs/naming_standards.md` for naming rules.

## Multi-tenancy: everything hangs off ORGANIZATION

`ORGANIZATION` is the tenant root. `DEPARTMENT`, `CLIENT`, `LOCATION`,
`USER_ACCOUNT`, `EMPLOYEE`, and `PROJECT` all carry a direct
`organization_id` foreign key, rather than only being reachable transitively
through a parent (e.g. `EMPLOYEE` could theoretically infer its organization
through `DEPARTMENT.organization_id`). The direct FK is intentional:

- Every tenant-scoped query (`WHERE organization_id = :tenant_id`) can filter
  directly on the table being queried, instead of joining through a chain of
  parents just to establish tenant boundaries. That matters for both query
  simplicity and for Virtual Private Database (VPD) / Row-Level Security
  policies later, which typically apply a single predicate per protected table.
- It makes a future data-integrity check trivial: verifying that
  `employee.department_id`'s department actually belongs to
  `employee.organization_id` is a simple join, not a multi-hop traversal.

`ROLE` and `TASK` do **not** carry `organization_id` directly — they're reached
through `DEPARTMENT` and `PROJECT` respectively, which is an acceptable
exception because those two are always queried in the context of their direct
parent (you don't list all roles across an org without going through
departments; you don't list all tasks without going through projects).

## ACTIVE_FLAG vs STATUS

Two different concepts were being conflated in the original design, where
every table had `status IN ('ACTIVE','INACTIVE')`:

- **`ACTIVE_FLAG CHAR(1)`** — a uniform enable/disable switch present on
  every master table. Application list views default to `WHERE active_flag =
  'Y'`; disabling a department, client, or employee doesn't delete history.
- **`STATUS`** — a genuine multi-value lifecycle state machine, only present
  on `PROJECT` (`OPEN` → `IN_PROGRESS` → `ON_HOLD`/`COMPLETED`/`CANCELLED`)
  and `TASK` (`TODO` → `IN_PROGRESS` → `IN_REVIEW` → `BLOCKED`/`DONE`). These
  values live in a shared `STATUS` lookup table rather than a `CHECK
  (status IN (...))` list baked into the table, because the business will
  want to add/rename/reorder states without a DDL change.

`ORGANIZATION`, `DEPARTMENT`, `ROLE`, `EMPLOYEE`, `CLIENT`, `LOCATION`, and
`USER_ACCOUNT` only need `ACTIVE_FLAG` — there's no real intermediate state
between "active" and "inactive" for a department or a client.

## STATUS and PRIORITY as shared lookup tables

Rather than `PROJECT_STATUS`/`TASK_STATUS`/`TASK_PRIORITY` as three separate
tables, there is one `STATUS` table (with an `ENTITY_TYPE` discriminator
column: `'PROJECT'` or `'TASK'`) and one `PRIORITY` table (no discriminator,
since priority levels — Low/Medium/High/Critical — mean the same thing
regardless of what they're attached to).

**Trade-off accepted knowingly:** a plain foreign key from
`PROJECT.status_id`/`TASK.status_id` to `STATUS.status_id` cannot, by itself,
guarantee the referenced row's `entity_type` matches. A declarative `CHECK`
constraint referencing another table's column isn't a safe way to enforce
this in Oracle either — `CHECK` constraints are evaluated as if the
referenced data is immutable and won't reliably re-fire if `STATUS.entity_type`
changes later. So the match is validated explicitly inside
`TRG_PROJECT_BI`/`TRG_PROJECT_BU` and `TRG_TASK_BI`/`TRG_TASK_BU`, which query
`STATUS` and raise `RAISE_APPLICATION_ERROR` on a mismatch. This is the
standard Oracle pattern for cross-table invariants that can't be expressed
declaratively.

## USER_ACCOUNT is not EMPLOYEE

`USER_ACCOUNT` is a login/security identity, deliberately modeled as its own
table with a **nullable** `employee_id` foreign key rather than being folded
into `EMPLOYEE` or requiring every employee to have one:

- Not every login is an employee — contractors, client-portal users, and
  service/API accounts all need to authenticate without an HR record.
- Not every employee needs a login — e.g. field staff who only appear in
  payroll/HR data.
- `user_type` (`EMPLOYEE`/`CONTRACTOR`/`CLIENT`/`SERVICE`) records which kind
  of identity the row represents, which will matter once APEX authentication
  and ORDS API keys are layered on top.
- `password_hash` is documented (via `COMMENT ON COLUMN`) as hash-only — the
  application layer must never write plaintext there. Actual hashing will be
  delegated to APEX's built-in authentication or an ORDS-fronted PL/SQL
  package, not implemented ad hoc in this schema.

## Surrogate keys: sequences + triggers, not identity columns

Every primary key is a `NUMBER(19,0)` populated by a `SEQ_<TABLE>` sequence
via a `BEFORE INSERT` trigger, per explicit requirement — identity columns
are not used anywhere. This is a deliberate, slightly more verbose choice
over `GENERATED ALWAYS AS IDENTITY`:

- The sequence and its numbering are visible, inspectable, and portable
  objects in their own right (`01_sequences.sql`), not hidden inside a
  column definition.
- `NOCACHE NOCYCLE` favors gap-free-enough, non-wrapping numbering over the
  raw insert throughput a large `CACHE` would buy — appropriate for
  low-to-moderate-volume master data, not high-frequency event/log tables.

## Audit trail: BEFORE UPDATE triggers, not application responsibility

Every table has `created_at`/`created_by` (set once, on insert) and
`updated_at`/`updated_by` (maintained by a `TRG_<table>_BU` trigger on every
update). Putting this in the trigger rather than trusting every future INSERT/
UPDATE statement — across raw SQL, APEX processes, and ORDS handlers — to
remember to set these columns means the audit trail can't silently go stale
because one code path forgot. The `BU` trigger also re-asserts
`created_at`/`created_by` from `:OLD`, so an application update can never
accidentally overwrite insert-time audit data.

`created_by`/`updated_by` default to the Oracle session `USER`. Once
ORDS/APEX sits in front of this schema, the real end user must be passed
through explicitly (e.g. `:APP_USER` in APEX processes, or a bind variable in
an ORDS handler) — the `USER` default is a fallback for direct SQL, not the
production behavior.

## Data-quality constraints beyond the obvious

- **Code format**: every `<table>_code` column has a
  `CHECK (REGEXP_LIKE(code, '^[A-Z0-9_]+$'))` constraint. Codes are treated
  as system identifiers (used in URLs, API payloads, integrations), not free
  text — enforcing a predictable shape at the database layer prevents
  inconsistent data regardless of which application path inserts it.
- **Email shape**: `EMPLOYEE.email` and `USER_ACCOUNT.email` have a basic
  `CHECK (REGEXP_LIKE(...))` shape validation. It's intentionally not full
  RFC 5322 validation — that belongs in the application layer — but it does
  catch obviously malformed data entered directly against the database.
- **Date sanity**: `PROJECT` has `CK_PROJECT_DATES` (`end_date >= start_date`
  when both are populated), a cheap guard against an entire class of bad
  data.
- **VARCHAR2(n CHAR)**, not bare `VARCHAR2(n)`, throughout — `CHAR` semantics
  count characters rather than bytes. This matters immediately in a
  multi-tenant SaaS product where client/organization names won't all be
  ASCII.

## Indexing

Oracle automatically creates a unique index backing every `PRIMARY KEY` and
`UNIQUE` constraint — those never need a manual index. It does **not**
automatically index plain `FOREIGN KEY` columns, and an unindexed FK column
causes full-table scans (and, in some scenarios, broader locking) on the
parent during child deletes/updates. `04_indexes.sql` therefore adds an
explicit `IX_<table>_<column>` index for every foreign key column in the
schema.
