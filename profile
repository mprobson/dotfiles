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

##############################################################################
# 02. Machine Specific                                                       #
##############################################################################
hostname=$(uname)

# Mac OS aka local laptop
if [ "$hostname" == "Darwin" ];
then
  # MacPorts Installer addition on 2014-09-09_at_01:15:07: adding an appropriate PATH variable for use with MacPorts.
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  # Finished adapting your PATH environment variable for use with MacPorts.
fi

# TODO make this an if?
export PATH="$PATH:~/projections/bin"

# BlueWaters config and modules
if [[ $(hostname) =~ h2ologin[0-9]* ]] ;
then
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/acml/5.3.1/gfortran64/lib/
  module swap PrgEnv-cray PrgEnv-gnu
  module load rca
  module load craype-hugepages8M
  module load fftw
  module load acml
  module load git
  export HUGETLB_MORECORE=no
fi

##############################################################################
# 03. Other                                                                  #
##############################################################################
# Run .bashrc configurations if the file exists
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
