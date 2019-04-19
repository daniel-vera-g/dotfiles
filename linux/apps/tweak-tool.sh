echo "####################################################################################"
echo "************************ Installing tweak-tool ************************"
echo "####################################################################################"

# if Ubuntu 16.04.6 LTS \n \l
if cat /etc/issue | grep 16; then
	echo "INSTALLING UNITY TWEAK TOOL"
	sudo apt-get install -y unity-tweak-tool
else
	echo "INSTALLING GNOME TWEAK TOOL"
	sudo add-apt-repository universe
	sudo apt-get install -y gnome-tweak-tool
fi
