# Intent: OpenResponses Shim Server (Stateless Responses, Gambit-Delegated Tools)

## Purpose

Enable reliable tool use for local open-weights models by introducing an OpenResponses-compatible shim server in front of llama.cpp, with tool execution delegated back to Gambit action decks.

## End State

- A shim server exists that implements a stateless subset of the OpenAI Responses API:
  - v1 supports `POST /v1/responses` (non-stream and stream if feasible).
  - Fast follow supports `GET /v1/models`.
- The shim runs an internal tool loop:
  - it decides when a tool call is needed,
  - it emits tool call requests and receives tool results,
  - it continues until it can produce a final answer.
- Tool execution is delegated to Gambit:
  - shim never writes files or runs arbitrary commands directly,
  - shim calls back into Gambit to execute action decks,
  - shim passes tool results back to the model.
- Tool loop is reliable:
  - tool calls are parseable (prefer strict JSON tool call envelope),
  - bounded by max-steps and timeouts,
  - clear errors when the model cannot/does not comply.
- Liquid tool-use edge cases are handled cleanly:
  - shim has a configurable "tool protocol" adapter layer,
  - protocol can be selected per model (preferred) or per request,
  - examples: `openai_tools`, `prompted_json_tools`, `liquid_tokens`.
- Minimal local-dev workflow:
  - one command to run shim + llama.cpp backend,
  - observable logs for model calls, tool calls, and tool results.

## Constraints

- Stateless protocol only in v1:
  - no durable session storage,
  - no resume-by-id,
  - no server-managed conversation history beyond a single request lifecycle.
- Tool execution is delegated back to Gambit:
  - shim must not write files or run arbitrary commands directly,
  - shim is orchestration and translation only.
- Prefer OpenResponses compatibility over bespoke APIs:
  - keep request/response shapes close to OpenAI Responses (within v1 scope).
- Localhost-first:
  - callback from shim to Gambit should be local-only for v1 (simple trust model).
- Liquid support is handled within the shim:
  - avoid Liquid-specific branching in Gambit providers/decks.

## Tradeoffs

- We accept higher implementation complexity (shim + callback) to gain:
  - tool reliability independent of provider quirks (e.g. Ollama tool gating),
  - consistent tool semantics across llama.cpp and future backends (explicitly out of scope for now).
- We accept that v1 will not provide "chatty convenience" features:
  - no session resume,
  - limited metadata/usage reporting (best-effort).
- We prioritize correctness + determinism over max throughput in v1.

## Allowed Changes

- Add a standalone shim server component (repo location TBD) with:
  - `/v1/responses` implementation,
  - a minimal callback client to Gambit.
- Add model adapters for llama.cpp (v1).

## Risk Tolerance

- Medium:
  - okay to iterate quickly on protocol details and model prompting strategies,
  - not okay to introduce silent tool execution outside Gambit.
- Low tolerance for:
  - insecure remote exposure of the callback surface,
  - unbounded loops (no max-steps/timeouts),
  - ambiguous tool execution semantics.

## When to Escalate

- If shim requires non-local exposure (LAN/WAN) to work: pause and design auth.
- If tool execution needs to happen inside shim for practicality: pause and revisit the separation of concerns.
- If OpenResponses compatibility forces major divergence from Gambit tool semantics: pause and decide which contract wins.
- If model compliance is too poor without heavy prompt hacking: consider switching model families or adding a stricter parser/validator.

## Testing + Verification Plan

- Unit (shim):
  - parse/validate incoming Responses requests (tools, tool_choice, input),
  - parse/validate model-emitted tool calls (JSON envelope),
  - enforce max-steps/timeouts deterministically.
- Integration (local):
  - start shim + llama.cpp backend,
  - drive the shim with a Responses request that includes a tool:
    - verify shim requests model,
    - verify shim calls back into Gambit to execute tool,
    - verify final answer includes tool result.
- Security:
  - confirm callback surface is bound to localhost and rejects non-local access.
- Regression:
  - keep a small test deck that deterministically triggers a single tool call and asserts output shape.
