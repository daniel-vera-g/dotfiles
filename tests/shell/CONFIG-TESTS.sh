 #!/bin/sh

export DEBIAN_FRONTEND=noninteractive
cd ~/dotfiles/tests/config && chmod +x ./helper/config-tests.sh && ./helper/config-tests.sh 2>&1 | tee config-install-logs.txt