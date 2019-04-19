echo "####################################################################################"
echo "************************ Installing ghi(for issues) ************************"
echo "####################################################################################"

curl -sL https://raw.githubusercontent.com/stephencelis/ghi/master/ghi > ghi && \
chmod 755 ghi && \
sudo mv ghi /usr/local/bin
