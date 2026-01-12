# rbff

Minimal macOS setup using nix-darwin + home-manager.

## Quick Start

```bash
curl -fsSL https://randallb.com/rbff/doctor | bash
```

## Commands

```bash
rbff doctor         # bootstrap + apply nix-darwin config
rbff doctor --dry-run
rbff rebuild        # apply nix-darwin config
rbff rebuild --dry-run
rbff status         # show local setup status
rbff codex          # open Codex in rbff repo
rbff journal        # open Codex in notes root
rbff journal doctor # create PARA structure + journal template
```

## Docs

- [docs/USAGE.md](docs/USAGE.md)
- [docs/DEV_WORKFLOW.md](docs/DEV_WORKFLOW.md)

## What This Configures

- Caps Lock remapped to Escape
- Sudo with Touch ID
- Apps: VSCode, Discord, ChatGPT (Homebrew casks)
- CLI: Sapling (via nix package)
- Homebrew installed if missing

## Migration

If nix-darwin is already active (origin unknown), `rbff doctor` will prompt to
create a migration snapshot before applying the new configuration.

The snapshot writes to `~/.rbff/migrations/<timestamp>/` and captures:
- `source-path.txt` (detected previous repo path)
- `darwin-generations.txt` (if available)
- `brew-casks.txt` (if available)
- `notes.txt`
