# Source exports first to get other stuff working
source $HOME/.path
source $HOME/.exports

# FZF config
export FZF_BASE=~/.fzf.zsh

ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load.
ZSH_THEME="spaceship"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'

# Custom Plugins to load
# plugins=(git node npm vi-mode safe-paste); -> Problem with history search in vi-mode
plugins=(git git-open node npm safe-paste fasd fzf docker docker-compose zsh-autosuggestions fd flutter);

# No more needed ?
# fpath=(~/.zsh/completions $fpath)
# Better for perfomance, than using in plugins.
# See: https://github.com/zsh-users/zsh-completions/issues/603
fpath=($ZSH/custom/plugins/zsh-completions/src $fpath)
autoload -U compinit && compinit

# User config
source $ZSH/oh-my-zsh.sh
# Automatically update
DISABLE_UPDATE_PROMPT=true

# Source stuff from external files
source $HOME/.alias
source $HOME/.function
source $HOME/.docker_aliases
source $HOME/.local-aliases
# TODO: https://github.com/flutter/flutter/issues/31293
# source $HOME/.flutter_completions

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
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# TODO rm for gh
# Hub alias for git
# eval "$(hub alias -s)"

eval $(thefuck --alias)

# Make search up and down work, so partially type and hit up/down to find relevant stuff -> FIX vi-mode break
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dvg/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dvg/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dvg/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dvg/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

