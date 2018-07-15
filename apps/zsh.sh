# Installing ZSH

# Install through the package manager
echo "Installing zsh"
# sudo apt-get install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Set default shell
echo "Setting zsh to default shell"
# chsh -s $(which zsh)
chsh -s `which zsh`

# echo "The new Shell is: "
# echo $SHELL