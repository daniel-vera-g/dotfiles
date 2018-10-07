 echo "########################################"
 
 echo "Install the spaceship theme"
 
 echo "########################################"
 
 ZSH_CUSTOM=/home/dvg/.oh-my-zsh/custom
 THEME_FOLDER=$ZSH_CUSTOM/themes/spaceship-prompt
 
 git clone https://github.com/denysdovhan/spaceship-prompt.git $THEME_FOLDER
 
 ln -s "$THEME_FOLDER/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
                                                                                            
