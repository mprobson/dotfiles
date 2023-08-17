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
# Source global definitions (from NICS beacon)
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

OSName=$(uname)

##############################################################################
# 02. Aliases                                                                #
##############################################################################
test -s ~/.alias && . ~/.alias || true
# Enable colors in "ls" command output
if [ "$OSName" == "Darwin" -a `which ls` == "/bin/ls" ];
then
  alias ls='ls -G'
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
  alias chromium='/Applications/Chromium.app/Contents/MacOS/Chromium'
else
  alias ls='ls --color'
fi
alias ll='ls -l'

##############################################################################
# 03. Theme/Colors                                                           #
##############################################################################

##############################################################################
# 04. Other                                                                  #
##############################################################################
# Prevent history commands from being sent to history
export HISTCONTROL=ignoreboth
