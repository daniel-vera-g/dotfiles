echo "####################################################################################"
echo "************************ Installing lazydocker ************************"
echo "####################################################################################"

(cd ~/Downloads/ && curl -LO https://github.com/jesseduffield/lazydocker/releases/download/v0.2.5/lazydocker_0.2.5_Linux_x86_64.tar.gz && tar -xvzf lazydocker_0.2.5_Linux_x86_64.tar.gz && sudo install lazydocker /usr/local/bin)
