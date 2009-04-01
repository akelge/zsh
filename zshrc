# /etc/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

setopt ALWAYS_TO_END
setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_MENU
setopt AUTONAMEDIRS
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt AUTO_RESUME
#setopt CDABLE_VARS
setopt CORRECT
setopt FUNCTION_ARGZERO
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt LIST_TYPES
setopt LONG_LIST_JOBS
setopt MENU_COMPLETE
setopt NO_AUTOLIST
setopt NO_AUTOLIST
setopt NO_BEEP
setopt NOHUP
setopt NOTIFY
setopt PATH_DIRS
setopt SHORT_LOOPS

compctl -g "*(-/)" + -g ".*(-/)" cd

bindkey  "-e" 
bindkey  "\e[1~" beginning-of-line
bindkey  "\e[4~" end-of-line
bindkey  "\e[3~" delete-char
#bindkey  "\e[2~" overwrite-mode
#bindkey  "\e[A" history-beginning-search-backward
#bindkey  "\e[B" history-beginning-search-forward
bindkey  "\eOA" history-search-backward
bindkey  "\eOB" history-search-forward
bindkey  "\e[A" history-search-backward
bindkey  "\e[B" history-search-forward
##bindkey "Od" backward-word
##bindkey "Oc" forward-word
##bindkey "\eOd" backward-word
##bindkey "\eOc" forward-word
bindkey "\e[5D" backward-word
bindkey "\e[5C" forward-word
bindkey "" vi-backward-kill-word

ulimit -c 0

# PROMPT
if [ ${TERM[0,5]} = "xterm" ] || [ ${TERM} = "rxvt" ]; then
  # We are on xterminal
  PS1="%{]2;%n@%m:%.%}%{]1; %m:%. %}%B<%l> %~ %#%b "
else
  # We are not on xterminal
  PS1="%B[%l] %n@%m:%~ %#%b "
fi

if [ `uname -s` = "Linux" ]; then
  eval `dircolors`
  eval `lesspipe`
fi

if [ `uname -s` = "Darwin" ]; then
  export LSCOLORS="GxgxcxdxCxegedabagacad"
fi
