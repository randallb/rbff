# Intent: Gambit `llamacpp/` Provider (via OpenResponses Shim)

## Purpose

Enable Gambit decks to use `modelParams.model = "llamacpp/<model>"` with normal Gambit semantics (schemas, `actionDecks`, traceability) by routing model calls through an OpenResponses shim server.

## End State

- Gambit supports a new provider prefix: `llamacpp/`.
- Deck authors can set `modelParams.model = "llamacpp/<model>"` and run decks normally.
- The `llamacpp/` provider:
  - sends Responses requests to the OpenResponses shim server,
  - includes tool definitions derived from `actionDecks`,
  - supports tool calling by delegating tool execution back to Gambit (via shim callback),
  - returns a Responses-style result that Gambit can treat as a normal model turn.
- Configuration is straightforward:
  - base URL is configured via env/config (e.g. `LLAMACPP_BASE_URL` points to the shim),
  - defaults work for localhost development.
- Failure modes are clear and actionable:
  - "shim not reachable", "backend model not installed", "tools not supported", etc.

## Constraints

- Provider integrates with shim via `/v1/responses` in v1.
- Stateless protocol only in v1:
  - provider does not assume resumable server-side sessions.
- Provider must not invent custom tool semantics:
  - tool execution remains "Gambit action deck runs" (shim is orchestration).

## Tradeoffs

- We accept an extra hop (Gambit -> shim -> llama.cpp -> shim -> Gambit tool) to gain:
  - reliable tool use for backends that do not support OpenAI tool calling natively,
  - consistent semantics across llama.cpp now and vLLM later.
- We accept that early provider implementation may not support all Responses fields:
  - v1 focuses on the subset Gambit needs.

## Allowed Changes

- Add a new provider key + prefix routing for `llamacpp/`.
- Add provider configuration options (env/config) needed to reach the shim.
- Add callback wiring needed so the shim can delegate tool execution back to Gambit.
- Add smoke tests and integration tests for `llamacpp/`.

## Risk Tolerance

- Medium:
  - iterative development on provider<->shim request/response mapping is fine.
- Low tolerance for:
  - insecure callback exposure beyond localhost,
  - silent tool execution failures or dropped tool results.

## When to Escalate

- If the provider must diverge significantly from Gambit’s existing provider interface: pause and redesign.
- If tool execution cannot be delegated back to Gambit without major complexity: pause and revisit the callback design.
- If the shim requires non-local exposure: pause and design authentication.

## Testing + Verification Plan

- Unit:
  - provider routing: `llamacpp/<model>` selects the new provider correctly,
  - request mapping: `tools` + `tool_choice` + `input` are forwarded correctly.
- Integration (local):
  - start shim + llama.cpp backend,
  - run a simple tool-using deck with `modelParams.model = "llamacpp/<model>"`,
  - verify at least one tool call is executed and the final answer includes the tool result.
- Regression:
  - keep a minimal test deck that deterministically triggers exactly one tool call.

