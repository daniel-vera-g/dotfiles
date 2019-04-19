#!bin/bash

export DEBIAN_FRONTEND=noninteractive
cd ~/dotfiles/tests/apps && chmod +x ./helper/app-test.sh && ./helper/app-test.sh 2>&1 | tee apps-install-logs.txt