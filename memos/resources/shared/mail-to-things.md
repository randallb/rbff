# Mail to Things

Mail is the preferred inbox source because it aggregates configured accounts in
one place.

Use Gmail directly only when Mail is missing the account, search is insufficient,
or a Gmail-specific action is required.

Use Proton Mail Desktop directly for Proton mailboxes that are not available in
Mail. It is provisioned by nix-darwin through the Homebrew cask `proton-mail`.

## Mapping

- Mail: source of truth for inbox state across accounts.
- Proton Mail Desktop: source surface for Proton-specific inbox state.
- Things: next actions, reminders, and waiting-for follow-up.
- `memos/`: durable context from email that should survive archiving.

## Accounts

Observed in Mail on May 7, 2026:

- `iCloud`
- `Google`
- `randall@boltfoundry.com`

Mail's `All Inboxes` view should be the default catch-up surface.

## Catch-Up Flow

During email catch-up:

1. Start in Mail `All Inboxes`.
2. Scan newest unread messages across all accounts.
3. Convert only real next actions into Things.
4. Put source/account context and useful search terms in the Things notes.
5. Move durable context into the relevant memo area or project.
6. Archive only after the action/context has been captured.

## What Becomes a Things Task

Create a task when an email requires Randall to:

- reply
- pay
- decide
- schedule
- review before a meeting
- fix an account/billing/security issue
- follow up after waiting for someone else

Do not create a task for newsletters, receipts, FYIs, or notifications unless
they change what Randall should do.

## What Goes to Memos

Move durable context into memos when email changes:

- client status
- project scope
- family logistics
- birthdays or important dates
- account/vendor setup
- operating rules
- decisions worth remembering

## Current Rule

For normal catch-up, use local Mail first. Gmail remains available as a fallback
or for Gmail-specific links/actions.
