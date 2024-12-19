#!/usr/bin/env sh
# This script is for devpod setup
# Devpods runs this script to setup the dev environment
echo ========== 📜 Copying configs ==========
# TODO: idk if this works yet, 
#    revisit if things don't work next time i build the DevPod
mkdir -p ~/dotfiles
cp -Rv .* ~/dotfiles/

echo ========== 📦 Installing packages ==========
sh scripts/install_neovim.sh
sh scripts/install_tmux.sh
# gnu stow from apt
sudo apt-get install -y stow

echo ========== 🧩 Installing plugins ==========

# setup config with stow
echo ========== 📦 Stowing configs ==========


echo ========== 🚀 Setup complete ==========
