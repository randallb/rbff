# Things Best Practices

Things is the execution surface. `memos/` is the memory surface.

Use Things to decide what to do next. Use `memos/` to remember why the work
matters, what constraints apply, what decisions were made, and what evidence or
context should survive after the task is done.

## Core Rules

- Capture tasks quickly, then clarify them later.
- Keep Things full of next actions, not broad responsibilities.
- Keep durable context out of Things unless it is directly needed to complete a
  task.
- Mirror important Things Areas and Projects in `memos/`, but do not mirror
  every small task.
- Prefer fewer active projects with clearer next actions.
- Use Someday deliberately; do not let it become a guilt backlog.

## Areas

Use Areas for ongoing responsibility.

Good Areas:

- Workloop
- Consulting
- Family
- Home
- Personal Ops
- Health
- Relationships
- Money
- Systems
- Creative / Play

Do not create an Area for something that has a finish line. Use a Project
instead.

Each serious Area should have a matching folder in `memos/areas/` when it needs
durable context.

## Projects

Use Things Projects for outcomes that require multiple steps and have a finish
line.

A project should have:

- a concrete outcome
- at least two next actions
- a clear owner, even if that owner is just Randall
- a review point if it might linger

Good project names:

- Launch KWR realtor demo
- Close May Taxo invoice
- Prepare Workloop private alpha walkthrough

Weak project names:

- KWR
- Taxo
- Workloop

For important projects, create a matching folder in `memos/projects/` with
`README.md` and `INTENT.md`.

## Tasks

Tasks should be physical or cognitive actions that can be started without
re-deciding the project.

Start task names with verbs:

- Draft
- Review
- Send
- Decide
- Schedule
- Test
- Update
- File
- Pay
- Ask

Good tasks:

- Draft Devin follow-up note from yesterday's call
- Review Taxo hours for May 1-7
- Decide whether Workloop alpha needs filesystem writeback before demo
- Ask Dan for next three realtor sales objections

Weak tasks:

- Devin
- Taxo invoice
- Think about Workloop
- Sales stuff

If a task starts with "think about," rewrite it as the decision or artifact that
thinking should produce.

## Today

Today should be a commitment list, not a possibility list.

Use Today for:

- tasks that must happen today
- tasks intentionally chosen for today's focus
- small admin that would otherwise keep nagging

Do not fill Today with everything that would be nice to do. If Today has more
than you can actually finish, choose again.

## Anytime

Anytime is the active inventory of available work.

Use Anytime for tasks that are ready to do but not committed to today. During
planning, pull from Anytime into Today based on calendar, energy, deadlines, and
strategic importance.

## Upcoming

Use Upcoming for date-bound work.

Use a start date when work should appear later. Use a deadline only when there
is a real consequence to missing the date.

Avoid fake deadlines. They train you to ignore real ones.

## Someday

Someday is for real ideas that are intentionally not active.

Use Someday when:

- the idea is valuable but not now
- a project is blocked by strategy, timing, or capacity
- you want to preserve the option without reviewing it daily

Review Someday monthly. Delete stale ideas aggressively.

## Waiting

Use a `waiting` tag for tasks blocked on someone else.

Waiting tasks should name the person and the expected return:

- Waiting: Dan to send realtor objections
- Waiting: Taxo to confirm May invoice cap
- Waiting: Justin to post KWR demo link

Review waiting tasks at least weekly.

## Tags

Keep tags sparse. Tags should change how you choose work.

Recommended tags:

- `urgent`
- `important`
- `deep-work`
- `admin`
- `waiting`
- `call`
- `client`
- `errand`
- `low-energy`
- `medium-energy`
- `high-energy`
- `5m`
- `15m`
- `30m`
- `60m`

Avoid tags that merely restate the Area or Project.

Avoid source/category tags by default:

- `email`
- `billing`
- `stripe`
- `newsletter`
- `family`
- `calendar`
- `sales`

Use Areas, Projects, and notes for context. Use tags only when they help filter
or choose the next action.

## Priority Tags

Use priority tags sparingly:

- `urgent`: time-sensitive or consequence-bearing soon
- `important`: strategically or personally meaningful, even if not urgent

Prefer Today, deadlines, and Areas for normal planning. `urgent` and
`important` are for triage and review, not a replacement for deciding what goes
on Today.

## Energy and Time Tags

Use energy tags when they help choose work based on actual capacity:

- `low-energy`: cleanup, easy replies, routine admin, small errands
- `medium-energy`: normal execution, planning, calls, straightforward writing
- `high-energy`: deep work, architecture, hard decisions, emotionally loaded
  conversations

Use rough duration tags when the task has an obvious size:

- `5m`
- `15m`
- `30m`
- `60m`

Do not force every task to have both. These tags should make choosing easier,
not create another clarification chore.

## Inbox

The Inbox is for capture, not storage.

Clarify Inbox items by asking:

- Is this actionable?
- Is this a single task or a project?
- What Area or Project owns it?
- Does it need a date?
- Does it need durable context in `memos/`?

Empty the Inbox daily when possible.

## Memos Linkage

Use this rule:

- Things task: what to do next
- Things project: the active checklist
- `memos/projects/*`: why it matters and what has happened
- `memos/areas/*`: ongoing responsibility and standards
- `memos/resources/*`: reusable references
- `memos/vault/*`: preserved but inactive context

For major Things projects, include the matching `memos/` path in the project
notes.

## External Source Links

When a task comes from another system, include the source URL in Things notes.

Examples:

- Gmail message links for email-derived tasks
- Linear issue links for Workloop engineering tasks
- official government links for personal admin tasks

Do not copy entire external systems into Things. Capture the next action and the
link needed to resume context.

Reference process:

- [`executive-assistant-functions.md`](./executive-assistant-functions.md)
- [`calendar-to-things.md`](./calendar-to-things.md)
- [`linear-to-things.md`](./linear-to-things.md)
- [`mail-to-things.md`](./mail-to-things.md)

## Review Rhythm

Daily:

- clear Things Inbox
- choose Today intentionally
- check calendar constraints
- identify one important non-admin task

Weekly:

- review active Areas
- review all Things Projects
- clean Waiting
- move stale tasks to Someday or delete them
- update relevant `memos/projects/*/README.md` status

Monthly:

- review Someday
- vault inactive project folders
- simplify Areas and tags
- rewrite unclear project intent

## Automation Guidance

When asking Codex to work with Things:

- say whether to create Areas, Projects, tasks, or just draft a plan
- name the target Area or Project when you know it
- ask for tasks in verb-first form
- ask Codex to preserve existing Things structure unless you explicitly want a
  cleanup
- ask Codex to add `memos/` links to important Things project notes when useful

Good requests:

- "Create a Things project under Consulting for the Taxo May invoice and add the
  next actions."
- "Turn this meeting note into Things tasks, but put durable context in
  `memos/projects/...`."
- "Review my Things Today list and help me cut it to a realistic plan."

Risky requests:

- "Put all of this in Things."
- "Make a project for every idea."
- "Add deadlines to everything."
