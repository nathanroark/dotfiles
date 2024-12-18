#!/usr/bin/env sh
# This script is for devpod setup
# Devpods runs this script to setup the dev environment
echo ========== 📜 Copying configs ==========
mkdir -p ~/.config
cp -Rv .config/* ~/.config/

sh scripts/install_neovim.sh
sh scripts/install_tmux.sh
