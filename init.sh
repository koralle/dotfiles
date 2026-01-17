#!/bin/sh

set -e # -e: exit on error

if [ "$(command -v curl)" ]; then
  # Lix経由でNixをインストール
  curl -sSf -L https://install.lix.systems/lix | sh -s -- install
  exec $SHELL
else
  echo "To install Nix with `Lix`, you must have curl installed." >&2
  exit 1
fi

