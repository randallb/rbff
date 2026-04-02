# Spec: Agent Runtimes + Llama.cpp Runtime Support (rbff + Gambit)

Status: draft

## Purpose

Enable rbff/Gambit to use multiple "agent runtimes" (Codex SDK, Claude Agent SDK)
alongside local open-weights inference (llama.cpp), while keeping a consistent
deck/tool interface and preserving Gambit's strengths (schemas, traceability,
action decks, sandbox boundaries).

## Goals

- Support "agent runtimes" as Gambit action decks:
  - `openai/codex-sdk` (Codex SDK -> local `codex` CLI).
  - `anthropic/agent-sdk` (Claude Agent SDK -> local `claude` CLI).
- Support local model inference via llama.cpp:
  - v1: OpenResponses shim server that enables tool use and delegates tool
    execution back to Gambit.
  - Integration point: `llamacpp/` model provider for native `modelParams`
    usage (provider talks to the shim).
  - Optional PoC path: compute-deck tool loop that talks to llama.cpp over HTTP.
- Use Gambit-native "stdlib" / URI conventions for reusable decks/snippets.

## Non-goals (for now)

- Cross-runtime shared conversation state (Codex thread != Claude session).
- Perfectly unified tool-call semantics across all runtimes.
- High availability / multi-tenant serving for local models.
- Stateful protocol (no server-side session storage / resume in v1).
- Broad API surface area beyond Responses in v1 (`/v1/models` is fast follow).

## Key concepts

- Provider (Gambit): model backend selected by `modelParams.model` prefix
  (e.g. `ollama/`, `openrouter/`). Providers power tool calling for model decks.
- Agent runtime (rbff): an external agent loop + session store + CLI (Codex,
  Claude) called as a tool/action deck.
- Runtime (llama.cpp): raw inference engine. Tool calling may require a custom
  loop unless the server exposes OpenAI-compatible tools.

## Interface contracts

### 1) Agent runtime action deck contract (Codex/Claude)

Action deck input (minimum viable):

- `prompt: string`
- `workingDirectory?: string`
- `sandboxMode?: "read-only" | "workspace-write" | "danger-full-access"`
- `networkAccessEnabled?: boolean`
- `webSearchEnabled?: boolean`
- `approvalPolicy?: "never" | "on-request" | "on-failure" | "untrusted"`
- `resumeId?: string` (thread id / session id)

Action deck output (minimum viable):

- `status: number`
- `runtime: "openai/codex-sdk" | "anthropic/agent-sdk"`
- `resumeId?: string`
- `finalResponse?: string`
- `itemsOrEvents?: unknown` (opaque; passthrough for debugging)
- `error?: string`

Notes:

- Authentication should reuse the CLI's existing login state when possible.
- History should be handled via `resumeId` (thread/session id).

### 2) Llama.cpp compute-loop contract (PoC)

Compute deck input:

- `prompt: string`
- `llamacppBaseUrl: string` (or default from env)
- `workingDirectory?: string`
- `tools?: string[]` (names of action decks this loop may call; start with codex)

Compute deck behavior:

- Implement a tool loop in code: model -> parse tool calls -> `spawnAndWait` ->
  tool result -> model -> ... -> final answer.
- Prefer strict JSON tool-call format to avoid brittle parsing.

Compute deck output:

- `finalResponse: string`
- `trace: unknown[]` (optional; bounded, for debugging)

### 3) Llama.cpp provider contract (long-term)

- Introduce model prefix `llamacpp/`.
- Provider should route `llamacpp/<model>` to an OpenResponses shim server.
- Tool calling is enabled by the shim; tool execution is delegated back to Gambit.

## OpenResponses shim server (v1)

We want an OpenResponses shim server as the primary path for enabling tool use
with llama.cpp, while keeping Gambit as the tool executor.

### Requirements

- API surface:
  - v1: implement `/v1/responses` only
  - fast follow: add `/v1/models`
- Protocol:
  - v1 is stateless (no persisted sessions, no resume)
- Tools:
  - shim orchestrates the tool loop
  - shim delegates tool execution back to Gambit (it should not own side effects)

### How delegation works (concept)

1) Gambit calls the `llamacpp/` provider with a Responses request containing:
   - user input
   - tool definitions (`actionDecks`)
2) Provider forwards the request to the shim server (`/v1/responses`).
3) Shim prompts llama.cpp to emit tool calls in a parseable format (prefer JSON).
4) When a tool call is needed, shim calls back into Gambit to execute it.
5) Shim feeds tool results back to llama.cpp and repeats until a final answer.
6) Shim returns a Responses-style result to the provider, which returns to Gambit.

### Explicitly out of scope

- Supporting vLLM as a backend is out of scope for v1. (Revisit later.)

### Callback surface (proposed; v1)

Keep this minimal and localhost-only for v1. The shim needs a stable way to ask
Gambit to execute a tool call:

- request: `{ name: string, arguments: object }`
- response: `{ status: number, output?: object, error?: string }`

Open question: whether this is an HTTP server inside Gambit, an stdio bridge,
or a unix socket. V1 can be "whatever is easiest locally" as long as it is
stateless and reliable.

## Integration point: `llamacpp/` provider

- `llamacpp/` is the model prefix users put in `modelParams.model`.
- The provider uses `LLAMACPP_BASE_URL` to talk to the shim (not directly to llama.cpp).
- From Gambit's perspective, `actionDecks` remain the tool mechanism; the shim
  is just the model backend that can reliably drive tool calls.

## Namespace and packaging

Goal: Gambit provides a reusable "stdlib" of decks/cards/snippets and a stable
URI scheme for referencing them.

Disk layout (proposed):

- `code/gambit/stdlib/decks/openai/codex-sdk/...`
- `code/gambit/stdlib/decks/anthropic/agent-sdk/...`
- `code/gambit/stdlib/decks/llamacpp/...`
- `code/gambit/stdlib/cards/...`
- `code/gambit/stdlib/snippets/...`

URI conventions (proposed):

- `gambit://decks/openai/codex-sdk/...`
- `gambit://decks/anthropic/agent-sdk/...`
- `gambit://decks/llamacpp/...`

Implementation note:

- Gambit already supports `gambit://cards/...` embeds.
- `gambit://decks/...` should be a Gambit feature (resolver + packaging), not
  an rbff wrapper.

## Configuration

Environment variables (proposed defaults):

- `RBFF_BFMONO_PATH` (already used for bfmono discovery)
- `LLAMACPP_BASE_URL` (llama.cpp HTTP endpoint)
- `OLLAMA_BASE_URL` (existing)
- `OPENROUTER_API_KEY` (existing)

Optional config file (future):

- `code/gambit/gambit.toml` for provider defaults + local overrides.

## Security and safety

- Default sandboxing:
  - Agent runtimes default to `"read-only"`, `networkAccessEnabled=false`.
  - Escalate to `"workspace-write"` only when explicitly requested.
  - `"danger-full-access"` requires explicit user intent (policy decision).
- Minimize credential surface:
  - Prefer CLI auth reuse (no new API keys) when possible.
  - Avoid writing secrets into the repo; keep notes scrubbed.

## Testing and verification

- Unit: validate action deck schemas and basic execution locally.
  - `gambit run` on `codex_run` with a trivial prompt.
- Integration:
  - Run a root deck that uses a tool-capable provider (OpenRouter/Ollama) and
    successfully calls `codex_run`.
  - For llama.cpp PoC: run compute-loop deck against a local llama.cpp endpoint
    with a deterministic prompt and a single tool call.
- Regression:
  - Keep a tiny test deck that exercises `codex_run` and asserts output shape.

## Open questions

- How should we normalize "resumeId" across Codex (thread id) and Claude
  (session id)? Do we keep them separate fields or a unified string?
- For llama.cpp:
  - Which server endpoint are we standardizing on (OpenAI-compatible vs native)?
  - Do we want the provider to support tools, or require compute-loop for tools?
- How do we expose the stdlib in a way that works across repos (submodule,
  copy, or a separate repo + sync)?
