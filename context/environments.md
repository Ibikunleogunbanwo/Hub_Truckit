# Environments and secrets

## Environments

| Environment | Purpose | Backend | Database | Frontend | Stripe |
|---|---|---|---|---|---|
| **dev** | Your machine | `uvicorn` in Docker Compose, `localhost:8000` | Postgres in Docker Compose | `next dev`, `localhost:3000` | Test mode, `stripe listen` forwards webhooks |
| **staging** | Shared testing before release; deployed from `main` | VPS (container) | Neon branch `staging` | Preview deploy | Test mode |
| **prod** | Real users; deployed from a release tag | VPS (container) | Neon branch `main` | Production deploy | Live mode |

Hosting for the frontend (e.g. Vercel or the same VPS) is not decided yet.

## Secrets rules

1. **Never commit secrets** to any repo, including this hub. That covers `.env` files, Stripe keys, database URLs with passwords, and JWT secrets.
2. Each repo commits a **`.env.example`** with every variable name and a safe placeholder. A real `.env` stays local and is git-ignored.
3. CI and deploy secrets live in **GitHub Secrets** (repo, Settings, Secrets and variables, Actions), with separate values per environment using GitHub Environments (`staging`, `production`).
4. If a secret is ever committed, rotate it immediately. Deleting the commit is not enough.

## Backend variables (`Backend_Truckit/.env.example`)

```dotenv
# App
APP_ENV=dev                      # dev | staging | prod
API_BASE_URL=http://localhost:8000
FRONTEND_URL=http://localhost:3000   # used for CORS and email links
LOG_LEVEL=info

# Database (Neon in staging/prod: use the pooled URL here and the direct URL for migrations)
DATABASE_URL=postgresql+asyncpg://truckit:truckit@localhost:5432/truckit
DATABASE_URL_DIRECT=postgresql+asyncpg://truckit:truckit@localhost:5432/truckit

# Auth
JWT_SECRET=change-me-to-a-long-random-string
JWT_ACCESS_TTL_MINUTES=15
JWT_REFRESH_TTL_DAYS=14

# Redis (background jobs)
REDIS_URL=redis://localhost:6379/0

# Stripe (test keys locally)
STRIPE_SECRET_KEY=sk_test_xxx
STRIPE_WEBHOOK_SECRET=whsec_xxx

# File storage (MinIO locally)
S3_ENDPOINT_URL=http://localhost:9000
S3_BUCKET=truckit-uploads
S3_ACCESS_KEY=minioadmin
S3_SECRET_KEY=minioadmin

# Email
EMAIL_BACKEND=console            # console | resend | ses
EMAIL_FROM=no-reply@truckit.example
```

## Frontend variables (`Frontend_Truckit/.env.example`)

```dotenv
NEXT_PUBLIC_API_BASE_URL=http://localhost:8000/api/v1
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_test_xxx
NEXT_PUBLIC_USE_MOCKS=true       # true = use the Prism mock server built from the contract
NEXT_PUBLIC_MOCK_API_BASE_URL=http://localhost:4010  # Prism, loopback only
```

Only `NEXT_PUBLIC_` variables reach the browser. Never put a secret key in one.

## Keeping this current

When a repo adds a variable, it updates its `.env.example` **and** this page in the same piece of work.
