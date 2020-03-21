echo "####################################################################################"
echo "************************ Installing autokey ************************"
echo "####################################################################################"

(cd ~/Downloads/ && curl -LO https://github.com/github/hub/releases/download/v2.11.2/hub-linux-amd64-2.11.2.tgz && tar -xvzf hub-linux-amd64-2.11.2.tgz && cd hub-linux-amd64-2.11.2 && sudo ./install)
