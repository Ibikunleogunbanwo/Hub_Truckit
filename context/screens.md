# Screens (from Figma)

All frames are desktop web at 1440px wide. Each screen maps to API resources (see `architecture/backend.md`).

## Public

| Screen | Figma frame | API |
|---|---|---|
| Landing page | `landing page` | none (static) |
| FAQ, How it works, Drivers and movers | modals | none (static) |
| Search movers result | `Search movers result` | `POST /move-requests` (draft), `GET /trucks/types` |
| Request mover success | modals | none |

## Auth

| Screen | API |
|---|---|
| Sign in | `POST /auth/login` |
| Sign up (customer) | `POST /auth/register` |
| Sign up service center, steps 1 to 4 | `POST /auth/register` (role `service_center`), `POST /service-center/documents` |
| Sign up confirm | `POST /auth/verify-email` |

## Customer

| Screen | API |
|---|---|
| Dashboard (stats and upcoming moves) | `GET /me/dashboard`, `GET /moves?status=upcoming` |
| Request a move | `POST /move-requests` |
| Quotations / Quotes / Quotation details / Accept quote | `GET /move-requests/{id}/quotes`, `POST /quotes/{id}/accept` |
| Track move | `GET /moves/{id}` |
| Moving history | `GET /moves?status=completed` |
| Manage account, personal information | `GET/PATCH /me` |
| Security | `POST /auth/change-password` |
| Payment and billing: payment methods | `GET/POST/DELETE /payments/methods` |
| Payment and billing: transaction history | `GET /payments/transactions` |
| Help and support | `POST /support/tickets` |

## Service center

| Screen | API |
|---|---|
| Dashboard (available move requests) | `GET /service-center/move-requests` |
| Move details | `GET /move-requests/{id}` |
| Send a quote | `POST /move-requests/{id}/quotes` |
| Upcoming moves | `GET /service-center/moves?status=upcoming` |
| Move history | `GET /service-center/moves?status=completed` |
| Manage services (trucks and movers) | `GET/POST/PATCH/DELETE /service-center/trucks`, `.../movers` |
| Add truck / Add mover modals | as above |
| Earnings | `GET /service-center/earnings` |
| Manage account, personal info, security and privacy, help | same as customer |

## Admin

Not in the Figma yet. Scope comes from the brief: dashboard, user management (drivers and movers), move request management, reports and analytics, notification management, settings. Admin screens will be designed later; the backend builds the endpoints under `/admin/*`.
