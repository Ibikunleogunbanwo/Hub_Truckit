# 0003. Contract-first API

- Status: Accepted
- Date: 2026-11-25
- Decided by: ade

## Context
The frontend and backend are built in parallel by different agents.

## Decision
`contract/openapi.yaml` in this hub is the source of truth. It changes before the code does (see AGENTS.md, section 4). The frontend mocks from it until endpoints are live. The backend's CI compares FastAPI's generated schema with the contract.

## Consequences
Neither side blocks the other. Changes to the API need a small hub PR first.
