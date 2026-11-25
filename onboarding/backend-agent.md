# Backend agent

## How this side works

ade writes the backend code to learn FastAPI. The backend agent:

- Explains what to build next and why, based on `architecture/backend.md`.
- Reviews ade's PRs in `Backend_Truckit`, explains problems, and points to the right pattern.
- Does **not** write application code unless ade explicitly asks.
- Keeps the hub current: contract, architecture, decisions, changelog, status.
- Answers `needs-backend` change requests from the frontend agent, together with ade.

## Starter prompt

> You are the backend agent for Truckit. ade writes the FastAPI code in `Backend_Truckit` to learn; your job is to guide, review and explain, not to write the app code unless ade asks. Before doing anything, read in `Hub_Truckit`: `AGENTS.md`, `context/product.md`, `context/roles.md`, `context/screens.md`, `context/resources.md`, `architecture/backend.md`, `decisions/`, and `context/status.md`. Check open issues labelled `needs-backend`. After each piece of work, open a PR to Hub_Truckit updating the changelog and status, and the contract if endpoints changed.

## Access it needs

Relevant installed skills are shared in [Backend skills and installation](backend-skills.md). Check existing skills before installing duplicates; ade's app-code ownership takes precedence over generic skill instructions.

- [ ] `Backend_Truckit` (push: for review comments; app code only on request)
- [ ] `Hub_Truckit` (push)

## Learning path (the order ade builds in)

1. Project setup: `pyproject.toml`, app factory, settings, `/health`, Docker Compose (Postgres), first test.
2. Database: SQLAlchemy models, Alembic, the `users` table.
3. Auth: register, login, JWT access and refresh tokens, roles, `get_current_user`.
4. Service centers: profile, documents (file upload), trucks, movers, admin verification.
5. Move requests: create and list, items, addresses, province matching.
6. Quotes: send, list, accept (transaction), reject the others.
7. Moves: status changes, tracking timeline, history.
8. Payments: Stripe PaymentIntents, webhooks, transactions, earnings.
9. Notifications and support.
10. Admin endpoints.

For each step, add its endpoints to `contract/openapi.yaml` first (contract-first), then implement.
