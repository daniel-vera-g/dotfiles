#!/bin/bash
############################

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

############################

######################################

# Setup

echo "###################################### STARTING WITH SETUP ######################################"

######################################

echo "Loading variables"

dir=~/dotfiles/linux                    # dotfiles directory
echo "The new dotfiles repository is: $dir"

olddir=~/dotfiles_old             # old dotfiles backup directory
echo "The backup directory is: $olddir"

files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
echo "The files and folders that are going to be backed up are: $files"

# Update dotfiles itself first

echo "Updating repository"
# if is-executable git -a -d "~/dotfiles/.git"; then git --work-tree="~/dotfiles" --git-dir="~/dotfiles/.git" pull origin master; fi
git fetch -p && git rebase origin master

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

echo "Move any existing dotfiles in homedir to dotfiles_old directory"
for file in $files; do
    echo "Moving $file from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
done

######################################

# Creating Symlinks for the dotfiles

echo "####################################################################################"
echo "************************ SIMLINKS FOR THE DOTFILES ************************"
echo "####################################################################################"


######################################

# Bunch of symlinks

echo "###################################### SIMLINKS FOR LINTERS ######################################"
ln -sfv "$dir/linter/.eslintrc" ~
ln -sfv "$dir/linter/.markdownlintrc" ~
ln -sfv "$dir/linter/.prettierrc" ~
ln -sfv "$dir/linter/.textlintrc" ~

echo "###################################### SIMLINKS FOR GIT ######################################"
ln -sfv "$dir/shell/git/.gitconfig" ~
ln -sfv "$dir/shell/git/.gitignore_global" ~

echo "###################################### SIMLINKS FOR GLANCES ######################################"

# Create config if not existent
mkdir ~/.config/
ln -sfv "$dir/shell/glances/glances.conf" ~/.config/

echo "###################################### SIMLINKS FOR NVIM ######################################"
ln -sfv	"$dir/shell/nvim/init.vim" ~/.config/

echo "###################################### SIMLINKS FOR SCRIPTS ######################################"
ln -sfv "$dir/shell/scripts/.function" ~
ln -sfv "$dir/shell/scripts/.docker_aliases" ~

echo "###################################### SIMLINKS FOR VIM ######################################"
ln -sfv "$dir/shell/vim/.vimrc" ~

echo "###################################### SIMLINKS FOR SHELL FUNCTIONS ######################################"
ln -sfv "$dir/shell/.alias" ~
ln -sfv "$dir/shell/.bashrc" ~
ln -sfv "$dir/shell/.tmux.conf" ~
ln -sfv "$dir/shell/.exports" ~
ln -sfv "$dir/shell/.path" ~
ln -sfv "$dir/shell/.z.sh" ~
ln -sfv "$dir/shell/.zshrc" ~

echo "###################################### SIMLINKS FOR SYSTEM APPLICATIONS ######################################"
ln -sfv "$dir/system/terminator/config" ~/.config/

# Make directory for gpg config if not existent
mkdir ~/.gpg/
ln -sfv "$dir/system/gpg.conf" ~/.gpg/

ln -sfv "$dir/system/.redshift.conf" ~/.config/

# Create directory if not existent
mkdir -p ~/.local/share/indicators/application/
ln -sfv "$dir/system/ordering-override.keyfile" ~/.local/share/indicators/application/ordering-override.keyfile

echo "####################################################################################"
echo "************************ SIMLINKING DONE ************************"
echo "####################################################################################"

echo "------------------------------------------------------------------------------------------------------"

echo "###################################### DON'T FORGET TO CONFIGURE SSH PROPERLY WITH KEY AND CONFIG ######################################"
