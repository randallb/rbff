# Memos

Memos capture execution intent: time-bound guidance for projects, areas,
incidents, and initiatives. The root is company/life scope.

## Directory Map

- `INTENT.md` — life intent (company scope).
- `<area>/` — ongoing responsibilities and cadences (create area folders at
  the `memos/` root). Use an order key prefix (e.g., `0-1-spirituality`) when
  you want lexical priority sorting.
- `projects/` — time-bound efforts with defined end states.
- `resources/` — reusable runbooks, checklists, and templates.
- `posts/` — execution updates or announcements.
- `cross-company/` — shared resources and templates used across areas.

## Coordination Memo Types

All memo types share the same structure (Purpose, End State, Constraints,
Tradeoffs, Risk tolerance, Escalation conditions, Verification steps,
Activation / revalidation).

- `INTENT` — create new direction.
- `INCIDENT` — respond to a failure or near miss.
- `HARDEN` — reduce known risk or debt.
- `STABILIZE` — restore broken invariants.

## Rules

- Intent is authoritative at its scope.
- Execution details live in companion notes or README files.
- If intent is missing or conflicting, stop and escalate.
