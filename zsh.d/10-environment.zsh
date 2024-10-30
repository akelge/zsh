#######################################################################################
# Variables

## Vars used always
MIBS=all
LOGD=/var/log

## If we are not interactive quit
[ -z "$PS1" ] && return

## Vars only for interactive sessions
SAVEHIST=10000000
HISTFILE=~/.zsh_history
HISTFILESIZE=10000000
HISTSIZE=10000000

PYTHONSTARTUP=~/.pythonrc.py
LOGCHECK=30
REPORTTIME=15
WATCH=notme
WATCHFMT="%n %a %l (%m) at %t."

EDITOR=vim
VISUAL=vim

export QUOTING_STYLE=escape

#######################################################################################
# Setup LESS

## make less colourful
LESS_TERMCAP_mb=$'\E[01;34m'     # begin blinking
LESS_TERMCAP_md=$'\E[01;36m'     # begin bold
LESS_TERMCAP_me=$'\E[0m'         # end mode
LESS_TERMCAP_so=$'\E[01;47;34m'  # begin standout-mode - info box
LESS_TERMCAP_se=$'\E[0m'         # end standout-mode
LESS_TERMCAP_us=$'\E[04;32m'     # begin underline
LESS_TERMCAP_ue=$'\E[0m'         # end underline

LESS="-c -x4 -R -MM -PMFile\:?f%f:STDIN. ?BSize\:?B%B:Unk.?B\:?pb%pb\%:Unk.?B\:%i/%m"
LESSCHARSET=utf-8
READNULLCMD=/usr/bin/less
PAGER=/usr/bin/less

export LESS
export PAGER

local LESSOPEN_SCRIPT=$(whence lesspipe lesspipe.sh)
if [ $LESSOPEN_SCRIPT ]; then
    LESSOPEN="|${LESSOPEN_SCRIPT} %s"
    LESS_ADVANCED_PREPROCESSOR=1

    export LESSOPEN
    export LESS_ADVANCED_PREPROCESSOR
fi

# Set umask to collaborative mode
umask 002

#  vim: set ts=4 sw=4 tw=0 ft=zsh :
