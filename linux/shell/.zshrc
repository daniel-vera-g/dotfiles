source $HOME/.exports

ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# ZSH_THEME="amuse"
ZSH_THEME="spaceship"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
# ZSH_THEME="robbyrussell"

# TEST
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Custom Plugins to load
plugins=(git node npm docker docker-compose);

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh

# Source stuff from external files
source $HOME/.alias
source $HOME/.function
source $HOME/.path

# z
. ~/z.sh

# Syntax Highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Cutomizing of the Colors for LS & autocomplete
alias ls="ls --color=auto"
# General color settings
LS_COLORS=$LS_COLORS:'ow=37;42:'
# Set colors of autocomplete as the same as ls
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
# compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
