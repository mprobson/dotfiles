#!/bin/bash
################################################################################
# .make.sh                                                                     #
# This script creates symlinks from the home directory to any desired dotfiles #
# in ~/dotfiles                                                                #
################################################################################

########## Variables

dir=~/dotfiles/                                   # dotfiles directory
olddir=~/dotfiles_old/                            # old dotfiles backup directory
files="bashrc vimrc gitconfig gitignore_global profile" # list of files to symlink in homedir
folders="vim ssh git_template bin"                # list of folders to symlink in homedir
tmux_exists=0                                     # 1 if true (bash exists), 0 otherwise

##########

# source: http://stackoverflow.com/a/3931779/3984520
command_exists () {
  type "$1" > /dev/null 2>&1 ;
}

if command_exists tmux ; then
  tmux_exists=1
  files="$files tmux.conf"
  folders="$folders tmux"
fi

if [ $tmux_exists ] ; then
  # install tpm (tmux package manager)
  mkdir -p $dir/tmux/plugins/
  git clone https://github.com/tmux-plugins/tpm tmux/plugins/tpm
fi

# install Vundle
mkdir -p $dir/vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# create gitconfig
./make_git_config

replace() {
  # move any existing dotfiles in homedir to dotfiles_old directory
  if [ -e ~/.$1 ] ; then
    mv ~/.$1 $olddir/$1
  fi
  echo "Creating symlink to $1 in home directory"
  # then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
  ln -s $dir/$1 ~/.$1
}

replace2() {
  if [ -e ~/.$2/$1 ] ; then
    mv ~/.$2/$1 $olddir/$2/
  fi
  echo "Creating symlink to $1 in ~/.$2 directory"
  ln -s $dir/$2/$1 ~/.$2/$1
}

echo "Moving any existing dotfiles from ~/ to $olddir"
for file in $files; do
  replace $file
done

# handle directories by just symlinking files
for folder in $folders; do
  if [ ! -d ~/.$folder ] ; then
    echo "Creating new empty version of $folder"
    replace $folder
  else
    echo "Creating backup version of $folder"
    mkdir -p $olddir/$folder
    echo "Moving any existing files from ~/.$folder to $olddir/$folder"
    cd $dir/$folder
    pwd
    # Use the shell's globbing feature to get filenames, thanks stack overflow!
    for file2 in *; do
      replace2 $file2 $folder
    done
  fi
done

if [ $tmux_exists ] ; then
  # Reload TMUX environment so TPM is sourced:
  tmux source-file ~/.tmux.conf
fi

# install vim plugins
vim +PluginInstall +qall
