echo "####################################################################################"
echo "************************ Installing notable editor ************************"
echo "####################################################################################"

(cd ~/Downloads && curl -LO https://github.com/notable/notable/releases/download/v1.5.1/notable_1.5.1_amd64.deb && sudo dpkg -i notable_1.5.1_amd64.deb)
