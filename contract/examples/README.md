# Shared sample data

Realistic sample records taken from the Figma screens. Both sides use the same data:

- **Frontend:** mock responses and Storybook or demo states.
- **Backend:** seed data for local development and test fixtures.

Rules:

- Field names and shapes follow `contract/openapi.yaml` and `architecture/backend.md` (snake_case, money in cents, UTC ISO 8601 times, UUID ids).
- When a contract change alters a shape, update the matching file here in the same PR.
- Never put real personal data here.
