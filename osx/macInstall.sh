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

dir=~/dotfiles/osx                    # dotfiles directory
echo "The new dotfiles repository is: $dir"

olddir=~/dotfiles_old             # old dotfiles backup directory
echo "The backup directory is: $olddir"

files="bashrc vimrc vim zshrc hyper tmux.conf path function exports alias gitignore_global gitconfig textlintrc prettierrc markdownlintrc eslintrc"    # list of files/folders to symlink in homedir
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

# TODO

# Install spaship theme
npm install -g spaceship-prompt

git cloneclone https://github.com/denysdovhan/spaceship-prompt.git  https://github. "$ZSH_CUSTOM/themes/spaceship-prompt"

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "###################################### STARTING WITH ALL THE INSTALLING ###################################### "

######################################


# echo "Starting to installing the applications"

# for f in $dir/apps/*.sh
# do
#   echo "Processing $f file..."
#   chmod +x $f && $f
# done

######################################

# Creating Symlinks for the dotfiles

echo "###################################### DOTFILES ######################################"

######################################

# Bunch of symlinks

echo "Creating simlinks for the linters"
ln -s "$dir/linter/.eslintrc" ~/.eslintrc
ln -s "$dir/linter/.markdownlintrc" ~/.markdownlintrc
ln -s "$dir/linter/.prettierrc" ~/.prettierrc
ln -s "$dir/linter/.textlintrc" ~/.textlintrc

echo "Creating simlinks for git"
ln -s "$dir/shell/git/.gitconfig" ~/.gitconfig
ln -s "$dir/shell/git/.gitignore_global" ~/.gitignore_global

echo "Creating simlinks for vim"
ln -s "$dir/shell/vim/.vimrc" ~/.vimrc

echo "Creating symlinks for Shell configuration"
ln -s "$dir/shell/.alias" ~/.alias
ln -s "$dir/shell/.exports" ~/.exports
ln -s "$dir/shell/.function" ~/.function
ln -s "$dir/shell/.path" ~/.path
ln -s "$dir/shell/.tmux.conf" ~/.tmux.conf
ln -s "$dir/shell/.bashrc" ~/.bashrc
ln -s "$dir/shell/.hyper" ~/.hyper
ln -s "$dir/shell/.zshrc" ~/.zshrc
ln -s "$dir/shell/z.sh" ~/z.sh

echo "+++++++++++++++++++++++++++++ Done +++++++++++++++++++++++++++++"
echo "Don't forget to configure SSH properly with key and config"
echo "TODO install toptracker, libre office, whatever(evernote) and dropbox"
