echo "####################################################################################"
echo "************************ Installing Pandoc eisvogel template ************************"
echo "####################################################################################"

(mkdir -p ~/workspace/tools/ && cd ~/workspace/tools/ && git clone https://github.com/Wandmalfarbe/pandoc-latex-template.git && mkdir ~/.pandoc/templates/ && ln -sf pandoc-latex-template/eisvogel.tex  ~/.pandoc/templates/eisvogel.latex)
