# pyenv
if type pyenv; then
  export PYENV_ROOT="$HOME/.pyenv"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# thefuck
type thefuck && eval $(thefuck --alias)

#z
type ./plugins/zsh-z/zsh-z.plugin.zsh && source ./plugins/zsh-z/zsh-z.plugin.zsh
