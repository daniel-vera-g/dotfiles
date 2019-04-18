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
echo "###################################### DOING SOME CLEANUP FIRST ###################################### "
chmod +x $dir/apps/cleanup/cleanup.sh && $dir/apps/cleanup/cleanup.sh

# Install priority applications
echo "###################################### INSTALLING ESSENTIAL APPLICATIONS ###################################### "
for e in $dir/apps/essentials/*.sh
do
  echo "Installing essential apps $e"
  chmod +x $e && $e
done 

# Loop & install other apps
echo "###################################### INSTALLING GENRAL APPLICATIONS ###################################### "
for f in $dir/apps/*; do
  if [ -d "$d" ]; then         # or:  if test -d "$d"; then
    ( cd "$d" && chmod +x $f && $f )
  fi
done

# for f in $dir/apps/*.sh
# do
#   echo "Processing $f file..."
#   chmod +x $f && $f
# done

# Do some Testing
chmod +x ./check-apps.py && ./check-apps.py

echo "####################################################################################"
echo "************************ Installing apps ready ************************"
echo "####################################################################################"