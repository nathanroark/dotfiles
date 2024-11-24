# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# To change settings, run `p10k configure` or manually edit `~/.p10k.zsh`.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/.local/share/bob/nvim-bin

# Fun aliases
# alias stats='bpytop'
# alias info='clear && neofetch | lolcat'
# alias wisdom='fortune | cowsay | lolcat'
# alias bonsai='cbonsai --life 40 --live --multiplier 5 --time 0.1 --infinite'

# profile
source $HOME/.zprofile

# load brew on macos, I dont think this is a problem on Linux (nope)
eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#[[ -s "/home/nathan/.gvm/scripts/gvm" ]] && source "/home/nathan/.gvm/scripts/gvm"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/nathan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Go and Go packages with GOPATH
# export GOPATH=/Users/nathan/go

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



#-----------------------------------------
export DOCKER_DEFAULT_PLATFORM=linux/amd64
