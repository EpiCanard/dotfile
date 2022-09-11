#!/bin/sh

function check() {
  which $1 > /dev/null 2>&1
  if [[ $? -eq 1 ]]; then
    echo "Missing dependency $1"
  fi
}

function link() {
  [ ! -d "$CONFIG/$1" ] && (ln -s "$PWD/$1" "$CONFIG/$1" && echo "$1 linked") || echo "$1 already linked"
}

CONFIG=${XDG_CONFIG_HOME:-~/.config}

echo "== Checking Dependencies =="
check "nvim"
check "stylua"

echo "== Linking folders =="
link "nvim"
link "stylua"
