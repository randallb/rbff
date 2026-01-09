#!/usr/bin/env bash
set -euo pipefail

RBFF_REPO_DEFAULT="${RBFF_REPO_DEFAULT:-$HOME/code/rbff}"
RBFF_BIN_TARGET="${RBFF_BIN_TARGET:-$HOME/.local/bin/rbff}"
RBFF_REMOTE_DEFAULT="${RBFF_REMOTE_DEFAULT:-https://github.com/randallb/rbff.git}"

ensure_local_bin() {
  mkdir -p "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
}

ensure_nix() {
  if ! command -v nix >/dev/null 2>&1; then
    curl -sSfL https://install.determinate.systems/nix | sh -s -- install
  fi
}

ensure_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

ensure_repo() {
  if [[ ! -d "$RBFF_REPO_DEFAULT" ]]; then
    mkdir -p "$(dirname "$RBFF_REPO_DEFAULT")"
    if command -v sl >/dev/null 2>&1; then
      sl clone "$RBFF_REMOTE_DEFAULT" "$RBFF_REPO_DEFAULT"
    else
      nix --extra-experimental-features "nix-command flakes" \
        shell nixpkgs#sapling -c sl clone "$RBFF_REMOTE_DEFAULT" "$RBFF_REPO_DEFAULT"
    fi
  fi
}

install_rbff_cli() {
  ensure_local_bin
  if [[ -f "$RBFF_REPO_DEFAULT/bin/rbff" ]]; then
    cp "$RBFF_REPO_DEFAULT/bin/rbff" "$RBFF_BIN_TARGET"
    chmod +x "$RBFF_BIN_TARGET"
  fi
}

ensure_nix
ensure_brew
ensure_repo
install_rbff_cli
if [[ -f "$RBFF_BIN_TARGET" ]]; then
  "$RBFF_BIN_TARGET" doctor "$@"
elif [[ -f "$RBFF_REPO_DEFAULT/bin/rbff" ]]; then
  "$RBFF_REPO_DEFAULT/bin/rbff" doctor "$@"
fi
