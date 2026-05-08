# Intent: bfmono infra for llama.cpp (Install + Maintenance)

## Purpose

Make it easy and reliable for developers and systems to install, run, and maintain llama.cpp for local inference, with versions and configuration managed consistently (preferably via Nix).

## End State

- bfmono infra can install llama.cpp on supported platforms (including macOS):
  - pinned version (or pinned source revision),
  - reproducible install path.
- bfmono provides a standard way to run llama.cpp as a service for local development:
  - consistent host/port configuration,
  - predictable model directory location,
  - logs are discoverable.
- Common maintenance workflows are documented and automated:
  - upgrading llama.cpp (pinned update),
  - verifying the server is healthy,
  - listing installed models / pulling required models (if applicable to the chosen backend setup).
- Doctor/setup tooling detects missing prerequisites and provides actionable guidance.

## Constraints

- Prefer Nix as the source of truth for installation and versioning.
- Avoid per-user snowflake installs:
  - infra should work on fresh machines and in CI-like contexts where possible.
- Avoid coupling to a single model family:
  - llama.cpp runtime should be usable with Liquid models and other GGUF models.

## Tradeoffs

- We accept some additional infra work up front (packaging, pinning, docs) to gain:
  - fewer “works on my machine” issues,
  - repeatable local-dev experience for the OpenResponses shim + `llamacpp/` provider.

## Allowed Changes

- Add Nix derivations/modules to install llama.cpp.
- Add scripts/services to run and monitor llama.cpp locally.
- Add docs and doctor checks for required environment variables and runtime state.

## Risk Tolerance

- Medium:
  - okay to iterate on packaging and service defaults.
- Low tolerance for:
  - installs that require manual steps not captured in infra,
  - fragile defaults that frequently break upgrades.

## When to Escalate

- If Nix cannot reliably support the target platform(s) for llama.cpp: pause and choose a fallback (brew, prebuilt binaries) and document it explicitly.
- If model storage/management becomes complex enough to warrant a dedicated tool (Ollama-like): pause and decide the long-term backend strategy.

## Testing + Verification Plan

- On a clean machine:
  - install via bfmono infra (Nix),
  - start llama.cpp server,
  - run a minimal inference request and confirm expected response.
- Regression:
  - add a lightweight “health check” script that validates the service is reachable and returns a valid response.

