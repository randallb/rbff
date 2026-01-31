# Review Cadence Policy

## Purpose

Define how intents are reviewed and revalidated so revalidation is not
arbitrary, and drift is caught early.

## Policy

- Intents without clear end conditions should include a review cadence tied to
  their scope.
- Intents with explicit end conditions may omit cadence if the end condition is
  reliable.
- Every intent must specify one or more event-based triggers for review.
- Verification steps must include measurable or observable signals.
- Reviews should update intent only when guardrails change; execution details
  belong in memos or notes.

## Cadence by scope

- Life intent (memos/INTENT.md): quarterly.
- Area intents (memos/0-*-*/INTENT.md, memos/1-*/INTENT.md, etc.): quarterly.
- Project intents (memos/projects/.../INTENT.md): at each phase boundary and
  before shipping.

## Event triggers (applies to all scopes)

- Major life change (health, family, work, relocation).
- Sustained drift from verification signals.
- Repeated escalation conditions.
- Conflict between intents (higher vs lower scope).

## Review outputs

Each review should result in one of:

- Confirm intent still governs decisions (no change).
- Update intent guardrails (constraints, tradeoffs, risk tolerance).
- Supersede intent with a new one.

## Template

Use `policy/templates/REVIEW.md` for non-incident reviews. AARs remain for
post-completion or failure-driven retrospectives.
