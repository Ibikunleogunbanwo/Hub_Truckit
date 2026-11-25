# Status

_Update this file at the end of every piece of work._

Last updated: 2026-11-25 by the frontend agent.

## Done

- Hub structure, agent rules, and context docs.
- Backend architecture and data model (draft, `architecture/backend.md`).
- Hub CI checks, shared sample data, environments doc, project board guide.
- Resources page, Figma frame index, and agent onboarding guides.
- API contract outline v0.1.0 (`contract/openapi.yaml`): shared conventions only, endpoints still to be written.

- Frontend foundation merged: [Frontend PR #1](https://github.com/Ibikunleogunbanwo/Frontend_Truckit/pull/1) and [Hub PR #6](https://github.com/Ibikunleogunbanwo/Hub_Truckit/pull/6). CI passed; [issue #5](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues/5) closed as completed. Includes shared tokens/components, responsive shells, showcase, typed API tooling and tests.
- Skills: the hub lists useful skills in [`onboarding/backend-skills.md`](../onboarding/backend-skills.md) instead of storing copies. Backend application code remains owned by ade.

## In progress

- Nothing yet.

## Next

| Side | Item |
|---|---|
| Backend (ade writes, agent reviews) | Scaffold `Backend_Truckit`: FastAPI, Postgres, Docker Compose, auth, CI |
| Backend | Move requests, then quotes, then moves, then payments and notifications, then admin |
| Frontend | Public and sign-up screens; define missing API contracts in Hub before wiring endpoints |

## Open questions

- Platform fee or commission on each quote? (affects payments design)
- Who pays out service centers: Stripe Connect payouts, or manual at first?
- Does a customer pay the full amount up front, or a deposit?
