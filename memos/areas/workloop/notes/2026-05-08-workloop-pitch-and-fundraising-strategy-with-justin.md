# WorkLoop Pitch And Fundraising Strategy With Justin - May 8, 2026

Source: Granola meeting notes,
`Work loop pitch and fundraising strategy with Justin`, May 8, 2026 1:40 PM EDT.

Granola meeting ID: `53b5d08d-22cf-4393-b16e-6ee768550be7`

Known participants:

- Randall Bennett from Boltfoundry <randall@boltfoundry.com>
- Justin

Raw capture:
[`../vault/notes/2026-05-08-workloop-pitch-and-fundraising-strategy-with-justin-raw.md`](../vault/notes/2026-05-08-workloop-pitch-and-fundraising-strategy-with-justin-raw.md)

## Use This Memo For

- Aligning the WorkLoop/Kelly fundraising story.
- Turning the pitch into a deck and demo plan.
- Deciding what must ship before the week of May 19, 2026.
- Keeping the raw transcript out of the working path while preserving it for
  evidence.

## Current Thesis

WorkLoop is the trusted way for people, agents, and services to work together.

The wedge is Kelly: an AI-enabled real estate assistant that helps realtors with
CRM follow-up, document/compliance work, contract prep, scheduling, and social
media coaching. Kelly is the customer-facing proof that a services business can
become AI-native.

The reveal is that Kelly is powered by WorkLoop: an operating system for
AI-enabled services businesses. Real estate is the first end market; insurance
and other services verticals can follow.

## Pitch Arc

1. Start with Kelly and real estate.
   - Present Kelly as the realtor-facing assistant / chief of staff.
   - Show current traction, customer signal, and the size of the real estate
     market.
   - Emphasize that realtors can use Kelly through email today, with WorkLoop
     operating behind the scenes.

2. Show the strongest Kelly workflow.
   - Realtor emails Kelly.
   - Email receptionist receives and classifies the request.
   - Document assistant handles upload / compliance / document work.
   - Dispatcher sends the completed response.
   - Realtor mostly experiences one assistant, while specialized coworkers
     coordinate underneath.

3. Reveal WorkLoop.
   - Kelly is not just a vertical agent; it is a proof point for the WorkLoop
     operating model.
   - WorkLoop coordinates people, agents, services, permissions, task
     requirements, results, and feedback.
   - The product can expand from one real estate assistant into teams of
     specialized coworkers and then into other services verticals.

4. Make the scale claim.
   - Every services business wants to become AI-enabled or AI-native.
   - WorkLoop is positioned as operating-system-level infrastructure for that
     transition.
   - The analogy is closer to Microsoft Office / Windows for AI-enabled work
     than to another single-purpose agent.

## Product Model

- Everyone is a coworker: people, agents, services, and eventually computers.
- Coworkers define tasks they can perform, requirements for those tasks, and
  results other coworkers can use.
- The main organizational model is an org chart.
- Founders are initial owners.
- Chief of Staff is the generalist agent interface:
  - less authority than owners
  - likely the coworker users chat with most often
  - handles unspecified work in the style of Claude Code / Codex
  - may hire or coordinate specialized coworkers
- Training an agent should mirror onboarding an employee:
  - do the job yourself
  - let the agent take over
  - watch it work
  - give feedback
  - increase autonomy as trust increases

## Differentiation

The main pitch should not start with communication theory, but the backup story
should be ready.

Differentiation should emphasize:

- collaboration across people, agents, and services
- security and host-layer access control
- communication substrates grounded in communication theory
- reliability through structured coworker coordination, requirements, results,
  and feedback

OpenAI / major-platform competition answer:

- If the thesis is right, major AI platforms may become acquirers or partners.
- This is investor-palatable, even if independence remains the preferred path.

Open source posture:

- Coworker runtime is likely open source at some point.
- Security-sensitive pieces can live in the open-source runtime.
- Higher-level product, app, and workflow layers can remain proprietary.

## Security And Architecture Notes

- WorkLoop is desktop-first: Mac today, all devices later.
- Device-responsive local software is framed as more trustworthy for autonomous
  work.
- Security foundations:
  - passkeys
  - cryptographic security
  - host-layer access controls
  - future peer-to-peer relationships through cryptographic invites
- Host plugins are the boundary between coworkers and external systems / MCPs.
- Coworkers should not receive direct unrestricted MCP access.
- Security and access controls live at the host layer, not only at the coworker
  layer.

## Future Direction

The longer-term product becomes a social / operating system for AI-mediated
collaboration.

- Users create cryptographic invites.
- Invites can travel through WhatsApp, Slack, email, or other channels.
- Accepting an invite creates a peering relationship.
- Data exchange follows that peering relationship.
- People, agents, services, and computers all participate as coworkers.

## Business Model

Current real estate pricing discussed: `$250/month` per realtor.

Possible revenue paths:

- first-party AI-enabled services business
- hosted collaboration platform
- forward-deployed engineering
- Palantir-style technology-enabled services
- vertical services products built on WorkLoop

The meeting did not settle the final business model. The working assumption is
that if WorkLoop becomes real infrastructure for AI-enabled services businesses,
multiple monetization paths remain viable.

## Fundraising Strategy

- Target 90-minute pitch sessions.
- Start with the 70-80 existing investor / prospect contacts.
- Sort prospects by expected value.
- Begin with high-expected-value and recent relevant contacts.
- Ignore dev angels for now.
- Use lower-stakes contacts for pitch practice.
- Use customer growth to create urgency:
  - investor should want in before valuation increases
  - the curve bending upward is the urgency mechanism
- Friendly pitch practice should happen early in the week.
- Real fundraise meetings should start the week of May 19, 2026.

Near-term target:

- By Tuesday, May 12, 2026: stack-rank fundraising prospects.

## Demo And Marketing Plan

Kelly demo:

- Prefer a crisp canned / recorded demo unless live browser automation is
  clearly reliable.
- A compelling flow may be:
  - send Kelly an email
  - receive a response
  - verify the completed result on the relevant site
- If browser visibility blocks fundraising, fix browser recording / visibility
  enough to support a clean demo.

Fundraise dogfood demo:

- Show WorkLoop running its own fundraise:
  - executive assistant pulls relevant Granola notes
  - updates CRM / spreadsheet / Google Drive status
  - manages scheduling and follow-up

Marketing:

- Create `getworkloop.com`.
- Reuse Boltfoundry materials where useful.
- Move visual direction toward blue / Depresso Blue / Vidpresso-inspired theme.
- Justin is shipping the blue theme.

## Decisions

- Lead the pitch with Kelly and real estate, not abstract WorkLoop
  infrastructure.
- Treat Kelly as both a real wedge and a proof point for WorkLoop.
- Keep communication substrate theory mostly in backup / differentiation
  material.
- Present real estate as the first end market, not the whole company.
- Preserve the WorkLoop reveal as the moment that turns a vertical AI services
  story into an infrastructure story.

## Open Questions

- What exact Kelly customer metrics belong in the deck?
- Which Kelly workflow is the fundraising demo?
- Is the demo a video, an email-driven live demo, or both?
- How much of the internal WorkLoop fundraise dogfood should appear in the main
  pitch?
- What parts of the coworker runtime should be open source, and when?
- How explicitly should Palantir-style forward-deployed engineering be
  referenced?
- What is the cleanest one-slide answer to OpenAI / platform competition?

## Action Items

- Randall: update / create `memos/` state to reflect the actual company
  structure.
- Randall: complete person coworker functionality.
- Randall: finish task lifecycle / task authority enough for person coworkers to
  be useful.
- Randall: stack-rank fundraising prospects by Tuesday, May 12, 2026.
- Randall / team: create the pitch deck from the Kelly-to-WorkLoop arc.
- Team: create `getworkloop.com`.
- Team: ship Depresso Blue / blue WorkLoop theme.
- Team: decide final Kelly demo format.
- Team: ensure browser task visibility / recording is sufficient if needed for
  the fundraising demo.
