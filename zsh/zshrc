# /etc/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#
KERNEL=`uname -s`
LIBRARY="/Network/Library/zsh.d"
KERNLIB="${LIBRARY}/${KERNEL}"

function loadRC {
    if [ -d $1 ]; then
        for zshFile in $1/*; do
            . $zshFile
        done
    fi
    unset zshFile
}

loadRC ${LIBRARY}
loadRC ${KERNLIB}

unset KERNEL
unset LIBRARY
unset KERNLIB

# Local (per Host) customizations
for localDir in /etc/zsh /etc /usr/local/etc /usr/local/etc/zsh; do
    if [ -f ${localDir}/zshrc.local ]; then
        . ${localDir}/zshrc.local
    fi
done
unset localDir
