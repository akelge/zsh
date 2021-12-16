#######################################################################################
# Functions
#
#
#
#
# Load usefule modules

zmodload -F zsh/stat b:zstat
zmodload zsh/datetime
#
# Autoload all functions in zshfunctions
#
autoload -U $LIBRARY/zshfunctions/*(.:t)

# Add zsh-hook function
autoload -Uz add-zsh-hook

# Add async support
autoload -Uz async && async
