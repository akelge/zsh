# pyenv
if type pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  # eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# thefuck
type thefuck > /dev/null && eval $(thefuck --alias)

# z
# [ -f $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh ] && source $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh
if type zoxide > /dev/null; then  ## zoxide is installed
  eval "$(zoxide init zsh)"
  export Z_COMMAND=zoxide
elif [ -f $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh ]; then ## zsh-z is installed
  source $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh
  export Z_COMMAND=zsh-z
else
  echo "No zoxide or zsh-z found, z command disabled"
fi

# kubectl/krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Setup iTerm shell integration
test -e $HOME/.iterm2_shell_integration.zsh && source $HOME/.iterm2_shell_integration.zsh && export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES || echo "iTerm integration not installed"
