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

function loadRC {
  [ -d $1/zshfunctions ] && fpath=($1/zshfunctions $fpath)
  [ -d $1/completions ] && fpath=($1/completions $fpath)

  for zshFile in $1/[0-9]*.zsh; do
    source $zshFile
  done
}

# Default PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin"

local BASE="/etc"
# Determine zsh conf file position. On Debian/Ubuntu is /etc/zsh, on other should be /etc
[ -d /etc/zsh ] && BASE="/etc/zsh"

# If there is a .zsh directory into user's home, use that one instead (local install)
[ -d ~/.zsh ] && BASE=~/.zsh


local KERNEL=`uname -s`
local LIBRARY=${BASE}/zsh.d
local KERNLIB=${LIBRARY}/${KERNEL}

loadRC ${KERNLIB}
loadRC ${LIBRARY}

# # Add local customization file
# if [ -w $LIBRARY ]; then
#   [ -f $LIBRARY/99-local.zsh ] || echo "# Local customizations" > $LIBRARY/99-local.zsh
# fi
