# Resources and access

Everything an agent or collaborator needs to reach. Keep it current.

## GitHub repositories

| Repo | Purpose | Owner | Status |
|---|---|---|---|
| [Hub_Truckit](https://github.com/Ibikunleogunbanwo/Hub_Truckit) | Shared context, API contract, decisions, changelog, change requests | Shared | Live |
| [Backend_Truckit](https://github.com/Ibikunleogunbanwo/Backend_Truckit) | FastAPI backend | ade writes it; the backend agent reviews and guides | Empty (README only) |
| [Frontend_Truckit](https://github.com/Ibikunleogunbanwo/Frontend_Truckit) | Next.js web app (customer, service center, admin) | Frontend agent | Foundation in review; product screens next |

Reference only. Do not build on these:

| Repo | What it is |
|---|---|
| `truckit_backend` (private) | Abandoned 2025 Laravel attempt. Only migrations; its move request tables informed the new data model. |
| `truckit` | Earlier Next.js prototype (customer pages, mock data). Its stack (Next.js, Tailwind, shadcn/ui) carries over; its pages do not need to be kept. |

## Collaboration on GitHub

- **Change requests:** [open an issue](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues/new?template=change_request.md) in Hub_Truckit with the Change request template.
- **Work for the backend:** [issues labelled `needs-backend`](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues?q=is%3Aopen+label%3Aneeds-backend)
- **Work for the frontend:** [issues labelled `needs-frontend`](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues?q=is%3Aopen+label%3Aneeds-frontend)
- **Contract changes:** [issues and PRs labelled `contract-change`](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues?q=label%3Acontract-change)
- **Waiting on a human:** [issues labelled `decision-needed`](https://github.com/Ibikunleogunbanwo/Hub_Truckit/issues?q=is%3Aopen+label%3Adecision-needed)

- **Project board:** see [`project-board.md`](project-board.md) for setup and use.
- **Sample data:** [`contract/examples/`](../contract/examples/) is shared by mocks and seeds.
- **Environments and secrets:** [`environments.md`](environments.md).

Branch names: `feat/<short-name>`, `fix/<short-name>`, `docs/<short-name>`, `contract/<short-name>`. Every PR in any repo should link its issue (`Closes Hub_Truckit#NN` across repos).

## Figma

| What | Link |
|---|---|
| Working copy (use this) | https://www.figma.com/design/0Ghyj0eNlOZOuM3YiIgMmU/TruckIT--Copy- |
| File key | `0Ghyj0eNlOZOuM3YiIgMmU` |
| Frame index with node IDs | [`context/figma-frames.md`](figma-frames.md) |
| Original (owned by Tobi, view-only for ade) | https://www.figma.com/design/75QBEKsdixUlP1dGb7OOF2/TruckIT |

The Figma connector can only read files the connected account can **edit**. ade's copy works; the original does not. If the design changes in the original, ade re-duplicates it and updates the links here.

Design tokens read from Figma:

| Token | Value |
|---|---|
| `primaryColor` | `#14B8A6` |
| `regularText` | Montserrat Medium 14px, line height 24px |
| `boldRegularText` | Montserrat Bold 14px, line height 24px |
| Headings and wordmark (public pages) | Inknut Antiqua (per frontend decision 0005) |

## Services (planned)

| Service | Used for | Status |
|---|---|---|
| Stripe | Customer payments, service center payouts | Not set up. Use test mode keys locally. Keys never go in any repo. |
| PostgreSQL (Neon) | Main database | Neon for staging and production (decision 0004), Docker Compose locally. Not set up yet. |
| Redis | Background jobs | Local via Docker Compose |
| Object storage (S3-compatible) | Licence, ID and truck images | Local via MinIO |

## Original documents (held by ade)

- `Project Brief truckit.docx`
- `Functional Requirements and Non functional Requirement.docx`
- `New Mover App features.docx`
