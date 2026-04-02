# rbff

Minimal macOS setup using nix-darwin + home-manager, plus a personal Product
Command doctrine for life intent, memos, and writing.

## Quick Start

From the repo root:

```bash
./code/scripts/doctor.sh
```

This installs Nix (via Determinate Systems) and Homebrew if missing, then
clones the sibling `bfmono` checkout if missing, applies the nix-darwin flake,
and installs the global Deno `codex` shim.

For a fresh Mac, you can bootstrap directly with:

```bash
curl -fsSL https://gist.githubusercontent.com/randallb/21d20b50a353386f72fc765c52c9fb50/raw/bd545979c294fbd9e07ef8b7f470b1fbb9782002/bootstrap-new-mac.sh | bash
```

If Xcode Command Line Tools are not installed yet, macOS will prompt for that
first. After that install finishes, run the same command again.

Notes:
- The flake picks the current Mac architecture automatically (`aarch64-darwin` or `x86_64-darwin`).
- `--impure` is required (the flake reads `$USER` / `$SUDO_USER` to pick the primary user).

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

## Codex

`codex` is not installed by nix-darwin in this repo. It is installed globally
through Deno:

```bash
deno install -g -A --name codex npm:@openai/codex
```

`rbff doctor` and `rbff rebuild` run that install step after the nix-darwin
switch. `home-manager` adds `~/.deno/bin` to `PATH`.

## Structure

- `policy/` — doctrine
- `memos/` — execution intent
- `docs/` — public writing
- `studio/` — private work
- `coworkers/` — agents/config
- `people/` — relationships/contacts
- `code/` — infra and scripts
