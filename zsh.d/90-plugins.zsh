# pyenv
if whence pyenv > /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
else
  echo "pyenv not installed"
fi

# thefuck
whence  thefuck > /dev/null && eval $(thefuck --alias) || echo "thef**k not installed"

#z
[ -f $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh ] && source $LIBRARY/plugins/zsh-z/zsh-z.plugin.zsh
