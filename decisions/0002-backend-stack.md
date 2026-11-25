# 0002. Backend stack

- Status: Accepted
- Date: 2026-11-25
- Decided by: ade

## Decision
Python FastAPI, PostgreSQL, SQLAlchemy 2 and Alembic, Pydantic v2, JWT auth, and Stripe for payments. The admin panel is in scope for the backend. Details are in `architecture/backend.md`.

ade writes the backend code to learn FastAPI. The backend agent reviews and guides.

## Consequences
Python and Pydantic give typed request and response models, and FastAPI generates OpenAPI automatically, which makes the contract drift check straightforward.
