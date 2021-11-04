#######################################################################################
#
# Backward-kill-word stop on dir delimiter
autoload -U select-word-style
select-word-style bash

# Command line editing in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

bindkey "^S" kill-line
bindkey "^U" backward-kill-line
bindkey  "\e[3~" delete-char

# Useful under iTerm
bindkey  "-e" 
bindkey  "\e[H" beginning-of-line
bindkey  "\e[1~" beginning-of-line

bindkey  "\e[F" end-of-line
bindkey  "\e[4~" end-of-line

bindkey  "\e[A" history-search-backward
bindkey  "\e[B" history-search-forward

#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
