# Status

_Update this file at the end of every piece of work._

Last updated: 2026-11-25 by the backend agent.

## Done

- Hub structure, agent rules, and context docs.
- Backend architecture and data model (draft, `architecture/backend.md`).
- Hub CI checks, shared sample data, environments doc, project board guide.
- Resources page, Figma frame index, and agent onboarding guides.
- API contract outline v0.1.0 (`contract/openapi.yaml`): shared conventions only, endpoints still to be written.

- Frontend foundation merged: [Frontend PR #1](https://github.com/Ibikunleogunbanwo/Frontend_Truckit/pull/1) and [Hub PR #6](https://github.com/Ibikunleogunbanwo/Hub_Truckit/pull/6). CI passed; [issue #5](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues/5) closed as completed. Includes shared tokens/components, responsive shells, showcase, typed API tooling and tests.
- Skills: the hub lists useful skills in [`onboarding/backend-skills.md`](../onboarding/backend-skills.md) instead of storing copies. Backend application code remains owned by ade.

- Backend project setup merged ([Backend PR #1](https://github.com/Ibikunleogunbanwo/Backend_Truckit/pull/1)): FastAPI app with `GET /api/v1/health` via an `/api/v1` router, pinned requirements (runtime and dev), `.gitignore` for `.env` and virtualenvs. Python 3.14.

## In progress

- Nothing yet.

## Next

| Side | Item |
|---|---|
| Backend (ade writes, agent reviews) | Settings class (pydantic-settings), `.env.example`, first test for `/health`; then Docker Compose with Postgres, CI, and the auth contract |
| Backend | Move requests, then quotes, then moves, then payments and notifications, then admin |
| Frontend | Public and sign-up screens; define missing API contracts in Hub before wiring endpoints |

## Open questions

- Platform fee or commission on each quote? (affects payments design)
- Who pays out service centers: Stripe Connect payouts, or manual at first?
- Does a customer pay the full amount up front, or a deposit?
