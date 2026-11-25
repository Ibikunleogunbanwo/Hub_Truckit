# Changelog

Newest first. One entry per merged piece of work, in any repo.

Format:

```
## YYYY-MM-DD · <repo> · <short title>
- What changed
- Links: PR, issue
```

## 2026-11-25 · Hub_Truckit · Slim down shared skills
- Removed `shared-skills/` (about 12,000 lines of third-party skill files with unverified origins, including scripts). The hub keeps docs only.
- `onboarding/backend-skills.md` now lists the useful skills, what each is for, and the rules that override them, and points to `truckit-hub-sync` for Claude agents.
- Added the Inknut Antiqua heading font to the tokens table in `context/resources.md`.

## 2026-11-25 · Hub_Truckit · Close out approved frontend foundation
- Recorded merged frontend foundation and backend skill handoff, passing CI, and completed issue #5. Updated status and repository resources for the next milestone.
- Links: [Frontend PR #1](https://github.com/Ibikunleogunbanwo/Frontend_Truckit/pull/1), [Hub PR #6](https://github.com/Ibikunleogunbanwo/Hub_Truckit/pull/6), [issue #5](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues/5).

## 2026-11-25 · Frontend_Truckit / Hub_Truckit · Frontend foundation and backend skills handoff
- Added the Next.js App Router foundation with Tailwind, local fonts and exact Figma SVG assets, semantic tokens, shadcn-compatible Radix primitives, responsive shells and an interactive component showcase. Documented accessible contrast adjustments.
- Added an exact revisioned Hub contract snapshot, generated types, openapi-fetch client, loopback Prism mock and CI checks. Only `/health` is defined; no backend app or Hub contract edits.
- Local validation: lint, typecheck, production build, 6 unit/interaction tests and 6 desktop/mobile Playwright checks including axe passed. Runtime dependency audit is clean; development-only Prism upstream advisories are documented.
- Shared seven installed backend-relevant skill folders with hashes and installation/onboarding guidance, preserving ade's ownership of backend application code.
- Updated frontend architecture, environment variables, resources, status and decision 0005.
- Links: [Frontend PR #1](https://github.com/Ibikunleogunbanwo/Frontend_Truckit/pull/1), [Hub issue #5](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues/5).

## 2026-11-25 · Hub_Truckit · Hub CI, sample data, environments, project board
- Added `hub-checks` GitHub Actions: Spectral lint of the contract, JSON check of examples, required changelog entry, and a contract version bump check.
- Added shared sample data in `contract/examples/` (users, service centers with trucks and movers, a move request, a quote, a move, transactions) taken from the Figma.
- Added `context/environments.md` (dev, staging, prod, secrets rules, `.env.example` contents for both repos) and `context/project-board.md` (GitHub Project setup).

## 2026-11-25 · Hub_Truckit · Decision: Neon for hosted Postgres
- Added decision 0004 and updated the backend architecture and resources.

## 2026-11-25 · Hub_Truckit · Resources and agent onboarding
- Added `context/resources.md` (repos, GitHub collaboration links, Figma links and access rules, design tokens, services), `context/figma-frames.md` (every frame with its node ID and link), and `onboarding/` with a starter prompt and access checklist for the frontend and backend agents.

## 2026-11-25 · Hub_Truckit · Initial hub setup
- Added agent rules, context docs (product, roles, screens, glossary, status), backend architecture and data model, a frontend architecture stub, an API contract outline v0.1.0, decision records 0001 to 0003, and issue and PR templates.
