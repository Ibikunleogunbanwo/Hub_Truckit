# Backend architecture

Repo: `Backend_Truckit`. Written by ade; the backend agent reviews and guides.

This document is the target design. It is a guide for writing the code, not generated code.

## Stack

| Concern | Choice |
|---|---|
| Language | Python 3.14 |
| Framework | FastAPI |
| Validation and schemas | Pydantic v2 |
| Database | PostgreSQL (Neon in staging and production, Docker locally; see decision 0004) |
| ORM and migrations | SQLAlchemy 2.0 (async) and Alembic |
| Auth | JWT access token (15 min) and refresh token (14 days, rotated, stored hashed); passwords hashed with argon2 |
| Payments | Stripe (PaymentIntents for customers; Stripe Connect for service center payouts, see open questions) |
| Background jobs | ARQ on Redis (emails, notifications, Stripe webhook follow-ups) |
| File storage | S3-compatible object storage (licence, ID, truck images); presigned upload URLs |
| Email | Provider behind an interface (e.g. Resend or SES), console backend in dev |
| Dependencies | pip with pinned `requirements.txt` (runtime) and `requirements-dev.txt` (tests and lint) |
| Tests | pytest, httpx AsyncClient, a Postgres test database |
| Lint and types | ruff, mypy |
| Local dev | Docker Compose: api, postgres, redis, minio, stripe-cli |
| CI | GitHub Actions: lint, type check, tests, and a contract drift check |

## Layout

```
Backend_Truckit/
  app/
    main.py                # app factory, routers, middleware
    core/                  # config, security, db session, errors, logging
    modules/
      auth/                # router.py, schemas.py, service.py, models.py
      users/
      service_centers/     # profile, documents, trucks, movers, verification
      move_requests/       # requests, items, addresses, access, requirements
      quotes/
      moves/               # confirmed jobs and status changes
      payments/            # Stripe intents, methods, transactions, webhooks
      notifications/
      support/
      admin/
    workers/               # ARQ tasks
  migrations/              # Alembic
  tests/
  docker-compose.yml
  pyproject.toml
```

Each module keeps its own router, schemas, service (business logic), and models. Routers stay thin and services hold the rules.

## API conventions

- Base path `/api/v1`. JSON only. snake_case fields.
- Auth: `Authorization: Bearer <access_token>`.
- Lists are paginated with `?page=&page_size=` and return `{ items, total, page, page_size }`.
- Errors use one shape: `{ "error": { "code": "QUOTE_ALREADY_ACCEPTED", "message": "...", "details": {} } }`.
- Money is stored and sent as an **integer number of cents** plus `currency: "CAD"`.
- Times are ISO 8601 in UTC; the frontend formats them for display.
- IDs are UUIDs. Human-friendly references (e.g. `MOV-7F3K2Q`, `TXN-...`) are separate fields.
- The OpenAPI document FastAPI generates must match `contract/openapi.yaml` in Hub_Truckit (CI checks this).

## Data model

```
users ─┬─ customer_profiles
       ├─ service_centers ─┬─ trucks
       │                   ├─ crew_movers
       │                   └─ documents
       └─ refresh_tokens

move_requests ─┬─ move_request_items
  (customer)   ├─ addresses (pickup, dropoff)
               ├─ quotes ── (service_center)
               └─ move (1:1 once a quote is accepted) ─┬─ move_status_events
                                                       └─ payments ── transactions
notifications (user)   support_tickets (user)   payment_methods (user)
```

### Tables

**users**: id, email (unique), phone, first_name, last_name, gender (nullable), password_hash, role (`customer` | `service_center` | `admin`), email_verified_at, is_active, created_at, updated_at.

**customer_profiles**: user_id (PK and FK), default_address_id, stripe_customer_id.

**service_centers**: id, user_id (unique), primary_service (`driver` | `mover` | `both`), years_experience, province, address_id, accepts_out_of_province (bool), verification_status (`pending` | `verified` | `rejected`), verified_at, rating_avg, moves_completed, stripe_account_id.

**documents**: id, service_center_id, kind (`drivers_licence` | `national_id` | `passport` | `mover_id`), storage_key, licence_number, expires_on, status, crew_mover_id (nullable).

**trucks**: id, service_center_id, type (`cargo_van` | `box_truck` | `standard_moving_truck` | ...), make, model, plate_number, image_key, moves_count, last_move_at, is_active.

**crew_movers**: id, service_center_id, full_name, id_document_id, moves_count, last_move_at, is_active.

**addresses**: id, line1, unit, city, province, postal_code, country (default `CA`), lat (numeric), lng (numeric), formatted.

**move_requests**: id, reference, customer_id, status (`draft` | `open` | `quoted` | `accepted` | `cancelled` | `expired`), pickup_address_id, dropoff_address_id, move_date, window_start, window_end, distance_km, building_type_pickup, building_access_pickup, building_type_dropoff, building_access_dropoff, parking_notes, need_driver, need_load_help, need_unload_help, truck_type, movers_needed, equipment_notes, contact_name, contact_phone, contact_email, agreed_to_terms_at, created_at.

**move_request_items**: id, move_request_id, category, item, quantity, special_handling (bool), notes.

**quotes**: id, move_request_id, service_center_id, truck_id (nullable), amount_cents, currency, message, status (`sent` | `withdrawn` | `accepted` | `rejected` | `expired`), created_at. Unique (move_request_id, service_center_id) while the quote is active.

**moves**: id, reference, move_request_id (unique), quote_id (unique), customer_id, service_center_id, status (`pending_payment` | `confirmed` | `en_route` | `loading` | `in_transit` | `unloading` | `completed` | `cancelled`), scheduled_at, completed_at.

**move_status_events**: id, move_id, status, note, actor_user_id, created_at. This is the audit trail behind Track move.

**payments**: id, move_id, stripe_payment_intent_id, amount_cents, platform_fee_cents, currency, status (`requires_payment` | `succeeded` | `failed` | `refunded`).

**transactions**: id, reference (`TXN-...`), user_id, move_id, kind (`charge` | `payout` | `refund`), amount_cents, status, occurred_at. This feeds Transaction history and Earnings.

**payment_methods**: id, user_id, stripe_payment_method_id, brand, last4, exp_month, exp_year, is_default.

**notifications**: id, user_id, type, title, body, data (jsonb), read_at, created_at.

**support_tickets**: id, user_id, subject, body, status, created_at.

### Key rules

- Only `verified` service centers can see open requests and quote.
- A service center sees requests in its province, or all provinces if `accepts_out_of_province` is set.
- Accepting a quote, in one transaction: mark the quote `accepted`, reject the other quotes, set the request to `accepted`, and create the move with status `pending_payment`. A Stripe PaymentIntent is created next.
- The Stripe webhook `payment_intent.succeeded` moves the move to `confirmed` and notifies both sides.
- Only the assigned service center can advance move status, and only forward (except to `cancelled`).

## What came from the old Laravel repo

`truckit_backend` (2025, abandoned) only had migrations. Its move request split (addresses with lat and lng, items, access details, requirements, contact) was the starting point for `move_requests` above. It was flattened where the relationships were one-to-one, and `need_load_help`, the customer link, and numeric coordinates were added.
