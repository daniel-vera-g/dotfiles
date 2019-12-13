echo "####################################################################################"
echo "************************ Installing autokey ************************"
echo "####################################################################################"

# Make sure, python & pip is installed
sudo python3 -m pip uninstall pip && sudo apt install python3-pip --reinstall

pip3 install glances
