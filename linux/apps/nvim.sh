echo "####################################################################################"
echo "************************ Installing nvim ************************"
echo "####################################################################################"

sudo apt-get install software-properties-common && sudo add-apt-repository ppa:neovim-ppa/stable && sudo apt-get update && sudo apt-get install neovim

# Python requirements

sudo apt-get install python-dev python-pip python3-dev python3-pip
