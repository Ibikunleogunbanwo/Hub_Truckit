# Skills for agents

Skills are reusable instruction packs an agent loads for a task. This page lists the ones that are useful for Truckit. The hub does **not** store skill files: they are third-party content with their own origins and licences, and copies here would bury the context docs and drift out of date. Install skills from their source into your own agent's skills directory.

## Truckit-specific

| Skill | For | Where |
|---|---|---|
| `truckit-hub-sync` | Any agent: read the hub at the start of work, update changelog and status and open the hub PR at the end | Saved in ade's Claude skills (Claude agents load it automatically) |

## General skills worth having

These were found useful by the frontend agent (snapshot reviewed 2026-11-25). Their upstream origins were not verified, so check the source and licence before installing.

| Skill | Backend use |
|---|---|
| `api-design-principles` | Review resource naming, HTTP semantics, pagination, error shapes and proposed OpenAPI changes |
| `security-review` | Review auth, authorization, uploads, injection and secret handling (has Python references) |
| `stripe-best-practices` | Consult when payments work begins |
| `systematic-debugging` | Reproduce a failure and find its cause before suggesting a fix |
| `verification-before-completion` | Require real test or command output before claiming something works |
| `receiving-code-review` | Check review feedback before applying it |
| `multi-stage-dockerfile` | Review the FastAPI container's dev and production stages |

None of these replace the FastAPI documentation.

## Rules that win over any skill

- Repo rules (`AGENTS.md`) and ade's instructions take precedence over a skill's instructions.
- Backend: ade writes the application code. A skill never makes it OK for an agent to write or commit backend app code unless ade asks.
- Never commit a skill's scripts or templates into Truckit repos unless ade asks.
