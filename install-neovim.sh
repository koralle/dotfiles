#!/bin/bash

sudo apt-get update -yq && sudo apt-get upgrade -yq

if !(type curl >/dev/null 2>&1); then
  echo "'curl' does not exist. Start installing..."
  sudo apt-get install -yq curl
fi 

curl -OL https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

if [ -f "nvim.appimage" ]; then
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract >/dev/null
else
  exit 1
fi

if [ -d "squashfs-root" ]; then
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
else
  exit 1
fi

if type nvim >/dev/null 2>&1; then
  # ex) Installing Neovim v0.6.1 has been completed.
  echo "Installing Neovim $(nvim --version | head -n 1 | awk '{print $2}') has been completed."
  rm ./nvim.appimage
else
  exit 1
fi

# Installing Packer.nvim ...
git clone --depth 1 https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim

if [ -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  echo "Installing packer.nvim has been completed."
  exit 0
else
  echo "Installing packer.nvim has been failed."
  exit 1
fi
