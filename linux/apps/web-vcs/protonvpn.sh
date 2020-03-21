echo "####################################################################################"
echo "************************ Installing protonvpn ************************"
echo "####################################################################################"

(cd ~/Downloads && sudo apt update && sudo apt-get install -y openvpn dialog python wget && sudo wget -O protonvpn-cli.sh https://raw.githubusercontent.com/ProtonVPN/protonvpn-cli/master/protonvpn-cli.sh && sudo chmod +x protonvpn-cli.sh && sudo ./protonvpn-cli.sh --install)
