# /etc/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
# $Id$
# $HeadURL$

setopt ALWAYS_TO_END
setopt APPEND_HISTORY
setopt AUTO_CD
setopt ALL_EXPORT
setopt AUTO_MENU
setopt AUTONAMEDIRS
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt AUTO_RESUME
# setopt CDABLE_VARS
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

umask 022

## Vars used always
#
PATH="/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:."
SAVEHIST=500
HISTFILE=~/.history
HISTSIZE=10000
LANG="it_IT.UTF-8"
TZ='Europe/Rome'
MIBS=all

## If we are not interactive quit
[ -z "$PS1" ] && return

## Vars only for interactive sessions
LESS="-c -x4 -R -MM -PMFile\:?f%f:STDIN. ?BSize\:?B%B:Unk.?B\:?pb%pb\%:Unk.?B\:%i/%m"
LESSCHARSET=utf-8
READNULLCMD=/usr/bin/less
PAGER=/usr/bin/less
EDITOR=vi

PS1="%B%m:%n:%~ %#%b "

LOGCHECK=30
LOGD=/var/log
REPORTTIME=15
WATCH=notme
WATCHFMT="%n %a %l (%m) at %t."
PYTHONSTARTUP=~/.pythonrc.py
MINICOM="-c on"

function cdb {
    cd `dirname $1`
}

alias ls='ls -F --color'
alias la='ls -A'
alias ll='ls -l'
alias lla='la -l'
alias dir='ls -l'

alias cls='/usr/bin/clear'

alias killall='killall -v'
alias dc=cd
alias les=less

alias mkdir='mkdir -p'
alias zap='rm -rf'
alias ftail='tail -f'
alias grep='grep --colour'

alias ns='host -t ns'
alias mx='host -t mx'
alias soa='host -t soa'
alias ptr='host -t ptr'

alias vi=vim

# Start autocoplete
autoload -U compinit; compinit
compctl -g "*(-/)" + -g ".*(-/)" cd
#
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"
#
## make less colourful
LESS_TERMCAP_mb=$'\E[01;34m'     # begin blinking
LESS_TERMCAP_md=$'\E[01;36m'     # begin bold
LESS_TERMCAP_me=$'\E[0m'         # end mode
LESS_TERMCAP_so=$'\E[01;47;34m'  # begin standout-mode - info box
LESS_TERMCAP_se=$'\E[0m'         # end standout-mode
LESS_TERMCAP_us=$'\E[04;32m'     # begin underline
LESS_TERMCAP_ue=$'\E[0m'         # end underline

# Useful under iTerm
bindkey  "-e" 
bindkey  "\e[1~" beginning-of-line
bindkey  "\e[4~" end-of-line
bindkey  "\e[3~" delete-char
bindkey  "\eOA" history-search-backward
bindkey  "\eOB" history-search-forward
bindkey  "\e[A" history-search-backward
bindkey  "\e[B" history-search-forward
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
fi


if [ `uname -s` = "Darwin" ]; then
  export LSCOLORS="GxgxcxdxCxegedabagacad"
  # Alias for editors on OSX
  alias mvim = 'mvim --remote-tab-silent'
  alias vim = mvim
  alias aquamacs = 'open -a Aquamacs\ Emacs'
  alias ldd = 'otool -L'
  alias ls = 'ls -F -G'
  alias skill = killall
  alias lsrebuild='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user'

  if [ -f /opt/local/etc/init.sh ]; then
      source /opt/local/etc/init.sh
  fi
fi

# Process Local file
for localDir in /etc/zsh /etc /usr/local/etc /usr/local/etc/zsh; do
    if [ -f ${localDir}/zshrc.local ]; then
        . ${localDir}/zshrc.local
    fi
done
unset localDir
