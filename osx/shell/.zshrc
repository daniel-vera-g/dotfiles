source $HOME/.exports

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
 plugins=(git node npm, brew osx);

# User configuration
export PATH="/usr/local/bin:$PATH"
source $ZSH/oh-my-zsh.sh

# Source stuff from external files
source $HOME/.alias
source $HOME/.function
source $HOME/.path

# z
. ~/z.sh

# Syntax Highlighting
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export CLICOLOR=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. `brew --prefix`/etc/profile.d/z.sh
export NVM_DIR="/Users/danielvg/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
