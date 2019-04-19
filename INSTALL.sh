#!bin/bash

# MASTER INSTALLATION FILE

export DEBIAN_FRONTEND=noninteractive
cd ~/dotfiles/linux/ && chmod +x ./install.sh && ./install 2>&1 | tee install-logs.txt