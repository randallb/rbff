# Triage Email

Use this runbook to get Mail to inbox zero while turning relevant email into a
small set of clear actions, durable context updates, and escalations.

Mail is the default email surface. Use Gmail or another mail app only when Mail
is missing an account, search is insufficient, or a provider-specific action is
required.

## Goal

By the end of triage, Randall should know:

- what needs attention today
- what can safely wait
- what became a Things task
- what durable context moved into `memos/`
- what needs Randall's explicit decision before action

Aim for inbox zero. Every message should be routed out of the inbox once its
action, durable context, or irrelevance is clear.

## Inputs

- Mail `All Inboxes`
- Things Today, Inbox, and relevant Areas
- Calendar today and tomorrow morning when email implies scheduling or prep
- Relevant `memos/areas/*` or `memos/projects/*` when email changes durable
  context

References:

- [`../shared/mail-to-things.md`](../shared/mail-to-things.md)
- [`../shared/executive-assistant-functions.md`](../shared/executive-assistant-functions.md)
- [`../shared/things-best-practices.md`](../shared/things-best-practices.md)

## Triage Pass

1. Start in Mail `All Inboxes`.
2. Scan newest unread and flagged messages first.
3. Identify real signals:
   - direct requests from people
   - money, tax, legal, medical, security, or identity issues
   - client/project status changes
   - calendar, travel, or family logistics
   - deadlines or expiring offers that Randall might actually care about
   - notifications that change an active work queue
4. Ignore or defer noise:
   - newsletters
   - marketing
   - receipts with no required action
   - FYIs
   - automated notifications that do not change what Randall should do
5. For each signal, decide the route:
   - Things task
   - memo update
   - calendar check
   - reply needed
   - no action
6. Once routed, clear the message from the inbox by archiving, deleting, or
   moving it only when that action is approved and safe.

## Create Things Tasks Only For Actions

Create a Things task when an email is relevant and urgent or important,
especially when Randall needs to:

- reply
- pay
- decide
- schedule
- review before a meeting
- fix an account, billing, tax, legal, medical, security, or identity issue
- follow up after waiting on someone else

Do not create a Things task for relevant-but-non-actionable email. Capture the
durable context in `memos/`, then clear the message from the inbox.

Task names should start with a verb and include the person, account, or outcome:

- Reply to Harper about Bolt Foundry feature availability
- Review Linear update on Mark MVP risk
- Pay Fifteenth tax filing invoice
- Ask Adriana about WorkBetter office deposit

Task notes should include:

- source mailbox or sender
- subject line or useful search terms
- deadline or consequence, if any
- relevant link or thread clue, if visible
- whether Randall must approve before sending, paying, deleting, or scheduling

## Memo Capture

Update `memos/` when an email changes durable context:

- client status
- project scope or requirements
- relationship history
- family logistics
- financial, vendor, or account setup
- policy, operating rule, or recurring process
- decision worth remembering

Use the smallest useful location:

- `memos/areas/*/notes/` for area context
- `memos/projects/*` for project-specific context
- `memos/resources/shared/*` for reusable source-system guidance
- `memos/resources/runbooks/*` for repeatable procedures
- `memos/vault/*` for historical material

Do not copy full emails into memos unless the exact wording matters. Prefer a
short summary, source, date, sender, and why it matters.

## Priority Rules

Treat as urgent when there is a real deadline, consequence, meeting dependency,
or person waiting on Randall.

Treat as important when it affects:

- active work commitments
- client trust
- family obligations
- money, taxes, legal, medical, security, or identity
- strategic relationships
- today's calendar

Urgent and important messages should become Things tasks, usually in Today
unless the calendar already makes action impossible.

Important but not urgent messages should become Things tasks in Anytime or a
relevant project when they require action. If they only change context, update
`memos/` instead.

## Escalation

Ask Randall before:

- sending or drafting a reply that will be sent
- archiving, deleting, bulk-moving, or marking large sets of messages
- paying invoices or changing billing
- accepting, declining, creating, or moving calendar events
- unsubscribing or changing notification settings
- transmitting sensitive personal, financial, legal, medical, or account data

Flag immediately if email reveals:

- a missed deadline
- a money/tax/legal/medical/security issue
- a family/work calendar conflict
- an overloaded Today list
- a dropped-ball risk with a client, teammate, or important relationship

## Output

When reporting back, keep it short:

- top signals
- tasks created or recommended
- memo updates made or recommended
- inbox zero status
- decisions Randall needs to make
- anything risky or time-sensitive

Example:

> Email triage found three real signals: Harper needs availability for a Bolt
> Foundry feature discussion, Linear says Mark MVP is at risk, and Mercury shows
> a Stripe deposit. I created two Things tasks, captured the Linear context in
> the Taxo project notes, and cleared the inbox.
