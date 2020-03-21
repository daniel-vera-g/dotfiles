echo "####################################################################################"
echo "************************ Installing tldr ************************"
echo "####################################################################################"

mkdir -p ~/bin
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x ~/bin/tldr
complete -W "$(tldr 2>/dev/null --list)" tldr
