# -*- coding: latin-1 -*-
# Copyright (c)2008 CUBE S.p.A. 
#  
#  Author: Andrea Mistrali <andre@cubeholding.com> 
#  Description: Zsh Environment setup
# 
#  $Id$ 

. /etc/environment

umask 022

function cdb {
	DIR=`dirname $1`
	cd $DIR
	unset DIR
}

function onAll {
    pdsh -a $* | dshbak -c
  }

alias ls='ls -F --color'
alias la='ls -A'
alias ll='ls -l'
alias lla='la -l'
alias dir='ls -l'

alias cls='/usr/bin/clear'


#alias cp='cp -v'
#alias mv='mv -v'
#alias rm='rm -v'
alias killall='killall -v'
alias skill=killall
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

# Start autocomplete
autoload -U compinit; compinit

if [ `uname -s` = "Darwin" ]; then
  # Alias for editors on OSX
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
  alias aquamacs='open -a Aquamacs\ Emacs'
  alias ldd='otool -L'
  alias ls='ls -F -G'
fi
