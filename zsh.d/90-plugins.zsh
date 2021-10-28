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

# kubectl/krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

if whence kubectl > /dev/null; then 
  alias k=kubectl
  alias kp='kubectl ipick'
fi
