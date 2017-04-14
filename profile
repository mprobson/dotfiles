##############################################################################
#   Filename: .profile                                                       #
# Maintainer: Michael P. Robson <mprobson@illinois.edu>                      #
#        URL: http://github.com/mprobson/dotfiles                            #
#                                                                            #
#                                                                            #
# Sections:                                                                  #
#   01. General ................. General Bash behavior                      #
#   02. Machine Specific ........ Machine specific setup commands            #
#   03. Other.................... Path fixup, etc.                           #
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################
test -z "$PROFILEREAD" && . /etc/profile || true

export SPEECHD_PORT=6561

# My Changes
export CHARMC=~/charm/bin/charmc

# Add home folder with custom built libs & header to include path
export CPATH=~/myUsr/local/include/:$CPATH
export LD_LIBRARY_PATH=~/myUsr/local/lib:$LD_LIBRARY_PATH
export CMAKE_LIBRARY_PATH=~/myUsr/local/lib:$CMAKE_LIBRARY_PATH

export EDITOR=/usr/bin/vim

# Add custom commands
export PATH=$PATH:~/.bin

# TODO make this an if?
export PATH="$PATH:~/projections/bin"

##############################################################################
# 02. Machine Specific                                                       #
##############################################################################
OSName=$(uname)
if [ "$OSName" == "Darwin" ];
then
  # Enable the GNU versions of tools on my Mac
  export PATH=/opt/local/libexec/gnubin:$PATH

  # Auto-added, by python?
  export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin/:$PATH

  # MacPorts Installer addition on 2014-09-09_at_01:15:07: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.
fi

# BlueWaters config and modules
if [[ $(hostname) =~ (h2ologin|nid)[0-9]+ ]] ;
then
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/acml/5.3.1/gfortran64/lib/
  module swap PrgEnv-cray PrgEnv-gnu
  module load rca
  module load craype-hugepages8M
  module load fftw
  module load acml
  module load git
  export HUGETLB_MORECORE=no
  module swap craype-hugepages8M   craype-hugepages128K
  module swap craype-hugepages128K craype-hugepages512K
  module swap craype-hugepages512K craype-hugepages2M
  module swap craype-hugepages2M   craype-hugepages8M

  # Fix VIM coloring
  export LESS="$LESS -R"
fi

##############################################################################
# 03. Other                                                                  #
##############################################################################
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Run .bashrc configurations if the file exists
if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi
