fpath=($0:h/prompts $fpath)
fpath+=$0:h/prompts/pure

autoload -U promptinit;promptinit

zstyle :prompt:pure:user color white
zstyle :prompt:pure:host color white

# prompt pure

#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
