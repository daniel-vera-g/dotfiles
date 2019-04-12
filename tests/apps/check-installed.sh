#!/bin/bash

echo "####################################################################################"
echo "************************ Check all packages to be installed succesfully ************************"
echo "####################################################################################"


dir=~/dotfiles/linux                    # dotfiles directory

# Loop through applications and check if installed somwhere in the system
for f in $(find $dir/apps/ -name '*.sh''); do rm dpkg -l | grep -E '^ii' | grep $f; done