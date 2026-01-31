#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
RBFF_FLAKE_REF="${RBFF_FLAKE_REF:-$REPO_ROOT#rbff}"

brew_path() {
  local brew_bin
  if brew_bin="$(command -v brew 2>/dev/null)"; then
    echo "$brew_bin"
    return 0
  fi
  if [[ -x /opt/homebrew/bin/brew ]]; then
    echo "/opt/homebrew/bin/brew"
    return 0
  fi
  if [[ -x /usr/local/bin/brew ]]; then
    echo "/usr/local/bin/brew"
    return 0
  fi
  return 1
}

ensure_nix() {
  if ! command -v nix >/dev/null 2>&1; then
    curl -sSfL https://install.determinate.systems/nix | sh -s -- install
  fi
}

ensure_brew() {
  if ! brew_path >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

run_darwin_switch() {
  local sudo_cmd=""
  if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
    sudo_cmd="sudo"
  fi
  if command -v darwin-rebuild >/dev/null 2>&1; then
    $sudo_cmd darwin-rebuild switch --flake "$RBFF_FLAKE_REF" --impure
  else
    $sudo_cmd nix --extra-experimental-features "nix-command flakes" \
      run github:LnL7/nix-darwin -- switch --flake "$RBFF_FLAKE_REF" --impure
  fi
}

ensure_nix
ensure_brew
run_darwin_switch
