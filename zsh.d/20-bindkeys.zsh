#######################################################################################
#

# By default we choose emacs mode
bindkey  "-e" 

# Backward-kill-word stop on dir delimiter
autoload -U select-word-style
select-word-style bash

# History search
autoload -Uz history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Command line editing in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

bindkey "^S" kill-line
bindkey "^U" backward-kill-line
bindkey  "\e[3~" delete-char

# Useful under iTerm
bindkey  "\e[H" beginning-of-line
bindkey  "\e[1~" beginning-of-line

bindkey  "\e[F" end-of-line
bindkey  "\e[4~" end-of-line

bindkey  "\e[A" history-search-backward
bindkey  "\e[B" history-search-forward

# Required by Terminus in Sublime Text
bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word


# VI mode history search
bindkey -M vicmd '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end
bindkey -M viins '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end

bindkey -M viins "\e[H" beginning-of-line \
                 "\e[1~" beginning-of-line \
                 "^A" beginning-of-line \
                 "\e[F" end-of-line \
                 "\e[4~" end-of-line \
                 "^E" end-of-line

bindkey -M vicmd "\e[H" beginning-of-line \
                 "\e[1~" beginning-of-line \
                 "^A" beginning-of-line \
                 "\e[F" end-of-line \
                 "\e[4~" end-of-line \
                 "^E" end-of-line

#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
