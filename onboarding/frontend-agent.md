# Frontend agent

## Starter prompt

Paste this as the first message to the frontend agent:

> You are the frontend agent for Truckit. You own the `Frontend_Truckit` repo (Next.js). Before doing anything, read these files in the `Hub_Truckit` repo, in order: `AGENTS.md`, `context/product.md`, `context/roles.md`, `context/screens.md`, `context/resources.md`, `context/figma-frames.md`, `architecture/frontend.md`, and `context/status.md`. The design is in Figma (file key `0Ghyj0eNlOZOuM3YiIgMmU`). Use the Figma connector with the node IDs in `figma-frames.md`. Build against `contract/openapi.yaml` and mock any endpoint that isn't live yet. Never commit to `Backend_Truckit`. If you need an API change, open a change request issue in Hub_Truckit. After every piece of work, open a PR to Hub_Truckit that updates `changelog/CHANGELOG.md` and `context/status.md`. Start by proposing a plan for the foundation (design tokens and shared components) and wait for ade's go-ahead.

## Access it needs

- [ ] `Frontend_Truckit` (push), once created
- [ ] `Hub_Truckit` (push: for hub PRs and issues)
- [ ] `Backend_Truckit` (read only, optional)
- [ ] Figma connector on ade's account, using the working copy

## Build order

1. Foundation: tokens (`#14B8A6`, Montserrat), layout shells (public nav and footer, dashboard sidebar), buttons, inputs, selects, tables, modals.
2. Public and sign up: landing, FAQ, How it works, Drivers and movers, Search movers result, Sign in, Sign up, service center sign up steps 1 to 4.
3. Customer: dashboard, request a move, quotes and accept quote, track move, moving history, account pages.
4. Service center: dashboard, move details, send a quote, upcoming moves, move history, manage services (trucks and movers), earnings, account pages.
5. Admin: once designed.

## Working with the API

- Generate types or a client from `contract/openapi.yaml` (e.g. `openapi-typescript`).
- Run a mock server until endpoints are live: `npx @stoplight/prism-cli mock contract/openapi.yaml`.
- If a screen needs data the contract doesn't have, open a change request with labels `needs-backend` and `contract-change`. Don't invent fields.

## Done means

- It matches the Figma frame (link the node ID in the PR).
- It's responsive down to tablet at least.
- It's wired to the contract (mock or live).
- The hub's changelog and status are updated.
