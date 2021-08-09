#######################################################################################
#
# Backward-kill-word stop on dir delimiter
autoload -U select-word-style
select-word-style bash

# Command line editing in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Standard Linux
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^S" kill-line
bindkey "^U" backward-kill-line


# Useful under iTerm
bindkey  "-e" 
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line      
bindkey  "\e[1~" beginning-of-line
bindkey  "\e[4~" end-of-line
bindkey  "\e[3~" delete-char
bindkey  "\eOA" history-search-backward
bindkey  "\eOB" history-search-forward
bindkey  "\e[A" history-search-backward
bindkey  "\e[B" history-search-forward
#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
