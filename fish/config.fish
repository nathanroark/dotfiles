if status is-interactive
    # Commands to run in interactive sessions can go here
and not set -q TMUX
    exec tmux
end

# Theme -----------------------------------------------------------------------
fish_config theme choose "Rosé Pine"


# Fun aliases -----------------------------------------------------------------
alias stats 'bpytop'
alias info 'clear; neofetch'
alias wisdom 'fortune | cowsay'
alias bonsai 'cbonsai --life 40 --live --multiplier 5 --time 0.1 --infinite'
alias pipes 'pipes -t 0 -p 3 -R -f 50 -r 6000'

# Paths -----------------------------------------------------------------------
set -x PATH "$HOME/.cargo/env" $PATH
set -x PATH "/home/nathan/.local/share/bob/nvim-bin" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/nathan/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
