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
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################
# Enable the GNU versions of tools on my Mac
export PATH=/opt/local/libexec/gnubin:$PATH

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
# CLI Colors
export CLICOLOR=1
# Set "ls" colors
export LSCOLORS=Gxfxcxdxbxegedabagacad
