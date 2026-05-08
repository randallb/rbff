# Memos

This is Randall's durable operating memory.

Use this folder as the source of truth for life intent, area intent, durable
facts, plans, docs, decisions, client context, project memory, and operating
rules. Things is the execution layer: ephemeral next actions live there, while
durable context lives here.

## Directory Map

- `INTENT.md` — root life intent.
- `areas/` — ongoing responsibilities and life domains.
- `projects/` — cross-area active projects and initiatives when they do not
  clearly belong inside one area.
- `posts/` — dated updates, reflections, status notes, and decisions.
- `resources/` — reusable runbooks, integration notes, templates, and shared
  references.
- `coworkers/` — people, agents, collaborators, and working agreements.
- `feedback/` — open feedback and review notes.
- `policies/` — active personal operating doctrine and recurring rules.
- `vault/` — preserved historical material that should not read as active.

## Area Shape

Each serious area can have:

- `INTENT.md` — enduring doctrine for that life area.
- `README.md` — current durable facts, context, standards, and operating notes.
- `notes/` — logs and reference material.
- `projects/` — area-scoped time-bound efforts with defined end states.

Intent is authoritative at its scope. Execution details live in companion notes
or README files. If intent is missing or conflicting, stop and clarify.

## Things Mapping

- Things Areas should mirror active `memos/areas/*` domains.
- Things Projects should mirror meaningful active project folders when the
  project needs durable context.
- Things tasks should be concrete next actions, not broad intentions.
- Ephemeral execution lives in Things: next actions, reminders, Today choices,
  and someday options.
- Durable context lives in memos: birthdays, plans, preferences, links, docs,
  standards, history, and decisions.
- Calendar stays the source of truth for hard time commitments.
- Mail, Gmail, Linear, and Calendar feed Things selectively: import the next
  action, preserve useful source context, and move durable context here.

## Coordination Memo Types

All formal memo types should use a clear structure: Purpose, End State,
Constraints, Tradeoffs, Risk tolerance, Escalation conditions, Verification
steps, and Activation / revalidation.

- `INTENT` — create or clarify direction.
- `INCIDENT` — respond to a failure or near miss.
- `HARDEN` — reduce known risk or debt.
- `STABILIZE` — restore broken invariants.

## Root Files

- [`INTENT.md`](./INTENT.md)
- [`README.md`](./README.md)
