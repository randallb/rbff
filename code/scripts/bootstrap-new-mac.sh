#!/usr/bin/env bash
set -euo pipefail

RBFF_REPO_DEFAULT="${RBFF_REPO_DEFAULT:-$HOME/code/rbff}"
RBFF_REMOTE_DEFAULT="${RBFF_REMOTE_DEFAULT:-https://github.com/randallb/rbff.git}"

require_xcode_clt() {
  if xcode-select -p >/dev/null 2>&1; then
    return 0
  fi

  echo "rbff bootstrap: Xcode Command Line Tools are required." >&2
  echo "rbff bootstrap: launching 'xcode-select --install'." >&2
  xcode-select --install || true
  echo "rbff bootstrap: finish the install, then rerun this script." >&2
  exit 1
}

require_git() {
  if command -v git >/dev/null 2>&1; then
    return 0
  fi

  echo "rbff bootstrap: git is required but was not found after CLT check." >&2
  exit 1
}

sync_repo() {
  local repo_dir
  repo_dir="$RBFF_REPO_DEFAULT"

  mkdir -p "$(dirname "$repo_dir")"

  if [[ -d "$repo_dir/.git" ]]; then
    echo "rbff bootstrap: updating existing git checkout at $repo_dir"
    git -C "$repo_dir" pull --ff-only
    return 0
  fi

  if [[ -d "$repo_dir/.sl" ]]; then
    echo "rbff bootstrap: existing Sapling checkout detected at $repo_dir"
    if command -v sl >/dev/null 2>&1; then
      sl -R "$repo_dir" pull -u
      return 0
    fi
    echo "rbff bootstrap: 'sl' not found; leaving existing checkout in place." >&2
    return 0
  fi

  if [[ -e "$repo_dir" ]]; then
    echo "rbff bootstrap: path exists but is not an rbff checkout: $repo_dir" >&2
    exit 1
  fi

  echo "rbff bootstrap: cloning $RBFF_REMOTE_DEFAULT to $repo_dir"
  git clone "$RBFF_REMOTE_DEFAULT" "$repo_dir"
}

run_doctor() {
  echo "rbff bootstrap: running rbff doctor"
  "$RBFF_REPO_DEFAULT/code/scripts/doctor.sh"
}

main() {
  require_xcode_clt
  require_git
  sync_repo
  run_doctor
}

main "$@"
