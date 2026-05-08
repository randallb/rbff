# Linear to Things

Linear is the source of truth for Workloop engineering issues. Things is the
source of truth for what Randall is choosing to do next.

Do not mirror all Linear issues into Things. Pull only the issues that affect
today, this week, or Randall's personal follow-through.

## Default Mapping

- Linear issue: canonical engineering ticket, discussion, status, and team
  workflow.
- Things Area: `Workloop`.
- Things task: the next concrete action Randall can personally take.
- Things Project: only when the work has a real finish line outside Linear and
  needs multiple personal steps.
- `memos/`: durable context, intent, decisions, and daily planning process.

## Import Rules

Create a Things task from Linear when:

- the issue is assigned to Randall and is active or newly important
- the issue creates a real next action outside Linear
- the issue must be part of today's commitment list
- the issue is important enough that Randall should not rely on Linear alone to
  remember it

Do not create a Things task when:

- the issue is merely in the backlog
- the issue is already represented by a clearer Things project
- the next action is only "look at Linear"
- another person owns the work and Randall is only observing

## Daily Linear Sweep

During daily planning:

1. Check assigned `In Progress` issues.
2. Check assigned `Todo` issues with High or Urgent priority.
3. Check recently updated assigned issues from the last seven days.
4. Identify the single issue or project that is the center of gravity for the
   day.
5. Create or update a small number of standalone tasks in the `Workloop`
   Area.
6. Schedule only the tasks that are actual commitments for Today.

Today should usually contain one Linear-derived Workloop focus, not every
important Linear issue. Linear-derived tasks should usually float directly in
the `Workloop` Area because Linear already owns the project structure.

## Task Shape

Use standalone area tasks by default:

```text
Decide today's concrete slice for ENG-661
Ship the smallest secure-grants settings change for ENG-671
```

Task notes should include the Linear URL and just enough context to resume.

Create a Things project only when there is a personal outcome that is larger
than the Linear ticket itself, for example:

- Prepare Workloop private alpha walkthrough
- Close KWR realtor demo follow-up
- Finish May company strategy memo

## Scheduling

Schedule the selected standalone task for Today when it is part of the day's
commitment list.

Avoid scheduling every imported Linear task. Today should show the few actions
Randall is actually choosing to do.

## Links

Every Linear-derived Things task should include the Linear URL in its notes.

Use Linear as the detailed record. Use Things notes only for enough context to
choose and execute the next action.

## Review

At the end of the day:

- complete tasks that were actually done
- update the Linear issue when needed
- move unfinished but still relevant work back to Anytime
- delete or cancel imported tasks that no longer represent real next actions
