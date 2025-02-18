#######################################################################################
# Aliases

# alias ls='ls -F --color'
# alias dir='ls -l'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -Al'

alias killall='killall -v'
alias cls='clear'

alias dc=cd
alias les=less
alias fu='sudo $(fc -ln -1)'
# alias sudo='sudo '

alias mkdir='mkdir -p'
alias zap='rm -rf'
# alias ftail='tail -f'
alias grep='grep --colour'

alias ns='host -t ns'
alias mx='host -t mx'
alias soa='host -t soa'
alias ptr='host -t ptr'

# alias vi="vim "

# alias du1="du -h --max-depth=1"
# alias psg="ps ax|grep "
alias myip="dig +short ANY @resolver1.opendns.com myip.opendns.com"

# alias delkey="ssh-keygen -R "

alias k=kubectl
alias kk='kubectl konfig merge ~/.kube/configs/* > ~/.kube/config'

# Global Aliases
#
alias -g G="|grep "
alias -g K="-o yaml | kubectl neat | less"
alias -g KK="-o yaml | less"
alias -g L="|less"
alias -g W="|wc -l"
alias -g NO="> /dev/null"
alias -g NE="2> /dev/null"
alias -g NA="> /dev/null 2>&1"

#  vim: set ts=4 sw=4 tw=0 ft=zsh :
