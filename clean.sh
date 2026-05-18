#!/bin/sh

set -e # -e: exit on error

if [ "$(command -v mise)" ]; then
  # miseで管理している依存関係を全てアンインストール
  mise uninstall --all
fi

if [ "$(command -v nix)" ]; then
  # nix-darwinをアンインストール
  # https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#uninstalling
  sudo nix --extra-experimental-features "nix-command flakes" run nix-darwin#darwin-uninstaller
fi

if [ "$(command -v /nix/nix-installer)" ]; then
  # Nixをアンインストール
  # https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#install-determinate-nix
  /nix/nix-installer uninstall --no-confirm

else
  echo "Determinate Nix Installer (/nix/nix-installer) is not installed."
  exit 1
fi
