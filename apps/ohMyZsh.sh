# Installing Oh-my-zhs

# Installing with wget
echo "Installing Oh-my-Zhs"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Reload
echo "Update .zshrc"
source ~/.zshrc

# Set Syntax highlighting
cd ~ && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git  