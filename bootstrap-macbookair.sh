#!/bin/sh

if [ -f "/etc/bashrc"  ]; then
  sudo rm /etc/bashrc
fi

if [ "$(command -v nix)" ]; then
  
  sudo nix --extra-experimental-features 'nix-command flakes' \
    run "nix-darwin/master#darwin-rebuild" -- switch --flake .#koralle-macbookair
else
  echo "Nix is not installed."
  exit 1
fi
