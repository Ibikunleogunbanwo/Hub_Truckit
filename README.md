# Hub_Truckit

The shared hub for the Truckit project. Both the backend agent ([Backend_Truckit](https://github.com/Ibikunleogunbanwo/Backend_Truckit)) and the frontend agent ([Frontend_Truckit](https://github.com/Ibikunleogunbanwo/Frontend_Truckit)) read from and write to this repo.

It holds three things:

1. **Context** – everything an agent (or a new person) needs to understand the product.
2. **The API contract** – `contract/openapi.yaml`, the single source of truth for how frontend and backend talk.
3. **Coordination** – change requests (GitHub Issues), decision records, and a changelog of work done.

## Layout

| Path | What lives there | Who updates it |
|---|---|---|
| `AGENTS.md` | Rules every agent follows. Read this first. | Human, rarely |
| `context/` | Product, roles, screens, glossary, current status | Any agent after finishing work |
| `architecture/` | Backend and frontend architecture, data model | Owner of that side |
| `contract/openapi.yaml` | The API contract | Backend, via a `contract-change` PR |
| `decisions/` | Architecture decision records (ADRs) | Whoever makes the decision |
| `changelog/` | One entry per merged piece of work, newest first | Every agent, every PR |
| `.github/` | Issue and PR templates | Human, rarely |

## Quick start for an agent

1. Read `AGENTS.md`.
2. Read `context/status.md` to see what is done and in progress.
3. Check open issues labelled for your side (`needs-backend` or `needs-frontend`).
4. Do the work in your own repo. Then update this hub (status, changelog, and contract if it changed).
