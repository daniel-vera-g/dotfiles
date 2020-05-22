echo "####################################################################################"
echo "************************ Installing ripgrep ************************"
echo "####################################################################################"

(cd ~/Downloads/ && curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.0/ripgrep_11.0.0_amd64.deb && sudo dpkg -i ripgrep_11.0.0_amd64.deb)
