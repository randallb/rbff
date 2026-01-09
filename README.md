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
```

## What This Configures

- Caps Lock remapped to Escape
- Sudo with Touch ID
- Apps: VSCode, Discord, ChatGPT (Homebrew casks)
- CLI: Sapling (via nix package)
- Homebrew installed if missing

## Migration

If nix-darwin is already active (origin unknown), `rbff doctor` will prompt to
create a migration snapshot before applying the new configuration.
