echo "####################################################################################"
echo "************************ Installing nvim ************************"
echo "####################################################################################"

sudo apt-get install software-properties-common && sudo add-apt-repository ppa:neovim-ppa/stable && sudo apt-get update && sudo apt-get install neovim

# Python requirements

sudo apt-get install python-dev python-pip python3-dev python3-pip

# Install python packages for python Plugins like YCM

sudo pip2 install --upgrade pynvim &&  sudo pip3 install --upgrade pynvim

# Install PLug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
