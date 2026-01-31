# Product Command Doctrine (Personal)

This repo uses Product Command as its coordination model: intent is
centralized, execution is decentralized. The goal is to make daily decisions
by aligning with clear intent rather than chasing a fixed plan.

## Principles

- Centralize intent, not decisions.
- Decentralize execution.
- Preserve alignment through clarity, not control.
- Maintain tempo even when plans change.
- Intent is the primary input to decision-making.

## Required Sections (Verbatim Headings)

Every `INTENT.md` must include the following sections with headings that match
exactly:

- Purpose
- End State
- Constraints
- Tradeoffs
- Risk tolerance
- Escalation conditions
- Verification steps
- Activation / revalidation
- Appendix (optional)

If a document does not follow this structure, it is supplementary, not intent.

## Fractality and Scope

Intent is fractal: the structure stays the same; only the scope changes.

- Life intent (company scope)
- Area intent (ongoing responsibility)
- Project intent (time-bound effort)

Rules:

- Higher-scope intent provides less detail but more meaning.
- Lower-scope intent adds constraints while preserving autonomy.
- Lower-scope intent must not contradict higher-scope intent.
- The nearest applicable `INTENT.md` governs decisions.

## What Does Not Belong in Intent

- Tutorials or how-to guides
- Implementation details or tracking lists
- Status updates or retrospectives
- Essays or creative writing

Those belong in `docs/`, `studio/`, or companion execution notes in `memos/`.

## Activation / Revalidation Guidance

Every intent must explicitly state:

- When it starts governing decisions (activation condition).
- When it stops governing decisions (end condition and/or supersession).
- What triggers deliberate review/revalidation.

If an intent is superseded, link to the new intent in the appendix.

## Verification Cadence

Intent only works if it is verified. Verification steps must name signals,
metrics, or checks that prove the end state, and who owns them.

At each scope:

- Life/area intent is reviewed at the start of each planning cycle.
- Project intent is rechecked before each phase ships.
- Readers treat missing or conflicting intent as a blocker.

## Using Intent in Daily Work

1. Read the nearest applicable `INTENT.md` before making a decision.
2. Make the best local decision consistent with that intent.
3. If intent is missing, conflicting, or unclear, stop and escalate.

If a reasonable decision surprises you, fix the intent, not the executor.
