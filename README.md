# rbff

Minimal macOS setup using nix-darwin + home-manager, plus a personal Product
Command doctrine for life intent, memos, and writing.

## Quick Start

From the repo root:

```bash
./code/scripts/doctor.sh
```

This installs Nix (via Determinate Systems) and Homebrew if missing, then
applies the nix-darwin flake.

## Apply Manually

```bash
darwin-rebuild switch --flake .#rbff --impure
```

If `darwin-rebuild` is not installed yet:

```bash
nix --extra-experimental-features "nix-command flakes" \
  run github:LnL7/nix-darwin -- switch --flake .#rbff --impure
```

## Configuration

- nix-darwin: `code/nix/darwin/configuration.nix`
- home-manager: `code/nix/home-manager/home.nix`
- app lists: `homebrew.casks` and `homebrew.masApps` in
  `code/nix/darwin/configuration.nix`

## Structure

- `policy/` — doctrine
- `memos/` — execution intent
- `docs/` — public writing
- `studio/` — private work
- `coworkers/` — agents/config
- `people/` — relationships/contacts
- `code/` — infra and scripts
