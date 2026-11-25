# Rules for agents working on Truckit

Two agents build Truckit in parallel:

- **Backend** `Backend_Truckit` (Python, FastAPI) is **written by ade**, who is learning FastAPI through it. The backend agent's job is to plan, review, correct and explain, not to write the application code. The backend agent must not commit app code to `Backend_Truckit` unless ade explicitly asks.
- **Frontend agent** owns `Frontend_Truckit` (Next.js, built from the Figma design).

This hub (`Hub_Truckit`) is the only place they coordinate.

## 1. Stay in your lane

- Never commit to the other side's repo. If you need something from the other side, open a change request (section 3).
- Never change `contract/openapi.yaml` without following section 4.

## 2. Before you start any work

1. Pull the latest `main` of this hub.
2. Read `context/status.md` and any open issues labelled for your side.
3. If the work touches the API, read the relevant part of `contract/openapi.yaml`.

## 3. Asking the other side for a change

Open a GitHub Issue in this repo using the **Change request** template.

Labels:

| Label | Meaning |
|---|---|
| `needs-backend` | The backend agent must act |
| `needs-frontend` | The frontend agent must act |
| `contract-change` | The API contract will change |
| `blocking` | The requester cannot continue until this is done |
| `question` | Needs an answer, not code |
| `decision-needed` | A human must decide; agents wait |

Lifecycle: open → the owning agent comments with a plan → work is done in the owner's repo → the owner links the PR and closes the issue.

## 4. Changing the API contract

The contract is **contract-first**: the contract changes before the code does.

1. Open (or reference) a `contract-change` issue.
2. Open a PR in this hub that edits `contract/openapi.yaml`, bumps `info.version`, and adds a changelog entry.
3. Breaking changes (removing or renaming fields or endpoints, changing types) need a `decision-needed` label and human approval.
4. Once merged, the backend implements it and the frontend regenerates its client or types.

Versioning for `info.version`: `MAJOR.MINOR.PATCH`. Use MAJOR for breaking changes, MINOR for new endpoints or fields, and PATCH for docs or examples.

## 5. After every piece of work (required)

In the same session where you finish the work, open a PR to this hub that:

- Adds an entry to `changelog/CHANGELOG.md` (newest at top).
- Updates `context/status.md`.
- Updates `architecture/` or `context/` if anything they describe changed.
- Adds a decision record in `decisions/` if you made an architecture choice.

The PR template has a checklist for this. Work is not "done" until the hub reflects it.

## 6. Checks on hub PRs

GitHub Actions (`.github/workflows/hub-checks.yml`) run on every PR to this hub:

- `contract/openapi.yaml` is linted with Spectral (rules in `.spectral.yaml`); errors fail the PR.
- `contract/examples/*.json` must be valid JSON.
- `changelog/CHANGELOG.md` must be updated.
- If `contract/openapi.yaml` changed, `info.version` must change too.

## 7. Secrets

Never commit secrets anywhere. See `context/environments.md`.

## 8. Decisions

Do not re-argue a decision that has an accepted record in `decisions/`. To change one, write a new record that supersedes it and get human approval.
