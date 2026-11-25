# Frontend architecture

Repo: `Frontend_Truckit`. Owner: the frontend agent.

_The frontend agent fills this in. Starting points agreed so far:_

- Next.js (App Router), Tailwind CSS, shadcn/ui. These are already used in the earlier prototype.
- Design source: the Figma (see `context/product.md`). Tokens: primary `#14B8A6`, font Montserrat (14/24, weights 500 and 700).
- API access: a typed client generated from `contract/openapi.yaml` (e.g. `openapi-typescript` and `openapi-fetch`).
- Until an endpoint is live, mock it from the contract (e.g. Prism: `npx @stoplight/prism-cli mock contract/openapi.yaml`).
