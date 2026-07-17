# EnterpriseFlow — Repository Folder Structure

```
EnterpriseFlow/
  database/
    core/            -- Goal 3 master tables: the tenant/org/people/work backbone
      01_sequences.sql
      02_tables.sql
      03_constraints.sql
      04_indexes.sql
      05_comments.sql
      06_triggers.sql
      07_seed_data.sql
    tables/           -- early-stage module stubs, set aside for now (see below)
      hr.sql
      crm.sql
      finance.sql
      assets.sql
      security.sql
      project_module.sql
  apex/               -- APEX application export/scripts (once built)
  api/                -- ORDS REST module definitions/specs (once built)
  deployment/         -- environment setup scripts, ORDS/APEX install notes
  docs/               -- this documentation set
  testing/            -- test scripts/data for the schema and API layer
```

## Why `database/core/` is a numbered pipeline per module, not one flat script

Every module gets its own folder with the same seven numbered files
(`01_sequences.sql` … `07_seed_data.sql`), rather than one giant
`01_sequences.sql` covering the entire schema. Reasons:

- **Independent re-runability.** You can drop and rebuild the `core` module
  without touching HR, CRM, or Finance once those exist — useful constantly
  during development, and for demoing one module in isolation.
- **Review size.** A single flat `02_tables.sql` for the whole application
  would eventually span 40+ tables in one file, defeating the "review each
  object before moving to the next" discipline this project is being built
  under.
- **Ownership boundaries.** Modules map to business domains (Core, HR, CRM,
  Finance, Assets, Security, Projects). As the team grows, different people
  can own different module folders without merge conflicts in a shared file.

The trade-off is that a schema-wide install runs each module folder's scripts
in dependency order, rather than one linear pass — that's what
`docs/deployment_process.md` documents.

## Why the six-file split within each module

Table creation, constraint creation, and index creation are deliberately three
separate files, not one `CREATE TABLE ... , CONSTRAINT fk ...` block per table:

- **Constraints separated from tables (`03_constraints.sql`)** — lets tables
  reference each other regardless of the order they were created in. `ROLE`
  references `DEPARTMENT`; if constraints were inline, table creation order
  would have to exactly match the dependency graph. With constraints applied
  afterward, creation order in `02_tables.sql` only needs to be *readable*
  (parent before child, by convention), not strictly correct.
- **Indexes separated (`04_indexes.sql`)** — Oracle auto-creates a unique index
  for every `PRIMARY KEY`/`UNIQUE` constraint, but never for a plain `FOREIGN
  KEY` column. Keeping indexes in their own file makes it obvious, at a
  glance, which indexes exist *because* of a constraint versus which were
  added deliberately for foreign-key lookup performance.
- **Comments separated (`05_comments.sql`)** — `COMMENT ON` statements are
  pure documentation with zero structural effect; keeping them out of
  `02_tables.sql` keeps the table definitions themselves easy to scan.
- **Triggers separated (`06_triggers.sql`)** — triggers depend on both the
  table and its sequence existing, so they naturally come after both.
- **Seed data last (`07_seed_data.sql`)** — inserts require the full
  structure (tables, constraints, triggers) to already be in place.

## What happened to `database/tables/`

`database/tables/` was the very first, pre-standards layout: one file per
table/sequence/trigger, no numbered pipeline, no comments, `STATUS` instead of
`ACTIVE_FLAG`. `ORGANIZATION`, `DEPARTMENT`, `ROLE`, and `EMPLOYEE` have since
been migrated out of it into `database/core/` under the current standard.

The remaining files there — `hr.sql`, `crm.sql`, `finance.sql`, `assets.sql`,
`security.sql`, `project_module.sql` — are early stub modules (one real table
each, plus a comment block listing tables that were never built). They're
intentionally left as-is for now rather than deleted or finished, so they can
be rebuilt properly as their own numbered module folders (`database/hr/`,
`database/crm/`, etc.) when those modules actually get scheduled.
