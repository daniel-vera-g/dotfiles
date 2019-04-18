echo "####################################################################################"
echo "************************ Testing the application installation ************************"
echo "####################################################################################"

######################################

# Installing Applications

echo "###################################### STARTING WITH ALL THE INSTALLING ###################################### "

######################################

# Create download folder
mkdir ~/Downloads/

dir=~/dotfiles/linux                    # dotfiles directory
echo "The new dotfiles repository is: $dir"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# First some cleanup
echo "###################################### DOING SOME CLEANUP FIRST ###################################### "
chmod +x $dir/apps/cleanup/cleanup.sh && $dir/apps/cleanup/cleanup.sh

# Install priority applications
echo "###################################### INSTALLING ESSENTIAL APPLICATIONS ###################################### "
for e in $dir/apps/essentials/*.sh
do
  echo "Installing essential app $e"
  chmod +x $e && $e
done 

# First install basic apps
for f in $dir/apps/* $dir/apps/npm-packages/*;
do
  echo "Processing $f file..."
  chmod +x $f && $f
done

# Do some Testing
echo "Now doing some testing:"
chmod +x ./check-apps.py && python ./check-apps.py

echo "####################################################################################"
echo "************************ Installing apps ready ************************"
echo "####################################################################################"