#!/bin/sh

check() {
  if ! command -v "$1" >/dev/null 2>&1; then
    printf 'Missing dependency: %s\n' "$1" >&2
    return 1
  fi
}

link() {
  source_dir=$REPO_DIR/$1
  target=$CONFIG/$1

  if [ -L "$target" ] && [ "$(CDPATH= cd -P "$target" 2>/dev/null && pwd -P)" = "$source_dir" ]; then
    printf '%s already linked\n' "$1"
    return 0
  fi

  if [ -e "$target" ] || [ -L "$target" ]; then
    printf 'Cannot link %s: %s already exists and points elsewhere\n' "$1" "$target" >&2
    return 1
  fi

  ln -s "$source_dir" "$target" || return 1
  printf '%s linked\n' "$1"
}

REPO_DIR=$(CDPATH= cd -P "$(dirname "$0")" && pwd -P) || exit 1
CONFIG=${XDG_CONFIG_HOME:-"$HOME/.config"}

echo "== Checking Dependencies =="
missing=0
check "nvim" || missing=1
check "stylua" || missing=1
[ "$missing" -eq 0 ] || exit 1

echo "== Linking folders =="
mkdir -p "$CONFIG" || exit 1
result=0
link "nvim" || result=1
link "stylua" || result=1
exit "$result"
