# /etc/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#

# Load zprof if we need to profile startup time
# at the bottom of ~/.zshrc add `zprof >! zsh_profile` to save
# profiling data at startup
zmodload zsh/zprof

# Default PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin"

# Determine zsh conf file position.
local BASE="/etc"

# On Debian/Ubuntu is /etc/zsh, on other should be /etc
[ -d /etc/zsh ] && BASE="/etc/zsh"

# If there is a .zsh directory into user's home, use that one instead (local install)
[ -d ~/.zsh ] && BASE=~/.zsh


local LIBRARY=${BASE}/zsh.d
# local KERNEL=`uname -s`
local KERNLIB=${LIBRARY}/$(uname -s)

for lib in $LIBRARY $KERNLIB; do
  [ -d $lib/zshfunctions ] && fpath=($lib/zshfunctions $fpath)
  [ -d $lib/completions ] && fpath=($lib/completions $fpath)

  for zshFile in $lib/[0-9]*.zsh; do
    # echo $zshFile
    source $zshFile
  done
done

