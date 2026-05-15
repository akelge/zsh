local ZCOMPDUMP="$HOME/.zcompdump"

# Check if the dump is old or missing
if [[ ! -f "$ZCOMPDUMP" || ! "${ZCOMPDUMP}"(N.mh-24) ]]; then
  # This block runs only once every 24 hours
  autoload -Uz compinit
  # Run a full compinit with the security audit enabled
  compinit -d "$ZCOMPDUMP"
  touch "$ZCOMPDUMP"
else
  # This block runs for every other shell start (Fast Path)
  # We use -C to skip compaudit, but it's safe because we verified
  # the files 24 hours ago.
  autoload -Uz compinit
  compinit -C -d "$ZCOMPDUMP"
fi

autoload -Uz bashcompinit
bashcompinit

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# # tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# # cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
