# Linux

if which dircolors > /dev/null; then
    if [ -f /etc/dir_colors ]; then
        eval `dircolors /etc/dir_colors`
    else
        eval `dircolors $BASE/zsh.d/Linux/dircolors`
    fi
fi

alias ls='LANG=C ls -F --color=auto --group-directories-first'
alias open='xdg-open '

#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
