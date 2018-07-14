#!/bin/bash
############################

# .install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

############################

echo "Loading variables"

# Variables

dir=~/dotfiles                    # dotfiles directory
echo "The new dotfiles repository is: " + dir

olddir=~/dotfiles_old             # old dotfiles backup directory
echo "The backup directory is: " + olddir

files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
echo "The files and folders that are going to be backed up are: " + files

# Update dotfiles itself first

echo "Updating repository"
if is-executable git -a -d "~/dotfiles/.git"; then git --work-tree="~/dotfiles" --git-dir="~/dotfiles/.git" pull origin master; fi

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

# Bunch of symlinks

echo "Creating symlinks"
ln -sfv "./shellSettings/.bashrc" ~
ln -sfv "./shellSettings/.hyper" ~
ln -sfv "./shellSettings/.zshrc" ~

# System stuff

echo "Setting different environement variables and settings"

# TODO

# Apps

echo "Starting to installing the applications"

zsh
oh-my-zsh
syntax highlighing

# Package managers & packages

echo "Starting to install package managers"

npm
node

# End

echo "******************** Done ********************"
echo "Don't forget to configure SSH properly with key and config"

