# 0001. One shared hub repo for context and coordination

- Status: Accepted
- Date: 2026-11-25
- Decided by: ade

## Context
Two agents build the backend and the frontend in separate repos. They need shared context and a way to request changes from each other and to track them.

## Decision
Use a single repo, `Hub_Truckit`, for context, the API contract, decision records, the changelog, and change requests (GitHub Issues with labels). This replaces separate orchestration and context repos.

## Consequences
There is one place to read and keep current. GitHub Issues give tracking and history for free. Every piece of work needs a small follow-up PR to the hub.
