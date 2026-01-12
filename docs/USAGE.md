# Usage Details

This repo ships a small `rbff` CLI (see `bin/rbff`). The README shows the
common commands; this file captures additional behavior and defaults.

## Repository + CLI location

Defaults are set via env vars in `bin/rbff`:
- `RBFF_REPO_DEFAULT`: defaults to `~/code/rbff`
- `RBFF_BIN_TARGET`: defaults to `~/.local/bin/rbff`

`rbff doctor` clones the repo if needed and links the CLI into
`RBFF_BIN_TARGET`.

## Commands

- `rbff`: opens Codex in the notes root.
- `rbff codex`: opens Codex in the rbff repo.
- `rbff journal`: same as `rbff` (Codex in notes root).
- `rbff journal doctor`: creates PARA folders + a daily template.
- `rbff doctor`: bootstraps prereqs and applies nix-darwin.
- `rbff rebuild`: applies nix-darwin.
- `rbff status`: prints local setup status.

## Notes root

The notes root defaults to `~/Documents/Notes` and can be overridden with
`RBFF_NOTES_ROOT`. The folder is not created automatically by `rbff journal`;
use `rbff journal doctor` to create the structure.

## Environment variables

- `RBFF_REPO_DEFAULT`: repo path used by `rbff doctor` and `rbff codex`
- `RBFF_BIN_TARGET`: installation target for the CLI
- `RBFF_REMOTE_DEFAULT`: git remote for cloning the repo
- `RBFF_MIGRATE_FROM`: force a rbpara migration source path
- `RBFF_MARKER_PATH`: marker used to detect nix-darwin ownership
- `RBFF_NOTES_ROOT`: notes directory for `rbff journal`
