#!/usr/bin/env bash
set -euo pipefail

source_root="${1:-}"
if [[ -z "$source_root" ]]; then
  echo "usage: migrate.sh <rbpara-root>" >&2
  exit 1
fi

if [[ ! -d "$source_root" ]]; then
  echo "rbff: source path does not exist: $source_root" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SNAPSHOT_DIR="$REPO_ROOT/memos/5-systems/migrations"
timestamp="$(date +%Y%m%d-%H%M%S)"
snapshot_path="$SNAPSHOT_DIR/snapshot-$timestamp.md"

mkdir -p "$SNAPSHOT_DIR"

{
  echo "# Migration Snapshot"
  echo
  echo "- timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "- source_path: $source_root"
  echo
  echo "## nix-darwin generations"
  if command -v darwin-rebuild >/dev/null 2>&1; then
    darwin-rebuild --list-generations 2>&1 || true
  else
    echo "darwin-rebuild not found"
  fi
  echo
  echo "## homebrew casks"
  if command -v brew >/dev/null 2>&1; then
    brew list --cask 2>&1 || true
  else
    echo "brew not found"
  fi
} > "$snapshot_path"

echo "rbff: migration snapshot saved to $snapshot_path"
