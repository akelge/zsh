#######################################################################################
# Variables

## Vars used always
PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:."
MIBS=all
LOGD=/var/log

## If we are not interactive quit
[ -z "$PS1" ] && return

## Vars only for interactive sessions
SAVEHIST=10000000
HISTFILE=~/.history
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


# Setup brew
# We need it here to fix the PATH
# so we can setup pyenv and other stuff

for prefix in /usr/local /opt/homebrew; do
    brew=$(whence $prefix/bin/brew)
    if [ $brew ]; then
        eval "$($brew shellenv)"
    fi
done

# Set umask to collaborative mode
umask 002

#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
