echo "####################################################################################"
echo "************************ Installing zsh ************************"
echo "####################################################################################"

# Install through the package manager
echo "Installing zsh"
sudo apt-get install -y zsh
sudo apt-get install -y git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

# Set Syntax highlighting
echo "Installing syntax highlighting"
cd ~ && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git  

# Set default shell
echo "Setting zsh to default shell"
chsh -s `which zsh`
