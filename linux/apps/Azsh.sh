# Installing ZSH

echo "************************ Installing zsh ************************"

# Install through the package manager
echo "Installing zsh"
apt-get install zsh
apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Set Syntax highlighting
echo "Installing Sytanx highlighting"
cd ~ && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git  

# Set default shell
echo "Setting zsh to default shell"
chsh -s `which zsh`
