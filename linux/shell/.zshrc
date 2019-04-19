# Source exports first to get other stuff working
source $HOME/.exports

ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load.
ZSH_THEME="spaceship"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

# Custom Plugins to load
# plugins=(git node npm vi-mode safe-paste); -> Problem with history search in vi-mode
plugins=(git git-open node npm safe-paste fasd);

# Make search up and down work, so partially type and hit up/down to find relevant stuff -> FIX vi-mode break
bindkey '^[[A' up-line-or-search                                                
bindkey '^[[B' down-line-or-search

# User config
source $ZSH/oh-my-zsh.sh

# Source stuff from external files
source $HOME/.alias
source $HOME/.function
source $HOME/.path

# Colors in terminal
TERM=xterm-256color

# Syntax Highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# General color settings
LS_COLORS=$LS_COLORS:'ow=37;42:'

# Set colors of autocomplete as the same as ls
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
# compinit
autoload -Uz compinit

# Fuzzy file finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# Command palette bookmarker
[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

eval $(thefuck --alias)