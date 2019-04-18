# TODO change to makefile

export DEBIAN_FRONTEND=noninteractive
chmod +x ./app-test.sh
./app-test.sh 2>&1 | tee install-logs.txt