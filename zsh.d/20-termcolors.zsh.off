#######################################################################################
# Colorize terminal
autoload colors zsh/terminfo
zmodload zsh/terminfo

if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
# for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    # eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    # eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    # # (( count = $count + 1 ))
# done
# PR_NO_COLOR="%{$terminfo[sgr0]%}"

# unset color
#

typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done


ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    # print -P -- "$code: %F{$code}$ZSH_SPECTRUM_TEXT%f"
    print -P -- "$FG[$code]$code: $ZSH_SPECTRUM_TEXT $FX[reset]"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$BG[$code]$code: $ZSH_SPECTRUM_TEXT $FX[reset]"
  done
}
#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
