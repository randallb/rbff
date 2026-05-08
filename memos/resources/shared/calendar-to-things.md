# Calendar to Things

Calendar is the source of truth for time commitments. Things is the source of
truth for next actions. `memos/` is the source of truth for durable context.

Do not mirror every calendar event into Things. Pull only the actions that need
to happen before or after an event.

## Current Calendar Sources

Observed in macOS Calendar on May 7, 2026:

- `randall@taxo.ai`: Taxo/client calendar.
- `Bolt Foundry Office Hours`: Bolt Foundry/Workloop office hours.
- `Dan`, `Justin`, `Josh`, `George`: Bolt Foundry/Workloop teammate calendars.
- `Family`, `Kids school`, `Birthdays`: family calendar context.
- `RB`, `Randall`, `Epic Bennett`, `HubSpot tasks`, `Scheduled Reminders`:
  personal or operational calendar sources.

## Mapping

- Taxo calendar events belong to the `Consulting` Things Area unless they are
  pure time blocks.
- Bolt Foundry/Workloop calendar events belong to the `Workloop` Things Area
  unless they are already represented in Linear.
- Family and school calendar events belong to `Family` or `Home` depending on
  the next action.
- Personal appointments belong to `Personal Ops` or `Health`.

## Daily Planning

During daily planning:

1. Read today's calendar and tomorrow morning's calendar.
2. Identify immovable meetings, pickups, appointments, and deadlines.
3. Create Things tasks only for required prep, follow-up, or decisions.
4. Schedule only those Things tasks that must happen today.
5. Add durable meeting notes, dates, preferences, and decisions to `memos/`.

Examples:

- Calendar event: `Taxo / Kauna product discovery`
- Things task: `Prep Taxo Kauna discovery questions`
- Memos context: Taxo client notes, discovery findings, durable decisions

## What Goes Where

Calendar:

- meetings
- appointments
- school events
- hard time blocks
- birthdays and anniversaries as date sources

Things:

- prep tasks
- follow-up tasks
- reminders to schedule, reply, buy, decide, or send
- birthday check-ins when they should prompt action

Memos:

- birthdays and durable family facts
- meeting notes worth preserving
- client context
- recurring scheduling rules
- planning decisions
- links to docs and source systems

## Review Rules

- If an event requires no action, leave it only in Calendar.
- If an event requires action, create the smallest Things task that moves it.
- If an event changes durable understanding, update the relevant memo.
- If a recurring calendar category becomes important, add it to the relevant
  Area README.
