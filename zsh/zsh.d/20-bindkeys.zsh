#######################################################################################
#
# Backward-kill-word stop on dir delimiter
autoload -U select-word-style
select-word-style bash

# Standard Linux
"^[[1;5C" forward-word
"^[[1;5D" backward-word


# Useful under iTerm
bindkey  "-e" 
bindkey  "\e[1~" beginning-of-line
bindkey  "\e[4~" end-of-line
bindkey  "\e[3~" delete-char
bindkey  "\eOA" history-search-backward
bindkey  "\eOB" history-search-forward
bindkey  "\e[A" history-search-backward
bindkey  "\e[B" history-search-forward
#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
