#!/bin/bash
################################################################################
# .make.sh                                                                     #
# This script creates symlinks from the home directory to any desired dotfiles #
# in ~/dotfiles                                                                #
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

replace() {
  # move any existing dotfiles in homedir to dotfiles_old directory
  mv ~/.$1 $olddir/
  echo "Creating symlink to $1 in home directory."
  # then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
  ln -s $dir/$1 ~/.$1
}

replace2() {
  mv ~/.$2/$1 $olddir/.$2/
  echo "Creating symlink to $1 in ~/.$2 directory."
  ln -s $dir/$2/$1 ~/.$2/$1
}

echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
  replace $file
done

# handle directories by just symlinking files
for folder in $folders; do
  echo "Creating backup version of $folder"
  mkdir -p $olddir/.$folder
  echo "Moving any existing files from .$folder to $olddir/.$folder"
  cd $dir/$folder
  pwd
  # Use the shell's globbing feature to get filenames, thanks stack overflow!
  for file2 in *; do
    replace2 $file2 $folder
  done
done
