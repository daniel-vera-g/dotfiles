#!/bin/bash
############################

# .install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

############################

######################################

# Setup

echo "####################################################################################"
echo "************************ STARTING WITH SETUP ************************"
echo "####################################################################################"

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

# Installing Applications

echo "####################################################################################"
echo "************************ STARTING WITH ALL THE INSTALLING ************************"
echo "####################################################################################"

######################################

# Create download folder
mkdir ~/Downloads/

echo "###################################### DOING SOME CLEANUP FIRST ######################################"
chmod +x $dir/apps/cleanup/cleanup.sh && $dir/apps/cleanup/cleanup.sh

echo "###################################### INSTALLING ESSENTIAL APPLICATIONS ######################################"
for e in $dir/apps/essentials/*.sh
do
  echo "Installing essential app: $e"
  chmod +x $e && $e
done

echo "###################################### INSTALLING GENERAL APPLICATIONS ######################################"
for f in $dir/apps/* $dir/apps/npm-packages/*;
do
  echo "Processing $f file..."
  chmod +x $f && $f
done

echo "###################################### FINALLY DOING SOME INSTALLATION TESTS ######################################"
cd ~/dotfiles/tests/apps/helper/
chmod +x ./check-app-status.py && python ./check-app-status.py

echo "####################################################################################"
echo "************************ INSTALLATION APPS DONE ************************"
echo "####################################################################################"

######################################

# Creating Symlinks for the dotfiles

echo "####################################################################################"
echo "************************ SIMLINKS FOR THE DOTFILES ************************"
echo "####################################################################################"


######################################

# Bunch of symlinks

echo "###################################### SIMLINKS FOR LINTERS ######################################"
ln -sfv "$dir/linter/.eslintrc.json" ~
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
ln -sfv "$dir/shell/scripts/audio/spotify_control" ~/bin/
ln -sfv "$dir/shell/scripts/backup/system/borg-backup.sh" ~/bin/
ln -sfv "$dir/shell/scripts/shortcuts/notes.sh" ~/bin/
ln -sfv "$dir/shell/scripts/misc/emojis" ~/bin/


echo "###################################### SIMLINKS FOR VIM ######################################"
mkdir -p ~/.vim/
ln -sfv "$dir/shell/vim/general.vimrc" ~/.vim/
ln -sfv "$dir/shell/vim/styles.vimrc" ~/.vim/
ln -sfv "$dir/shell/vim/styles.vimrc" ~/.vim/
ln -sfv "$dir/shell/vim/.vimrc" ~

echo "###################################### SIMLINKS FOR SHELL FUNCTIONS ######################################"
ln -sfv "$dir/shell/.alias" ~
ln -sfv "$dir/shell/.bashrc" ~
ln -sfv "$dir/shell/.tmux.conf" ~
ln -sfv "$dir/shell/.exports" ~
ln -sfv "$dir/shell/.path" ~
ln -sfv "$dir/shell/.zshrc" ~
ln -sfv "$dir/shell/.ctags" ~

echo "###################################### SIMLINKS FOR SYSTEM APPLICATIONS ######################################"
mkdir -p ~/.config/terminator
ln -sfv "$dir/system/terminator/config" ~/.config/terminator/

mkdir -p ~/.config/zathura
ln -sfv "$dir/system/zathura/zathurarc" ~/.config/zathura/

mkdir -p ~/.local/bin
ln -sfv "$dir/system/trans" ~/.local/bin/

echo "###################################### Vim config ######################################"
# Make directory vim snippets
mkdir ~/.vim/spell/
for I in $(ls "$dir/shell/vim/spell/"); do cp $dir/shell/vim/spell/$I ~/.vim/spell; done
mkdir ~/.vim/thesaurus/
cp "$dir/shell/vim/thesaurus/moby_thesaurus.txt" ~/.vim/thesaurus/

echo "###################################### vscode config ######################################"
mkdir -p ~/.config/Code/User
ln -sfv "$dir/system/vscode/keybindings.json" ~/.config/Code/User
ln -sfv "$dir/system/vscode/settings.json" ~/.config/Code/User

echo "###################################### SIMLINKS FOR ULTISNIPS ######################################"
# Make directory vim snippets
mkdir ~/.vim/plugged/ultisnips/UltiSnips/
cp "$dir/shell/vim/UltiSnips/c.snippets" ~/.vim/plugged/ultisnips/UltiSnips/
cp "$dir/shell/vim/UltiSnips/pandoc.snippets" ~/.vim/plugged/ultisnips/UltiSnips/
cp "$dir/shell/vim/UltiSnips/plaintex.snippets" ~/.vim/plugged/ultisnips/UltiSnips/
cp "$dir/shell/vim/UltiSnips/tex.snippets" ~/.vim/plugged/ultisnips/UltiSnips/
cp "$dir/shell/vim/UltiSnips/ch.snippets" ~/.vim/plugged/ultisnips/UltiSnips/

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
