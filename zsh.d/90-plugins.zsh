# pyenv
if whence pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# thefuck
whence  thefuck > /dev/null && eval $(thefuck --alias)

# z
[ -f $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh ] && source $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh
