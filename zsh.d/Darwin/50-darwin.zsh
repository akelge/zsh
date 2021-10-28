# Darwin/OSX
# Environment and aliases for OSX
export LSCOLORS="ExgxcxdxCxegedabagacad"
alias ldd='otool -L'
alias ls='ls -F -G'
alias skill=killall
alias lsrebuild='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user'

# Setup iTerm shell integration
test -e $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh && export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES || echo "iTerm sh integration not installed"


#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
