#!/bin/bash
############################

# .install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

############################

######################################

# Setup

echo "###################################### STARTING WITH SETUP ######################################"

######################################

echo "Loading variables"

# Variables

dir=~/dotfiles                    # dotfiles directory
echo "The new dotfiles repository is: $dir"

olddir=~/dotfiles_old             # old dotfiles backup directory
echo "The backup directory is: $olddir"

files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
echo "The files and folders that are going to be backed up are: $files"

# Update dotfiles itself first

echo "Updating repository"
# if is-executable git -a -d "~/dotfiles/.git"; then git --work-tree="~/dotfiles" --git-dir="~/dotfiles/.git" pull origin master; fi
git fetch -p && git rebase

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory
echo "move any existing dotfiles in homedir to dotfiles_old directory"
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
	# TODO
    # echo "Creating symlink to $file in home directory."
    # ln -s $dir/$file ~/.$file
done

######################################

# Installing Applications

echo "###################################### STARTING WITH ALL THE INSTALLEMENTS ###################################### "

######################################


echo "Starting to installing the applications"

for f in $dir/apps/*.sh
do
  echo "Processing $f file..."
  chmod +x $f && $f
done

######################################

# Creating Symlinks for the dotfiles

echo "###################################### DOTFILES ######################################"

######################################

# Bunch of symlinks

echo "Creating simlinks for git"
ln -sfv "$dir/git/.gitconfig" ~
ln -sfv "$dir/git/.gitignore_global" ~

echo "Creating simlinks for vim"
ln -sfv "$dir/vim/.vimrc" ~

echo "Creating symlinks for Shell configuration"
ln -sfv "$dir/shellSettings/.bashrc" ~
ln -sfv "$dir/shellSettings/.hyper" ~
ln -sfv "$dir/shellSettings/.zshrc" ~

echo "Creating simlinks for the linters"
ln -sfv "$dir/linter/.eslintrc" ~
ln -sfv "$dir/linter/.markdownlintrc" ~
ln -sfv "$dir/linter/.prettierrc" ~
ln -sfv "$dir/linter/.textlintrc" ~

echo "Creating system simlinks"
ln -sfv "$dir/system/.alias" ~
ln -sfv "$dir/system/.exports" ~
ln -sfv "$dir/system/.function" ~
ln -sfv "$dir/system/.path" ~
ln -sfv "$dir/system/.tmux.conf" ~
ln -sfv "$dir/system/.redshfit.conf" ~/.config
ln -sfv "$dir/system/terminator/config" ~/.config/
ln -sfv "$dir/system/download_and_install.sh" ~
ln -sfv "$dir/system/z.sh" ~

echo "+++++++++++++++++++++++++++++ Done +++++++++++++++++++++++++++++"
echo "Don't forget to configure SSH properly with key and config"
echo "TODO install toptracker, libre office, whatever(evernote) and dropbox"
