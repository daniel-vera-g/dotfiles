echo "####################################################################################"
echo "************************ Installing the spaceship zsh theme ************************"
echo "####################################################################################"

# Install the spaceship theme

sudo npm install -g spaceship-prompt

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
