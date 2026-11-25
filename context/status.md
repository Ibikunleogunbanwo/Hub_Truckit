# Status

_Update this file at the end of every piece of work._

Last updated: 2026-11-25 by the frontend agent.

## Done

- Hub structure, agent rules, and context docs.
- Backend architecture and data model (draft, `architecture/backend.md`).
- Hub CI checks, shared sample data, environments doc, project board guide.
- Resources page, Figma frame index, and agent onboarding guides.
- API contract outline v0.1.0 (`contract/openapi.yaml`): shared conventions only, endpoints still to be written.

## In progress

- Frontend foundation implemented and in [PR #1](https://github.com/Ibikunleogunbanwo/Frontend_Truckit/pull/1) review ([Hub issue #5](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues/5)): Next.js, shared Figma-derived tokens/components, responsive shells, showcase, generated API types, Prism and frontend CI. Local lint, typecheck, build, 6 unit/interaction tests and 6 desktop/mobile browser checks passed; axe scans found no violations after the mobile table focus fix. Product screens and live API wiring remain next.
- Backend skills handoff in the companion Hub PR: seven complete installed skill snapshots, integrity manifest and installation guide. Backend ownership remains with ade.

## Next

| Side | Item |
|---|---|
| Backend (ade writes, agent reviews) | Scaffold `Backend_Truckit`: FastAPI, Postgres, Docker Compose, auth, CI |
| Backend | Move requests, then quotes, then moves, then payments and notifications, then admin |
| Frontend | Review foundation PRs, then public and sign-up screens; define missing API contracts in Hub before wiring endpoints |

## Open questions

- Platform fee or commission on each quote? (affects payments design)
- Who pays out service centers: Stripe Connect payouts, or manual at first?
- Does a customer pay the full amount up front, or a deposit?
