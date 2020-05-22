echo "####################################################################################"
echo "************************ Installing mgitstatus ************************"
echo "####################################################################################"

(cd ~/Downloads && curl -s -o mgitstatus https://raw.githubusercontent.com/fboender/multi-git-status/master/mgitstatus && chmod 755 mgitstatus && sudo mv mgitstatus /usr/local/bin/)
