#######################################################################################
# Start autocomplete
# autoload -U compinit; compinit -u
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
autoload -U compsys;
compctl -g "*(-/)" + -g ".*(-/)" cd

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# # tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# # cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# compctl -g "*(-/)" + -g ".*(-/)" cd
#
#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
