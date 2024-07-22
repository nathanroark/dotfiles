# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/home/nathan/.local/share/bob/nvim-bin


# Fun aliases
alias stats='bpytop'
alias info='clear && neofetch | lolcat'
alias wisdom='fortune | cowsay | lolcat'
alias bonsai='cbonsai --life 40 --live --multiplier 5 --time 0.1 --infinite'

# profile
source $HOME/.zprofile

# load brew on macos, I dont think this is a problem on Linux (nope)
# eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/nathan/.bun/_bun" ] && source "/home/nathan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# # Start tmux on shell startup
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   exec tmux
# fi

[[ -s "/home/nathan/.gvm/scripts/gvm" ]] && source "/home/nathan/.gvm/scripts/gvm"
