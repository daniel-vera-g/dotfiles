echo "####################################################################################"
echo "************************ Installing fd for searching ************************"
echo "####################################################################################"
# Install fd for searching

(cd ~/Downloads/ && curl -LO https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-musl_7.3.0_amd64.deb && sudo dpkg -i fd-musl_7.3.0_amd64.deb)
