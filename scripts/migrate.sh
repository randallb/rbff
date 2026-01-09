#!/usr/bin/env bash
set -euo pipefail

RBFF_MIGRATION_ROOT="${RBFF_MIGRATION_ROOT:-$HOME/.rbff/migrations}"
SOURCE_REPO="${1:-}"

if [[ -z "$SOURCE_REPO" ]] || [[ ! -d "$SOURCE_REPO" ]]; then
  echo "rbff: migration source not found" >&2
  exit 1
fi

timestamp="$(date -u +"%Y%m%dT%H%M%SZ")"
target_dir="$RBFF_MIGRATION_ROOT/$timestamp"
mkdir -p "$target_dir"

echo "$SOURCE_REPO" > "$target_dir/source-path.txt"

if command -v darwin-rebuild >/dev/null 2>&1; then
  darwin-rebuild --list-generations > "$target_dir/darwin-generations.txt" || true
fi

if command -v brew >/dev/null 2>&1; then
  brew list --cask > "$target_dir/brew-casks.txt" || true
fi

cat > "$target_dir/notes.txt" <<'NOTES'
Migration snapshot only. rbff will now manage nix-darwin.
If you need to restore, check your previous repo for its config.
NOTES

echo "rbff: migration snapshot saved to $target_dir"
