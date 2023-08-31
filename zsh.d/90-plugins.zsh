# pyenv
if whence pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# thefuck
whence  thefuck > /dev/null && eval $(thefuck --alias)

# z
# [ -f $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh ] && source $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh
whence zoxide > /dev/null && eval eval "$(zoxide init zsh)"

# kubectl/krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

if whence kubectl > /dev/null; then 
  alias k=kubectl
  alias kk='kubectl konfig merge ~/.kube/configs/* > ~/.kube/config'
fi

# Setup iTerm shell integration
test -e $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh && export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES || echo "iTerm sh integration not installed"
