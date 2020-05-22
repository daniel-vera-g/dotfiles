echo "####################################################################################"
echo "************************ Installing texlive ************************"
echo "####################################################################################"


sudo apt-get update -y && sudo apt install -y texlive-latex-extra && sudo apt-get install -y chktex && sudo add-apt-repository universe && sudo apt install python3-proselint && sudo apt-get install -y lacheck
