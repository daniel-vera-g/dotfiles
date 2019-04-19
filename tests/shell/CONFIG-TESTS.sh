#!bin/bash

export DEBIAN_FRONTEND=noninteractive
cd ~/dotfiles/tests/config && chmod +x ./helper/config-tests.sh && ./helper/config-tests.sh 2>&1 | tee install-logs.txt