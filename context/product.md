# Product

**Truckit** is a Canadian marketplace for local and long-distance moves. Customers post a move request. Service centers (truck drivers and moving crews) send competing quotes. The customer accepts one, pays through the app, and tracks the move.

- Market: Canada. Currency: CAD. Addresses use provinces.
- Platform: responsive web app (desktop-first designs at 1440px). The admin panel is also web.
- Payments: Stripe.

## Core flow

1. A **customer** fills in a move request: pickup and drop-off, date and time window, items, building access, whether they need a driver and/or movers (for loading and unloading), truck type, equipment, and a contact person.
2. The request is shown to **service centers** in the same province (or in any province, if they opted in).
3. Service centers **send a quote** (a price in CAD). This is competitive bidding.
4. The customer compares quotes (truck type, distance, the provider's number of past moves, price) and **accepts one**.
5. The customer **pays** with Stripe. The move becomes confirmed.
6. The move progresses through statuses. The customer can **track** it, and it ends up in **moving history**. The service center sees it in its **move history** and **earnings**.

## Out of scope for now

- A native mobile app (the original brief mentions mobile; the current design is web).
- Live GPS tracking (status-based tracking first).
- Live chat (help and support pages first).

## Sources

- Figma (ade's readable copy): https://www.figma.com/design/0Ghyj0eNlOZOuM3YiIgMmU/TruckIT--Copy-
- Original brief and requirements: `Project Brief truckit.docx`, `Functional Requirements and Non functional Requirement.docx` (held by ade).
- Old Laravel attempt (abandoned, reference only): `truckit_backend`. Only the move request tables were useful.
