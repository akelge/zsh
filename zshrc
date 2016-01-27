# /etc/zshrc: system-wide .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#

# Determine zsh conf file position. On Debian/Ubuntu is /etc/zsh, on other should be /etc
#

[ -d /etc/zsh ] && BASE="/etc/zsh" || BASE="/etc"

[ -d ~/.zsh ] && BASE=~/.zsh

KERNEL=`uname -s`
LIBRARY=${BASE}/zsh.d
KERNLIB=${LIBRARY}/${KERNEL}

function loadRC {
    # [ -d $1 ] && cd $1 || exit 1

    if [ -d $1/zshfunctions ]; then
        fpath=($1/zshfunctions $fpath)
    fi

    if [ -d $1/completions ]; then
        fpath=($1/completions $fpath)
    fi

    # Add local customization file, svn ignored
    # if [ $EUID -eq 0 ]; then
    if [ -w $1 ]; then
        [ -f $1/99-local.zsh ] || echo "# Local customizations" > $1/99-local.zsh
    fi

    # Process all .zsh files
    for zshFile in $1/[0-9]*.zsh; do
        . $zshFile
    done

    unset zshFile
}

loadRC ${LIBRARY}
loadRC ${KERNLIB}

unset KERNEL
unset LIBRARY
unset KERNLIB

# Local (per Host) customizations
for localDir in ${LIBRARY} /etc/zsh /etc /usr/local/etc /usr/local/etc/zsh; do
    if [ -f ${localDir}/zshrc.local ]; then
        . ${localDir}/zshrc.local
    fi
done
unset localDir
