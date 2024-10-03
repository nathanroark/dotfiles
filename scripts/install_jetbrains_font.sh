#!/bin/bash

declare -a fonts=(
    JetBrainsMono
)

version='2.1.0'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
    zip_file="${font}.zip"
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
    echo "Downloading $download_url"
    wget "$download_url"
    unzip "$zip_file" -d "$fonts_dir"
    rm "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv

# also make bob usable
#

#
# export PATH="$PATH:$HOME/.local/share/bob/nvim-bin"
#
# # Alias definitions.
# # You may want to put all your additions into a separate file like
# # ~/.bash_aliases, instead of adding them here directly.
# # See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi
#
# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi
# . "$HOME/.cargo/env"
#
# export PATH="$PATH:/opt/nvim-linux64/bin"
#
# mkdir -p ~/.local/share/bash-completion/completions
# bob complete bash >> ~/.local/share/bash-completion/completions/bob
#
# # alias nvim='$HOME/.local/share/bob/v0.10.1/nvim-linux64/bin/nvim'
