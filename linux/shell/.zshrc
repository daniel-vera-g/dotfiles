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
# plugins=(git node npm vi-mode safe-paste); -> Problem with history search in vi-mode
plugins=(git node npm safe-paste);

# make search up and down work, so partially type and hit up/down to find relevant stuff -> FIX vi-mode break
# bindkey '^[[A' up-line-or-search                                                
# bindkey '^[[B' down-line-or-search

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh
# Needed to get git signing commits working
# Source: https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html
export GPG_TTY=$(tty)

# Source stuff from external files
source $HOME/.alias
source $HOME/.function
source $HOME/.path

# nnn file manager
# TODO add big nnn function to external file and source it from here
# source $HOME/quitcd.zsh
export NNN_TMPFILE="/tmp/nnn"

# TODO Add this to function file & just source it from here
n()
{
        nnn "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm $NNN_TMPFILE
        fi
}

export NNN_CONTEXT_COLORS='1234'
export NNN_USE_EDITOR=1

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

# Fuzzy file finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Command palette bookmarker
[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"


eval $(thefuck --alias)
