echo "####################################################################################"
echo "************************ Installing Virtual box and vagrant ************************"
echo "####################################################################################"

# Install Virtualbox

sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian `lsb_release -cs` contrib"

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo apt-get update
sudo apt-get install -y virtualbox-5.2

# Install Vagrant

(cd ~/Downloads && curl -LO https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.deb && sudo dpkg -i vagrant_2.2.4_x86_64.deb)
