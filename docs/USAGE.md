# Usage Details

This repo ships a small `rbff` CLI (see `bin/rbff`). The README shows the
common commands; this file captures additional behavior and defaults.

## Repository + CLI location

Defaults are set via env vars in `bin/rbff`:
- `RBFF_REPO_DEFAULT`: defaults to `~/code/rbff`
- `RBFF_BFMONO_PATH`: defaults to `~/code/bolt-foundry/bfmono`
- `RBFF_BIN_TARGET`: defaults to `~/.local/bin/rbff`

`rbff doctor` clones the repo if needed, links the CLI into
`RBFF_BIN_TARGET`, clones `bfmono` if needed, applies nix-darwin, and installs
the global Deno `codex` shim. It also configures Git/Sapling commit identity if
missing.

## Commands

- `rbff`: prints help.
- `rbff codex`: opens Codex in the rbff repo.
- `rbff gambit`: opens Gambit in the rbff repo.
- `rbff journal`: opens Gambit in notes root.
- `rbff journal doctor`: creates PARA folders + a daily template.
- `rbff doctor`: bootstraps prereqs and applies the full nix-darwin setup.
- `rbff rebuild`: applies the fast nix-darwin path, skipping Homebrew/MAS
  activation, and refreshes the global Deno `codex` shim.
- `rbff status`: prints local setup status.

`rbff rebuild` now uses the `rbff-no-homebrew` flake target by default. Pass
`--skip-homebrew=false` if you explicitly want the full Homebrew/MAS activation
path during rebuild.
`rbff doctor` remains the full setup path, and still accepts `--skip-homebrew`
when you explicitly want to suppress Homebrew/MAS activation there too.

## Notes root

The notes root defaults to `~/Documents/Notes` and can be overridden with
`RBFF_NOTES_ROOT`. The folder is not created automatically by `rbff journal`;
use `rbff journal doctor` to create the structure.

## Obsidian integration

The legacy helper at `code/bin/rbff` now uses the official `obsidian` CLI
instead of `obsidian://` URLs. That requires Obsidian's `Command line
interface` setting to be enabled in the desktop app. File targets open directly
with `obsidian vault=rbff open path=<path>`. Directory and repo-root targets
open the vault, because the CLI `open` command only targets files.

## Gambit decks

`rbff gambit` and `rbff journal` expect a deck file to exist. By default they
look for `gambit.deck.md` in the repo and notes root. Override with
`RBFF_GAMBIT_REPO_DECK` and `RBFF_GAMBIT_NOTES_DECK` (absolute paths allowed).
`rbff gambit` prefers the local bfmono wrapper at
`$RBFF_BFMONO_PATH/infra/bin/gambit` when present. If that is missing, it falls
back to any installed `gambit` binary, then to
`deno run -A jsr:@bolt-foundry/gambit@0.5.2/cli`. Override the final Deno
fallback with `RBFF_GAMBIT_CLI_REF` or point `RBFF_GAMBIT_CLI` at a local CLI
entrypoint if you need a different Gambit build.
Extra args after `rbff gambit` are forwarded to `gambit repl <deck>`, so you
can do things like `rbff gambit --message 'Reply with exactly: ok' --verbose`.

The repo's default [gambit.deck.md](/Users/randallb/code/rbff/gambit.deck.md)
uses Gambit's `codex-cli/default` provider, so `rbff gambit` runs through the
Codex CLI provider path rather than the older OpenAI model config.

## Codex install

`codex` is expected to come from Deno global install, not nix-darwin:

```bash
deno install -g -A --name codex npm:@openai/codex
```

The installed shim lives under `~/.deno/bin/codex`. `home-manager` adds
`$HOME/.deno/bin` to `PATH`.

## Environment variables

- `RBFF_REPO_DEFAULT`: repo path used by `rbff doctor` and `rbff codex`
- `RBFF_BIN_TARGET`: installation target for the CLI
- `RBFF_REMOTE_DEFAULT`: git remote for cloning the repo
- `RBFF_BFMONO_PATH`: bfmono checkout path used by the `gambit` wrapper
- `RBFF_BFMONO_DEFAULT`: default bfmono checkout path
- `RBFF_BFMONO_REMOTE_DEFAULT`: git remote used by `rbff doctor` when cloning bfmono
- `RBFF_GIT_USER_NAME`: commit author name to configure during `rbff doctor`
- `RBFF_GIT_USER_EMAIL`: commit author email to configure during `rbff doctor`
- `RBFF_MIGRATE_FROM`: force a rbpara migration source path
- `RBFF_MARKER_PATH`: marker used to detect nix-darwin ownership
- `RBFF_NOTES_ROOT`: notes directory for `rbff journal`
- `RBFF_GAMBIT_REPO_DECK`: deck path (relative to repo or absolute) for `rbff gambit`
- `RBFF_GAMBIT_NOTES_DECK`: deck path (relative to notes root or absolute) for `rbff journal`
