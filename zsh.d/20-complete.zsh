#######################################################################################
# Start autocomplete
autoload -Uz compinit

if [[ -n "$HOME/.zcompdump(#qN.mh+24)" ]]; then
    compinit
else
    compinit -C
fi

autoload bashcompinit && bashcompinit

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
