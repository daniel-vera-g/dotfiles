echo "####################################################################################"
echo "************************ Installing Firefox developer ************************"
echo "####################################################################################"

(cd ~/Downloads/ \
&& curl -LO "https://download-installer.cdn.mozilla.net/pub/devedition/releases/68.0b7/linux-x86_64/en-US/firefox-68.0b7.tar.bz2" \
&& tar -xvf firefox-68.0b7.tar.bz2 \
&& sudo mv ./firefox/ /opt/firefox_dev \
&& sudo ln -s /opt/firefox_dev/firefox /usr/local/bin/firefox_dev \
&& sudo cp ~/dotfiles/linux/system/assets/firefox-developer.desktop /usr/share/applications/firefox-developer.desktop \
&& sudo chmod +x /usr/share/applications/firefox-developer.desktop)
