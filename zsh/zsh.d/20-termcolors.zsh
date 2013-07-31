#######################################################################################
# Colorize terminal
autoload colors zsh/terminfo
zmodload zsh/terminfo

if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    # (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

unset color
#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
