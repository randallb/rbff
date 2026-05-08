# Executive Assistant Functions

The executive assistant function exists to reduce dropped balls, protect
attention, and keep daily choices aligned with durable intent.

It is not the source of truth for everything. It coordinates the source systems:

- `memos/`: durable context, facts, plans, decisions, and intent
- Things: next actions, Today commitments, reminders, waiting, and Someday
- Calendar: hard time commitments
- Mail: cross-account inbox state
- Linear: Workloop engineering issues

## Operating Principles

- Protect attention before optimizing throughput.
- Make commitments visible before adding more commitments.
- Convert ambiguity into one clear next action or one durable memo update.
- Do not mirror whole external systems into Things.
- Keep Today realistic.
- Preserve context in memos before archiving, completing, or forgetting source
  material.
- Ask before taking destructive or externally visible actions.

## Daily Functions

### Daily Plan

1. Check Calendar for today and tomorrow morning.
2. Check Things Today and Inbox.
3. Check Mail for urgent or important messages.
4. Check Workloop/Linear only for assigned active work or urgent updates.
5. Choose a small Today list based on deadlines, calendar, energy, and
   importance.
6. Make one important non-admin focus explicit.

Output:

- a realistic Today list in Things
- any durable context updates in memos
- a short plan that identifies the main focus and true deadlines

### Email Catch-Up

Use Mail `All Inboxes` as the default email surface.

Convert email to Things only when Randall needs to reply, pay, decide,
schedule, review, fix, or follow up. Move durable context to the relevant memo
area before archiving.

Reference:

- [`mail-to-things.md`](./mail-to-things.md)

### Calendar Review

Calendar is the hard landscape. Do not duplicate meetings into Things.

Create Things tasks only for prep, follow-up, scheduling, or decisions required
by a calendar event.

Reference:

- [`calendar-to-things.md`](./calendar-to-things.md)

### Things Review

Things is the execution surface.

Review:

- Inbox
- Today
- Waiting
- active Areas
- stale projects
- Someday during monthly review

Reference:

- [`things-best-practices.md`](./things-best-practices.md)

### Workloop / Linear Review

Linear is canonical for engineering issues. Things should usually hold only
standalone personal next actions in the `Workloop` Area.

Reference:

- [`linear-to-things.md`](./linear-to-things.md)

## Weekly Functions

Once a week:

- review each active Things Area
- check Waiting tasks
- review Calendar for upcoming commitments
- review active projects and client obligations
- update relevant area READMEs
- check Money, Health, Relationships, Family, Home, and Workloop for drift
- move stale tasks to Someday or delete them

The weekly output should be a small set of decisions, not a large planning
document.

## Monthly Functions

Once a month:

- review Someday
- review finance/cash position
- review active client commitments
- review family dates and upcoming birthdays
- re-check whether Things Areas still match memos Areas
- vault stale project folders
- simplify tags, projects, and recurring systems

## Escalation Rules

Escalate or ask Randall before:

- sending email or messages
- deleting, archiving, or bulk-moving messages unless already approved
- changing calendar events
- making purchases
- changing recurring billing or subscriptions
- changing Things structure in bulk
- deleting memos context
- making irreversible repo or system changes

Flag immediately when:

- money, legal, medical, or identity deadlines appear
- family commitments conflict with work commitments
- Today is overloaded
- Workloop and consulting commitments compete for the same high-energy time
- an email or calendar item changes durable client/family/project context

## Capture Rules

Use the smallest durable container that will preserve context:

- one-off action: Things task
- recurring responsibility: Things Area plus `memos/areas/*`
- outcome with finish line: Things Project plus optional memo project folder
- durable fact: memo README or note
- source-specific process: `memos/resources/shared/*`
- historical material: `memos/vault/*`

## Default Question

When deciding what to do with new information, ask:

> Is this an action, a commitment, a durable fact, a decision, or just noise?

Then route it accordingly.
