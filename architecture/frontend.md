# Frontend architecture

Repo: `Frontend_Truckit`. Owner: the frontend agent.

## Foundation

- Next.js App Router, React, TypeScript, Tailwind CSS v4. `components.json` establishes shadcn conventions; local primitives compose Radix UI for dialogs and tabs and native HTML for form controls.
- `src/components/ui/`: buttons, labelled fields, selects, textarea, checkbox, dialog, tabs, card, table, badge, loading/error/empty states.
- `src/components/layout/`: shared brand, public shell and configurable customer/service center shell. Desktop header is 80px, sidebar 250px; mobile navigation collapses below 768px. Admin designs remain pending.
- The root page is a foundation showcase with sample data, not a completed product screen. No authentication, move submission or payment behavior is wired.
- Figma is authoritative for geometry and branding (see `context/figma-frames.md`). Primary is `#14B8A6`; Montserrat body is 14/24, weights 500/700, buttons use 600. Public headings/wordmark use Inknut Antiqua. Control corners are 5px, cards 10px. Fonts and original SVG assets are bundled locally.
- Accessible text tokens supplement brand colors: dark text on teal buttons, darker teal links and legible grey secondary text. See frontend `docs/design-tokens.md` and decision 0005.

## API boundary

- `contract/openapi.yaml` in Hub remains authoritative. The frontend keeps an exact snapshot with Hub revision and SHA-256 in `contract/source.json`; `npm run api:sync -- ../Hub_Truckit` copies a committed local Hub contract.
- `npm run api:generate` generates types with `openapi-typescript`; `src/lib/api/client.ts` creates an `openapi-fetch` client. CI rejects generated type drift.
- `npm run api:mock` runs Prism on loopback port 4010. `NEXT_PUBLIC_USE_MOCKS=true` selects it. Only `/health` is currently defined. Screen mappings in `context/screens.md` must receive approved contracts before API wiring; no invented endpoints or response shapes.
- Auth/session management is intentionally undecided until auth contracts are available. Prism stays development-only and consumes only the trusted Hub contract; its transitive audit advisories are recorded in the frontend PR.

## Quality checks

Frontend CI runs lint, TypeScript, unit/interaction tests, production build, contract generation checks and desktop/mobile Playwright tests with axe accessibility scans. No frontend deployment or hosting provider has been configured.
