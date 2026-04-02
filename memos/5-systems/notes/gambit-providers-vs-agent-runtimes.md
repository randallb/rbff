# Gambit: Providers vs Agent Runtimes (Codex/Claude) vs Llama.cpp

Status: notes / scratchpad

## Key distinctions

- Gambit "providers" are model backends for Gambit's built-in LLM execution path.
  - Examples today: `openrouter/`, `ollama/`, `google/`.
  - Provider routing is model-prefix based and resolves `modelParams.model`.
  - Providers are what make `actionDecks` work as "tools" in model-powered decks.
- Codex SDK and Claude Agent SDK are not model APIs; they are agent runtimes that
  spawn their CLIs, run tool loops, and persist history externally.
  - They fit cleanly as Gambit action decks (tools), not as model providers.

## When providers are required in Gambit

- Required when a deck uses `modelParams` (Markdown or TS model-powered decks).
  - Gambit needs a provider to resolve the model string and make the model call.
  - Tool calling (`actionDecks`) depends on provider support for tools.
- Not required for pure compute decks (`run`/`execute` only, no modelParams).

## Why the Liquid (LFM2.5) + Ollama tool-call failed

- LFM2.5 supports tool use, but Liquid docs describe a specific "tool protocol"
  (tool list in system prompt + tool calls in special tokens / pythonic calls).
- Gambit talks to Ollama via an OpenAI-compatible `/v1` API and expects OpenAI-
  style tool calling. For this model tag, Ollama rejected tools as unsupported.
- Net: model capability != server/API tool-call compatibility.

## Two approaches for Liquid + tools

### A) Tool-capable model/provider in Gambit (fastest for "native Gambit")

- Use a model that the provider exposes as OpenAI-tool-capable.
  - Then `actionDecks` work normally with no custom loop.
- If using Ollama, this depends on the specific model tag and Ollama's support.

### B) Custom tool loop (works even if backend doesn't support OpenAI tools)

- Implement an agent loop yourself that:
  - injects "List of tools: [...]" into the prompt (Liquid recommended format),
  - forces tool calls in a parseable format (ideally strict JSON),
  - parses tool calls from text,
  - executes them via Gambit `ctx.spawnAndWait(...)`,
  - feeds tool results back, and repeats until final answer.

This can be done as:
- a Gambit compute deck (fastest PoC; keeps tool execution inside Gambit), or
- a shim server exposing an OpenAI-like API in front of llama.cpp/vLLM (more ops).

## Llama.cpp: provider vs compute-deck PoC

- Compute deck (fast PoC):
  - call llama.cpp as text-in/text-out,
  - run the tool loop in code,
  - execute tools via `ctx.spawnAndWait(...)` (e.g. `codex_run`).
  - Pros: works even if llama.cpp doesn't support OpenAI tools; maximum control.
  - Cons: you own parsing/protocol/retries/streaming; less "native Gambit" UX.

- Provider (long-term integration):
  - add `llamacpp/` prefix + provider module,
  - keep normal `modelParams` usage and `actionDecks` tool plumbing,
  - better compatibility with Gambit CLI features (check/run/export, etc.).
  - Still depends on the llama.cpp server exposing a tool-compatible API or you
    implementing provider-level adaptation.

## Practical plan

1) Keep Codex/Claude as Gambit action decks (tools). They already reuse local
   CLI auth and manage their own history (thread/session IDs).
2) For Liquid + tools, do a compute-deck PoC that runs the tool loop and calls
   `codex_run` as the first useful "external tool".
3) Once the PoC protocol is stable, decide whether to:
   - implement a `llamacpp/` provider, or
   - keep the loop as a compute deck and treat llama.cpp as a dependency.

## Future: rbff "Gambit stdlib" namespace

Goal: treat decks/cards/snippets as a reusable "stdlib" under a stable URI-like
namespace, e.g.:

- `gambit://decks/openai/codex-sdk/...`
- `gambit://decks/anthropic/agent-sdk/...`
- `gambit://cards/...` (already exists in Gambit)

Note: Gambit today supports `gambit://cards/...` embeds, but does not (yet)
resolve arbitrary `gambit://decks/...` paths for `gambit run`. We can add this
as a thin wrapper/resolver in rbff (e.g. in `code/bin/gambit` or `rbff gambit`)
that rewrites `gambit://decks/...` to `code/gambit/stdlib/decks/...` on disk.
