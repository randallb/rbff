# MT Standup - May 7, 2026

Source: Granola meeting notes, `MT Standup`, May 7, 2026 11:30 AM EDT.

## Workloop / Bolt Foundry

- Sotheby's client project:
  - Contact database cleanup for roughly 3,000 contacts.
  - Phase 1: export, clean with Codex, tag contacts, filter junk, re-upload.
  - Phase 2: ongoing maintenance through an email agent.
  - Future ongoing signal: weekly Monday morning reports and outreach recommendations.
  - Database support will be needed later, but not immediately.
- Email triage system:
  - Mail impact packager intake system is set up.
  - It formats incoming emails for the next bot and routes to an action bot by email type.
  - Testing plan uses Randall Bennett documents and a manual email folder to simulate incoming emails.
  - Future customer-facing address mentioned: kelly@workloopagents.com for first 10 customers.
  - Needs Linear documentation update for the triage test.
- Manual co-worker work system:
  - Current friction: only agents can perform tasks; humans cannot naturally claim/update work in the same model.
  - Proposed direction: expose the same GraphQL actions to people so humans and agents can act as co-workers.
  - Long-term vision: human-agent collaboration tree with a root manager delegating to people and agents.
  - Build incrementally when it unblocks specific needs.
- Personal AI assistant demo:
  - EA project in Codex syncs personal tasks to Things through AppleScript.
  - Current Linear integration uses the direct API.
  - Planned direction: route through app/connectors for Taxo and Bolt Foundry access.
  - Possible expansion: Proton Mail and Gmail accounts.

## Mentioned Next Steps

- Verify Linear update for completed WorkLoop API key provisioning.
- Urgent: email sending functionality for tomorrow's client visit.
- Update triage test documentation in Linear.

