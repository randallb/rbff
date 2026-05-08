# Workloop

Ongoing responsibility for Workloop/Bolt Foundry work, including product
direction, Workloop execution, Gambit/evals substrate, customer commitments, and
company operating priorities.

## Current responsibilities

- Keep active Workloop projects legible and sequenced.
- Track the split between product execution, customer commitments, and company
  strategy.
- Convert repo or Linear context into Things next actions when it affects today.
- Use Linear as the canonical issue tracker and Things as Randall's daily
  commitment surface.
- Keep the Codex development loop smooth enough that routine `bft` work does
  not require repeated manual environment bootstrapping.

## Things

Things Area name: `Workloop`.

Use Things projects for active outcomes such as:

- May company strategy
- Realtor / KWR flow
- Workloop private alpha
- Gambit reliability and evals
- Website, docs, and public story

## Linear

Use [`linear-to-things.md`](../../resources/shared/linear-to-things.md) when
pulling Linear issues into Things.

The default daily pattern is a small number of standalone tasks in the
`Workloop` Area, scheduled Today only when they are real commitments. Linear keeps
the project structure; Things keeps Randall's next actions.

## Codex Development Environment

Open investigation: make Codex shells able to run `bft` tasks inside
`/Users/randallb/code/bolt-foundry/bfmono` without repeatedly typing
`direnv exec .`.

Likely directions:

- configure Codex shell startup to load direnv automatically when entering
  approved repo folders
- add a small wrapper for `bft` that executes through direnv when needed
- document a standard command pattern for Codex tasks if automatic loading is
  not reliable

The goal is a repeatable setup where commands run with the expected PATH and
environment from the correct bfmono folder.

## Someday / Investigations

- Investigate moving from Sapling to Git plus Graphite for Workloop developer
  workflow, Codex compatibility, review flow, stacked changes, and onboarding.
- Set up GitHub/deploy notifications in Slack so deploy success/failure and
  important repo/environment alerts are visible to the team.
