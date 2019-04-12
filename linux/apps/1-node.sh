echo "####################################################################################"
echo "************************ Installing nodejs & npm ************************"
echo "####################################################################################"

echo "First make sure we have curl installed"
sudo apt-get install curl

echo "Now let's get node & npm up and running"
sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs