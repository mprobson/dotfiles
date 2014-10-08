#!/bin/bash
################################################################################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
################################################################################

########## Variables

dir=~/dotfiles/                         # dotfiles directory
olddir=~/dotfiles_old/                  # old dotfiles backup directory
files="bashrc vimrc gitconfig profile"  # list of files to symlink in homedir
folders="vim ssh"                       # list of folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# handle ssh by just symlinking config
echo "Moving any existing ssh config from ~/.ssh to $olddir"
mv ~/.ssh/config $olddir/.ssh/config
echo "Creating symlink to ssh config in .ssh directory."
ln -s $dir/ssh/config ~/.ssh/config
