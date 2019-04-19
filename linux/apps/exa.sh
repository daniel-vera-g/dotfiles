echo "####################################################################################"
echo "************************ Installing exa ************************"
echo "####################################################################################"

# Install exa

(cd ~/Downloads && wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip && sudo apt-get install unzip && unzip exa-linux-x86_64-0.8.0.zip && sudo mv exa-linux-x86_64 /usr/local/bin/exa && rm exa-linux-x86_64-0.8.0.zip)

# Add exa manpage

(cd ~/Downloads/ && wget https://raw.githubusercontent.com/ogham/exa/master/contrib/man/exa.1 && sudo mv exa.1 /usr/share/man/man1/)

# Bash autocompletion

(cd ~/Downloads && sudo apt-get install bash-completion && sudo wget https://raw.githubusercontent.com/ogham/exa/master/contrib/completions.bash -O /etc/bash_completion.d/exa-completions.bash)
