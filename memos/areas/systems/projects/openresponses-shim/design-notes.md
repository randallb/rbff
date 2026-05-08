# OpenResponses Shim: Design Notes (v1)

Status: draft

These are implementation-level choices for v1. They are intentionally separate
from `INTENT.md` so we can iterate on details without changing the intent.

## Initial design choices (v1)

- Callback mechanism:
  - Gambit `llamacpp/` provider starts a localhost-only HTTP callback server for
    the duration of the process (or request), secured with a random bearer token.
  - Provider passes `callback_url` + `callback_token` to the shim.
- Tool routing:
  - Shim calls tools by `name` + `arguments`.
  - Gambit resolves `name -> action deck path` from the calling deck’s `actionDecks`.
  - Shim never receives deck file paths.
- Run correlation:
  - Provider generates a `run_id`.
  - Shim includes `run_id` on every callback so Gambit can route to the correct
    in-flight request mapping.
- Where Gambit-specific data lives:
  - Prefer HTTP headers for v1 (avoid bespoke request-body fields) so the JSON
    payload stays close to OpenAI Responses.
- Tool protocol adapter selection:
  - Default to `prompted_json_tools`.
  - Select `liquid_tokens` for `hf.co/LiquidAI/*`-like models via a shim-side
    `model -> protocol` map.
  - Allow an explicit per-request override only for debugging.
- Streaming:
  - v1 requires non-stream responses.
  - Streaming (SSE) is optional/fast-follow.
- Failure policy:
  - Bounded loop (e.g. max steps 8, timeout 120s).
  - On tool-call parse failure, do one reprompt/repair pass, then return a clear
    error response.
- Observability:
  - Log structured JSON lines for: request received, model call, tool call, tool
    result, final response.
  - Include `run_id` everywhere.

