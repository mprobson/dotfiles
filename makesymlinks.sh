#!/bin/bash
################################################################################
# .make.sh                                                                     #
# This script creates symlinks from the home directory to any desired dotfiles #
# in ~/dotfiles                                                                #
################################################################################

########## Variables

dir=~/dotfiles/                                   # dotfiles directory
olddir=~/dotfiles_old/                            # old dotfiles backup directory
files="bashrc vimrc gitconfig profile tmux.conf"  # list of files to symlink in homedir
folders="vim ssh git_template bin tmux"           # list of folders to symlink in homedir

##########

# install tpm (tmux package manager)
mkdir -p tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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

# install Vundle
mkdir -p vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim

# handle directories by just symlinking files
for folder in $folders; do
  echo "Creating backup version of $folder"
  mkdir -p $olddir/.$folder
  if [ ! -d ~/.$folder ] ; then
    echo "Creating new empty version of $folder"
    mkdir ~/.$folder
  fi
  echo "Moving any existing files from .$folder to $olddir/.$folder"
  cd $dir/$folder
  pwd
  # Use the shell's globbing feature to get filenames, thanks stack overflow!
  for file2 in *; do
    replace2 $file2 $folder
  done
done

# Reload TMUX environment so TPM is sourced:
tmux source-file ~/.tmux.conf

# install vim plugins
vim +PluginInstall +qall
