fpath+=$0:h/prompts
fpath+=$0:h/prompts/mypure
# fpath+=$0:h/prompts/pure

autoload -U promptinit;promptinit

zstyle :prompt:pure:user color white
zstyle :prompt:pure:host color white
zstyle :prompt:pure:prompt:success color  yellow

PURE_CMD_MAX_EXEC_TIME=30

# Default prompt is pure
#
# prompt mypure
# prompt pure

#  vim: set ts=4 sw=4 tw=0 ft=zsh :
