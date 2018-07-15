# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="amuse"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
# ZSH_THEME="robbyrussell"

# TEST
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Custom Plugins to load
 plugins=(git node npm);

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run 'alias'.

#change directory shortcuts 
alias dropbox='cd ~/Dropbox'
alias downloads='cd ~/Downloads'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias ga='git add'
alias gaa='git add .'
alias gap='git add -p'
alias gp='git push'
alias gl='git log'
alias wow='git log --all --graph --decorate --oneline --simplify-by-decoration'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gmamend='git commit --amend'
alias gb='git branch'
alias gc='git checkout'
alias gcl='git checkout -'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias gmer='git merge'
alias gfr='git fetch -p && git rebase'
alias gcontr='git shortlog -sn'
alias gl='git diff --shortstat "@{0 day ago}'
alias prune='git remote update --prune'
#commands
alias ls='ls -a'
alias copy='pwd|pbcopy'
alias rm="rm -rf"
alias zshrc='vim ~/.zshrc'
alias hyper="vim ~/.hyper.js"
alias refresh="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"

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
