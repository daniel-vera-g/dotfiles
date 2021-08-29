 #!/bin/sh

export DEBIAN_FRONTEND=noninteractive

# Run install script and save logs in install file
cd ~/dotfiles/linux/ && chmod +x ./install.sh && ./install.sh 2>&1 | tee install-logs.txt
