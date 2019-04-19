#!bin/bash

export DEBIAN_FRONTEND=noninteractive
cd ~/dotfiles/tests/apps && chmod +x ./app-test.sh && ./app-test.sh 2>&1 | tee install-logs.txt