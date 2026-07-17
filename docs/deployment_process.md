# EnterpriseFlow — Deployment Process

## Environment

| | |
|---|---|
| Host | Windows 11, running VM1 and VM2 |
| VM1 | Ubuntu 26.04 — VS Code, Git, this repository |
| VM2 | Oracle Linux 10.2 — Oracle AI Database Free 26ai, pluggable database `FREEPDB1` |
| Schema/user | `ENTERPRISEFLOW` |
| Connection | `192.168.83.129:1521/FREEPDB1` |

VM1 is where code is written and committed. VM2 is where the database
actually runs. SQL scripts are written on VM1 and executed against VM2 over
the network (SQL*Plus or SQLcl connecting to the listener at
`192.168.83.129:1521`), or copied to VM2 and run locally — either works
identically since it's the same listener/service either way.

## Running the core module

Scripts inside a module folder must run in numeric order — later files
assume earlier ones already exist (constraints need tables, indexes and
triggers need constraints/sequences, seed data needs the full structure):

```bash
sqlplus ENTERPRISEFLOW/<password>@192.168.83.129:1521/FREEPDB1 @database/core/01_sequences.sql
sqlplus ENTERPRISEFLOW/<password>@192.168.83.129:1521/FREEPDB1 @database/core/02_tables.sql
sqlplus ENTERPRISEFLOW/<password>@192.168.83.129:1521/FREEPDB1 @database/core/03_constraints.sql
sqlplus ENTERPRISEFLOW/<password>@192.168.83.129:1521/FREEPDB1 @database/core/04_indexes.sql
sqlplus ENTERPRISEFLOW/<password>@192.168.83.129:1521/FREEPDB1 @database/core/05_comments.sql
sqlplus ENTERPRISEFLOW/<password>@192.168.83.129:1521/FREEPDB1 @database/core/06_triggers.sql
sqlplus ENTERPRISEFLOW/<password>@192.168.83.129:1521/FREEPDB1 @database/core/07_seed_data.sql
```

Never commit a password into a script or into git. Prefer an OS-level
`sqlnet` wallet, an interactive prompt, or an environment variable read by
your shell profile — not a literal credential in a tracked file.

Once more module folders exist (`database/hr/`, `database/crm/`, etc.), each
follows the same seven-file order internally; the only new decision is
which module folders must run before others, driven by foreign keys that
cross module boundaries (e.g. anything referencing `ORGANIZATION` must run
after `database/core/`).

### Rebuilding from scratch

There is currently no `drop_all.sql` — during active development, the
straightforward option is dropping and recreating the `ENTERPRISEFLOW` user,
or `DROP TABLE ... CASCADE CONSTRAINTS PURGE` for the 11 core tables in
reverse dependency order (`TASK`, `PROJECT`, `USER_ACCOUNT`, `EMPLOYEE`,
`ROLE`, `DEPARTMENT`, `LOCATION`, `CLIENT`, `PRIORITY`, `STATUS`,
`ORGANIZATION`), followed by dropping the 11 sequences. A proper
`00_drop.sql` per module is worth adding once the schema stabilizes enough
that "just recreate the user" stops being the fastest option.

## Git workflow

Every schema milestone gets its own commit (see the commit history for
`database/core/` as the pattern): one logical unit of work — a table, a
closely related pair of tables, a constraint fix — per commit, with a
message explaining *why*, not just *what*. Nothing is pushed to a remote
without being asked to explicitly; commits stay local until you request a
push.

## What's next

1. **ORDS installation on VM2** — once the core schema is verified against
   the real database, the next milestone is installing Oracle REST Data
   Services so the schema can be exposed over HTTP.
2. **Oracle APEX installation on VM2** — layered on top of ORDS, gives a
   low-code UI directly against `ENTERPRISEFLOW`.
3. **APEX application build** — CRUD pages for the core master tables,
   starting with `ORGANIZATION` → `DEPARTMENT` → `EMPLOYEE` in that order,
   matching the dependency chain already established in the schema.
4. **REST API exposure via ORDS** — auto-REST or hand-written PL/SQL-backed
   modules under `api/`, once the APEX application's data access patterns are
   known (so the API shape reflects real usage, not a guess).

Each of these is its own milestone with its own design discussion before
implementation, per the same "review before building" approach used for the
schema.
