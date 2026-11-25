# 0005. Frontend foundation and accessible design tokens

- Status: Accepted
- Date: 2026-11-25
- Decided by: ade (foundation scope approved in chat)

## Decision

Use the agreed Next.js App Router, TypeScript, Tailwind and shadcn/ui conventions. Keep shared primitives local, composing Radix UI for dialog focus management and tabs. Native form controls provide browser keyboard interaction. Bundle fonts and Figma SVG assets locally.

Preserve Figma's teal `#14B8A6`, typography, control/card radii and desktop shell dimensions. Supplement branding with accessible semantic text colors: dark labels on teal, darker teal links, and readable grey secondary text. Document these deliberate contrast adjustments and mobile adaptations in frontend `docs/design-tokens.md`.

Keep a revisioned exact copy of the Hub contract in Frontend_Truckit, generate types and use openapi-fetch. Prism mocks only existing operations and listens on loopback. Future auth/move API contracts must be defined in Hub before wiring screens.

## Consequences

Customer and service center screens can reuse shared controls, feedback states and responsive shells. The component showcase allows review before product screens. Exact screenshot colors are adjusted where small text would fail contrast. Auth, payments, admin designs and hosting remain outside this decision. No backend app code changes are included.
