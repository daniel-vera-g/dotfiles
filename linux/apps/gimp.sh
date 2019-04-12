echo "####################################################################################"
echo "************************ Installing gimp ************************"
echo "####################################################################################"

sudo apt-get autoremove gimp gimp-plugin-registry

sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt-get update

sudo apt-get install gimp
