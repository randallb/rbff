# Documentation Organization

## Purpose

Define the split between doctrine, execution intent, public writing, and
private work.

## Policy

- `policy/` is doctrine. It is slow-changing, non-negotiable guidance that
  overrides memos.
- `memos/` is execution intent. It contains time-bound projects, areas,
  resources, and posts that must comply with policy.
- `docs/` is public-facing writing: essays, posts, and published work.
- `studio/` is private work: drafts, experiments, working artifacts, and
  anything not intended for public release.
- `coworkers/` contains agent definitions, prompts, or automation configs.
- `people/` contains personal profiles, relationships, or contact notes.

## Intent vs Doctrine

- `INTENT.md` lives with execution in `memos/` and captures the decision intent
  for a scope.
- Intent is not a tracker; execution details belong in companion notes or
  README files.
- Doctrine lives in `policy/` and captures long-lived defaults.
- Intent must comply with doctrine.

## Ordering

When content conflicts:

1. `policy/` wins over `memos/`.
2. `memos/` drives execution details.
3. `docs/` and `studio/` reflect or explore, but do not override intent.

## Placement Rules

- Put rules, principles, and boundaries in `policy/`.
- Put active plans, decisions-in-flight, and execution notes in `memos/`.
- Put public essays and finished work in `docs/`.
- Put private drafts and experiments in `studio/`.
- Put agent definitions in `coworkers/`.
- Put personal relationship context in `people/`.

## No Duplicate Company Scope

The root of `memos/` already represents life/company scope. Do not add a
`company/` folder underneath it; add areas and projects directly below the
root.
