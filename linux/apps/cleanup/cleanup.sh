echo "####################################################################################"
echo "************************ Do some clean up before installing ************************"
echo "####################################################################################"

sudo apt update -y && sudo apt upgrade -y && sudo apt-get -f install && apt --fix-broken install
