echo "####################################################################################"
echo "************************ Testing the application installation ************************"
echo "####################################################################################"

######################################

# Installing Applications

echo "###################################### STARTING WITH ALL THE INSTALLING ###################################### "

######################################

dir=~/dotfiles/linux                    # dotfiles directory
echo "The new dotfiles repository is: $dir"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# First some cleanup
chmod +x $dir/apps/cleanup/cleanup.sh && $dir/apps/cleanup/cleanup.sh

# Loop & install
for f in $dir/apps/*.sh
do
  echo "Processing $f file..."
  chmod +x $f && $f
done

echo "####################################################################################"
echo "************************ Installing apps ready ************************"
echo "####################################################################################"
