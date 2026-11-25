# Roles

| Role | Who | Key abilities |
|---|---|---|
| `customer` | Someone moving | Create move requests, view and accept quotes, pay, track moves, view history, manage account |
| `service_center` | A provider account: a driver, a mover, or a crew | Browse move requests, send quotes, manage trucks and movers, view upcoming moves, move history and earnings |
| `admin` | Truckit staff | Manage users, verify service centers, oversee move requests, reports, notifications, settings |

## Service center details

The Figma calls the provider side the **Service center**. One service center account:

- Has a **primary service**: `driver`, `mover`, or `both`.
- Registers **trucks** (type, licence plate, image).
- Registers **movers** (people on its crew: name, ID document).
- Signs up in four steps: personal details, then professional details (role, years of experience, vehicle make and model, plate, licence number and expiry, uploads of the driver's licence and a national ID or passport), then location (province, address, and whether to accept out-of-province requests), then password.
- Must be **verified by an admin** before it can quote (documents checked).

The original brief treats drivers and movers as separate apps. The design merges them into one service center account, and this project follows the design.
