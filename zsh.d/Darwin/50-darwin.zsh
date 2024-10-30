# Darwin/OSX
# Environment and aliases for OSX


# Setup brew
# We need it here to fix the PATH
# so we can setup pyenv and other stuff
#
if type /opt/homebrew/bin/brew > /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

export LSCOLORS="ExgxcxdxCxegedabagacad"

alias ls='ls -F -G'
alias ldd='otool -L'
# alias skill=killall
alias lsrebuild='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user'


#  vim: set ts=4 sw=4 tw=0 ft=zsh :
