#!/bin/bash

echo "####################################################################################"
echo "************************ Check all packages to be installed succesfully ************************"
echo "####################################################################################"


dir=~/dotfiles/linux                    # dotfiles directory
apps=()

# Loop through applications and check if installed somwhere in the system
find $dir/apps/ -iname "*.sh" -type f -exec sh -c 'apps=("${apps[@]}" "${0}")' {} \;

for i in "${apps[@]}"; do
	echo $1
done
