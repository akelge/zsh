if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  #
  # Reload compinit and bashcompinit, to parse brew installed completions
  autoload -U compinit
  autoload bashcompinit
  compinit -u
  bashcompinit

fi

