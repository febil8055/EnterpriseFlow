# EnterpriseFlow — Oracle Naming Standards

These conventions apply to every object in the `ENTERPRISEFLOW` schema. They exist so
that any object's purpose and relationships can be read directly from its name,
without needing to open the DDL.

## Tables

- Singular noun, lowercase, snake_case: `organization`, `department`, `user_account`.
  Singular because a row represents one instance of the entity, and it keeps
  foreign key columns readable (`employee.department_id` reads naturally).
- Module-specific tables that aren't master data are prefixed by nothing extra —
  the containing folder (e.g. `database/hr/`) provides the module context, not the
  table name.

## Columns

- `snake_case`, descriptive, no abbreviations unless industry-standard (`id`, `url`).
- Surrogate primary key: `<table>_id`, e.g. `organization_id`.
- Foreign key columns: `<referenced_table>_id` by default (`department.organization_id`),
  or `<role_description>_<referenced_table>_id` when a table has more than one FK to
  the same parent or the relationship needs a name (`task.assigned_to_employee_id`).
- Short system identifiers used in URLs/APIs: `<table>_code`, always uppercase,
  alphanumeric + underscore only, enforced by a `CHECK (REGEXP_LIKE(...))` constraint.
- Human-facing display name: `<table>_name`.

## Audit columns (every table)

| Column | Type | Populated by |
|---|---|---|
| `created_at` | `TIMESTAMP` | `TRG_<TABLE>_BI`, `SYSTIMESTAMP`, never changes again |
| `created_by` | `VARCHAR2(100 CHAR)` | `TRG_<TABLE>_BI`, `USER` (DB session) as a fallback default |
| `updated_at` | `TIMESTAMP` | `TRG_<TABLE>_BU`, `SYSTIMESTAMP` on every update |
| `updated_by` | `VARCHAR2(100 CHAR)` | `TRG_<TABLE>_BU`, `USER` on every update |
| `active_flag` | `CHAR(1)`, `'Y'`/`'N'` | Application; defaults to `'Y'` |

`STATUS` (multi-value lifecycle state, e.g. `OPEN`/`IN_PROGRESS`/`DONE`) is a
**separate concept** from `ACTIVE_FLAG` (enable/disable, soft delete) and only
appears on tables that genuinely need a state machine (`PROJECT`, `TASK`). Simple
master tables carry `ACTIVE_FLAG` only.

`created_by`/`updated_by` default to the Oracle session `USER`, which is a safety
net for direct SQL, not the source of truth once APEX/ORDS sits in front of this
schema — the application layer should explicitly write `:APP_USER` on insert/update
so the audit trail reflects the real end user, not the connection-pool identity.

## Sequences

- `SEQ_<TABLE>`, e.g. `SEQ_ORGANIZATION`.
- Identity columns are **not** used anywhere in this schema — every surrogate key
  is populated by a sequence via a `BEFORE INSERT` trigger. This keeps key
  generation visible and portable, and matches long-standing Oracle enterprise
  convention (identity columns are a newer, Oracle-12c+ convenience feature; this
  schema intentionally favors the explicit, inspectable pattern).
- `NOCACHE NOCYCLE`: correctness (gap-free-enough, no wraparound) over the raw
  throughput `CACHE` would buy — these are master-data tables with modest insert
  volume, not high-frequency event logs.

## Constraints

| Prefix | Meaning |
|---|---|
| `PK_<table>` | Primary key |
| `NN_<table>_<column>` | Not null (named explicitly rather than left anonymous, so a violation error names the actual rule) |
| `UK_<table>_<column>` | Unique key |
| `CK_<table>_<column>` | Check constraint |
| `FK_<table>_<referenced_table>` | Foreign key |

## Indexes

- `IX_<table>_<column>`, e.g. `IX_DEPARTMENT_ORGANIZATION`.
- Oracle auto-creates a unique index for every `PRIMARY KEY` and `UNIQUE`
  constraint — `04_indexes.sql` only ever adds indexes for foreign key columns
  (which Oracle does **not** index automatically) and any future query-driven
  indexes.

## Triggers

- `TRG_<table>_BI` — `BEFORE INSERT`, assigns the surrogate key from the
  table's sequence when the caller doesn't supply one.
- `TRG_<table>_BU` — `BEFORE UPDATE`, maintains `updated_at`/`updated_by` and
  protects `created_at`/`created_by` from being overwritten by an application
  update. A handful of tables (`PROJECT`, `TASK`) also validate cross-table
  invariants here (see `docs/database_design.md`) that a declarative `CHECK`
  constraint cannot safely express.

## Data types

- Surrogate keys: `NUMBER(19,0)` — precise, no silent decimals, large enough to
  never need widening.
- Text: always `VARCHAR2(n CHAR)`, never bare `VARCHAR2(n)` — `CHAR` semantics
  count characters, not bytes, which matters the moment non-ASCII data
  (client names, addresses) shows up in a multi-tenant SaaS product.
- Money/quantities (future modules): `NUMBER(p,s)` with explicit precision/scale,
  never bare `NUMBER`.

## SQL script pipeline

Within any module folder (e.g. `database/core/`), scripts are numbered and run
in this fixed order — see `docs/folder_structure.md` for the full rationale:

```
01_sequences.sql
02_tables.sql
03_constraints.sql
04_indexes.sql
05_comments.sql
06_triggers.sql
07_seed_data.sql
```
