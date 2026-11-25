# Status

_Update this file at the end of every piece of work._

Last updated: 2026-11-25 by the backend agent.

## Done

- Hub structure, agent rules, and context docs.
- Backend architecture and data model (draft, `architecture/backend.md`).
- API contract outline v0.1.0 (`contract/openapi.yaml`): shared conventions only, endpoints still to be written.

## In progress

- Nothing yet.

## Next

| Side | Item |
|---|---|
| Backend (ade writes, agent reviews) | Scaffold `Backend_Truckit`: FastAPI, Postgres, Docker Compose, auth, CI |
| Backend | Move requests, then quotes, then moves, then payments and notifications, then admin |
| Frontend | Foundation (tokens, shared components), then public and sign-up screens |

## Open questions

- Platform fee or commission on each quote? (affects payments design)
- Who pays out service centers: Stripe Connect payouts, or manual at first?
- Does a customer pay the full amount up front, or a deposit?
