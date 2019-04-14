echo "####################################################################################"
echo "************************ Installing nvim ************************"
echo "####################################################################################"

sudo apt-get install software-properties-common && sudo add-apt-repository ppa:neovim-ppa/stable && sudo apt-get update && sudo apt-get install neovim

# Python requirements

sudo apt-get install python-dev python-pip python3-dev python3-pip

# Remove alternatives

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor