# Intent: Gambit Agent Runtime Decks (Codex SDK + Claude Agent SDK)

## Purpose

Provide a reusable set of Gambit action decks that wrap agent runtimes (Codex SDK and Claude Agent SDK) so Gambit decks can delegate work to those runtimes in a consistent, composable way.

## End State

- Gambit provides (or ships with) a small "agent runtime" deck set:
  - `openai/codex-sdk` action deck(s) (run/resume, structured output, images if needed).
  - `anthropic/agent-sdk` action deck(s) (run/resume, structured output if supported).
- The runtime decks share a consistent IO contract:
  - input includes `prompt`, `workingDirectory`, and safety controls (sandbox + approvals).
  - output includes `finalResponse` plus a `resumeId` (thread/session id) for continuation.
- Authentication reuses the CLI login state when present:
  - no new keys required for local usage,
  - clear errors and setup guidance when the CLI is not authenticated.
- Deck authors can use these runtimes as tools (`actionDecks`) from any parent deck.

## Constraints

- These are action decks/tools, not model providers:
  - they are agent runtimes with their own session stores and tool loops.
- Default safety posture:
  - start in `"read-only"` / minimal permissions unless the caller opts in.
- Keep the contract stable and minimal for v1:
  - avoid overfitting to a single CLI's event model.

## Tradeoffs

- We accept that Codex and Claude session history is not shared:
  - `resumeId` is runtime-specific.
- We accept that some capabilities may differ per runtime:
  - "lowest common denominator" contract + runtime-specific extensions as needed.

## Allowed Changes

- Add/modify action deck implementations for `codex` and `claude`.
- Add thin wrapper decks (e.g. `agent_run`) that route based on runtime id.
- Add docs/examples for how to include these decks as `actionDecks`.

## Risk Tolerance

- Medium:
  - okay to iterate on the output schema and optional fields.
- Low tolerance for:
  - leaking credentials into repos,
  - unsafe default permissions.

## When to Escalate

- If we cannot reuse CLI auth reliably and must require API keys: pause and decide the security model.
- If runtime output/events are too incompatible to normalize without hiding important info: pause and choose a minimal contract + passthrough field.

## Testing + Verification Plan

- Local smoke tests:
  - run the action deck with a trivial prompt and confirm `finalResponse` is returned.
  - confirm resume works with a saved `resumeId`.
- Contract tests:
  - validate input/output schemas and ensure errors are structured and actionable.

