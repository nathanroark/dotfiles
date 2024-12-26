# Fun aliases
# alias stats='bpytop'
# alias info='clear && neofetch | lolcat'
# alias wisdom='fortune | cowsay | lolcat'
# alias bonsai='cbonsai --life 40 --live --multiplier 5 --time 0.1 --infinite'

#-----------------------------------------

# profile
source $HOME/.zprofile

#-----------------------------------------

# brew
# load brew on macos, I dont think this is a problem on Linux (nope)
eval "$(/opt/homebrew/bin/brew shellenv)"

# add brew to path
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
# brew end

#-----------------------------------------

# Bob, the Neovim version manager
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin
# Bob end

#-----------------------------------------

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# nvm end

#-----------------------------------------

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
# bun end

#-----------------------------------------

# pnpm
export PNPM_HOME="/Users/nathan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#-----------------------------------------

# eval "$(oh-my-posh init zsh)" # no theme (default)
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/nathan-tokyo.omp.json)"

#-----------------------------------------

# dumb thing I have to do for work
# export DOCKER_DEFAULT_PLATFORM=linux/amd64

