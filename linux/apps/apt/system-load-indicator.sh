echo "####################################################################################"
echo "************************ Installing system load indicator ************************"
echo "####################################################################################"

sudo add-apt-repository ppa:indicator-multiload/stable-daily && sudo apt-get update && sudo apt-get install -y indicator-multiload
