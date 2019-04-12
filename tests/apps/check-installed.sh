#!/bin/bash

echo "####################################################################################"
echo "************************ Check all packages to be installed succesfully ************************"
echo "####################################################################################"


dir=~/dotfiles/linux                    # dotfiles directory
apps=()

# Get all applications and save in array
for i in $(find $dir/apps/ -iname "*.sh" -type f); do
        echo $i
		apps+=($i)
done

echo "-----------------------------------"
printf '%s\n' "${apps[@]}"

# Extrect name from path
regex='.*?(?:[a-z][a-z]+).*?(?:[a-z][a-z]+).*?(?:[a-z][a-z]+).*?(?:[a-z][a-z]+).*?(?:[a-z][a-z]+).*?((?:[a-z][a-z]+))'

	