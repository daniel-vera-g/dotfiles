echo "####################################################################################"
echo "************************ Installing nnn ************************"
echo "####################################################################################"

# Install dependencies
sudo apt-get install pkg-config libncursesw5-dev libreadline6-dev && sudo apt-get -f install

# Install nnn
(cd ~/Downloads/ && curl -LO https://github.com/jarun/nnn/releases/download/v2.4/nnn_2.4-1_ubuntu16.04.amd64.deb && sudo dpkg -i nnn_2.4-1_ubuntu16.04.amd64.deb)
