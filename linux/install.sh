#!/bin/bash
############################

# .install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

############################

# Setup

echo "####################################################################################"
echo "************************ STARTING WITH SETUP ***************************************"
echo "####################################################################################"

######################################

echo "Loading variables"

dir=~/dotfiles/linux                    # dotfiles directory
echo "The new dotfiles repository is: $dir"

olddir=~/dotfiles_old             # old dotfiles backup directory
echo "The backup directory is: $olddir"

files="bashrc zshrc tmux.conf oh-my-zsh"    # list of files/folders to symlink in homedir
echo "The files and folders that are going to be backed up are: $files"

# Update dotfiles itself first
echo "Updating repository"
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

echo "####################################################################################"
echo "************************ SYMLINKING DOTFILES ***************************************"
echo "####################################################################################"


######################################

echo "###################################### SYMLINKS IN ~ ######################################"

ln -sfv "$dir/configs/git/.gitconfig" ~
ln -sfv "$dir/configs/git/.gitignore_global" ~

ln -sfv "$dir/configs/devtools/linter/.eslintrc.json" ~
ln -sfv "$dir/configs/devtools/linter/.markdownlintrc" ~
ln -sfv "$dir/configs/devtools/linter/.prettierrc" ~
ln -sfv "$dir/configs/devtools/linter/.textlintrc" ~

ln -sfv "$dir/scripts/.function" ~
ln -sfv "$dir/scripts/.docker_aliases" ~

ln -sfv "$dir/configs/system/.alias" ~
ln -sfv "$dir/configs/system/.bashrc" ~
ln -sfv "$dir/configs/system/.tmux.conf" ~
ln -sfv "$dir/configs/system/.exports" ~
ln -sfv "$dir/configs/system/.path" ~
ln -sfv "$dir/configs/system/.zshrc" ~
ln -sfv "$dir/configs/system/.ctags" ~

echo "###################################### SYMLINKS IN ~/.config ######################################"


mkdir -p ~/.config/glances
ln -sfv "$dir/configs/glances/glances.conf" ~/.config/

mkdir -p ~/.config/nvim/
ln -sfv	"$dir/configs/nvim/init.vim" ~/.config/nvim

mkdir -p ~/.config/terminator
ln -sfv "$dir/configs/terminator/config" ~/.config/terminator/

mkdir -p ~/.config/zathura
ln -sfv "$dir/configs/zathura/zathurarc" ~/.config/zathura/

mkdir -p ~/.config/Code/User
ln -sfv "$dir/configs/vscode/keybindings.json" ~/.config/Code/User
ln -sfv "$dir/configs/vscode/settings.json" ~/.config/Code/User

mkdir -p "~/.config/~/.config/Code\ -\ Insiders/User"
ln -sfv "$dir/configs/vscode-insiders/keybindings.json" "~/.config/~/.config/Code\ -\ Insiders/User"
ln -sfv "$dir/configs/vscode-insiders/settings.json" "~/.config/~/.config/Code\ -\ Insiders/User"

mkdir -p ~/.config/kitty
ln -sfv "$dir/configs/kitty/kitty.conf" ~/.config/kitty
ln -sfv "$dir/configs/kitty/session.conf" ~/.config/kitty

mkdir -p ~/.config/lazygit/
ln -sfv "$dir/configs/lazygit/config.yml" ~/.config/lazygit

mkdir -p ~/.config/mpv/
ln -sfv "$dir/configs/mpv/mpv.conf" ~/.config/mpv

mkdir -p ~/.config/ncspot/
ln -sfv "$dir/configs/ncspot/config.toml" ~/.config/ncspot

mkdir --p "~/.config/gtk-3.0/"
ln -sfv "$dir/configs/system/gtk.css" "~/.config/gtk-3.0/"

ln -sfv "$dir/configs/redshift/.redshift.conf" ~/.config/

echo "###################################### EXECUTABLE SYMLINKS IN ~/bin/ ######################################"
ln -sfv "$dir/scripts/audio/spotify_control" ~/bin/
ln -sfv "$dir/scripts/backup/system/borg-backup.sh" ~/bin/
ln -sfv "$dir/scripts/shortcuts/notes.sh" ~/bin/
ln -sfv "$dir/scripts/misc/emojis" ~/bin/
ln -sfv "$dir/scripts/misc/trans" ~/bin/

echo "###################################### EXECUTABLE SYMLINKS IN OTHER LOCATIONS ######################################"

mkdir ~/.gpg/
ln -sfv "$dir/configs/gpg/gpg.conf" ~/.gpg/

mkdir -p ~/.local/share/indicators/application/
ln -sfv "$dir/system/ordering-override.keyfile" ~/.local/share/indicators/application/ordering-override.keyfile

echo "####################################################################################"
echo "************************ SIMLINKING DONE ************************"
echo "####################################################################################"

echo "------------------------------------------------------------------------------------------------------"

echo "###################################### DON'T FORGET TO CONFIGURE SSH PROPERLY WITH KEY AND CONFIG ######################################"
