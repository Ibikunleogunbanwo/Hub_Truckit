# 0004. Neon for hosted Postgres

- Status: Accepted
- Date: 2026-11-25
- Decided by: ade

## Context
Running Postgres on the VPS uses disk space and means handling backups ourselves. Databricks Lakebase was considered: it is managed Postgres (built on Neon's technology) and is available in Canada, but it needs a billed Databricks workspace, has only a 14-day trial, and defaults to large compute.

## Decision
Use **Neon** for hosted Postgres in staging and production. Local development keeps Postgres in Docker Compose.

## Consequences
- No database on the VPS. There is a free tier to start, and compute scales to zero when idle.
- The app only sees a `DATABASE_URL`. Use Neon's pooled connection string for the API and the direct one for Alembic migrations.
- A scaled-to-zero compute takes a moment to wake on the first query after idling. This is acceptable at this stage.
- Neon branches can give each PR or preview its own database copy later.
- Choose a region close to Canadian users when creating the project.
- Revisit Lakebase if analytics move into Databricks (`truckit-dataengineering-platform`); since Lakebase is Postgres, the app code would not change.
