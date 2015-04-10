##############################################################################
#   Filename: .bashrc                                                        #
# Maintainer: Michael P. Robson <mprobson@illinois.edu>                      #
#        URL: http://github.com/michaeljsmalley/dotfiles                     #
#        URL: http://github.com/mprobson/dotfiles                            #
#                                                                            #
#                                                                            #
# Sections:                                                                  #
#   01. General ................. General Bash behavior                      #
#   02. Aliases ................. Aliases                                    #
#   03. Theme/Colors ............ Colors, prompts, fonts, etc.               #
#   04. Other.................... Path fixup, etc.                           #
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################
hostname=$(hostname)
# Enable the GNU versions of tools on my Mac
if [ "$hostname" == "wirelessprvnat" ];
then
  export PATH=/opt/local/libexec/gnubin:$PATH
  echo "MAC!"
fi
# Add custom commands
export PATH=$PATH:~/.bin

##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output
alias ls='ls --color'
alias ll='ls -l'
#alias grep='ack-grep'

##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################

##############################################################################
# 04. Other                                                                  #
##############################################################################
# Gurobi Setup
export GUROBI_HOME="/dcsdata/home/mprobson/research/MITRE/gurobi562/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib:${HOME}/research/MITRE/coin-Clp/lib"
#export GRB_LICENSE_FILE=/dcsdata/home/mprobson/gurobi.lic
