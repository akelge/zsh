# Mac Ports
[ ! -d /opt/local ] && return 

# Setup PATH
if [ -z "$PATH" ]; then
  PATH=/opt/local/bin:/opt/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:~/bin
else
  PATH=/opt/local/bin:/opt/local/sbin:$PATH
fi
export PATH

# # Setup MANPATH
# if [ -z "$MANPATH" ]; then
    # MANPATH=`/usr/bin/manpath`
# fi
# MANPATH=/opt/local/man:$MANPATH
# export MANPTH

# # Setup INFOPATH
# if [ -z "$INFOPATH" ]; then
  # INFOPATH=/opt/local/share/info:/opt/local/info:/usr/share/info
# else
  # INFOPATH=/opt/local/share/info:/opt/local/info:$INFOPATH
# fi
# export INFOPATH

if [ -z "$PERL5LIB" ]; then
  PERL5LIB=/opt/local/lib/perl5:/opt/local/lib/perl5/darwin
else
  PERL5LIB=/opt/local/lib/perl5:/opt/local/lib/perl5/darwin:$PERL5LIB
fi
export PERL5LIB

# Add X11 paths (but only if the directories are readable)
if [ -r /usr/X11R6/bin ]; then
    PATH=$PATH:/usr/X11R6/bin
    export PATH
fi
# if [ -r /usr/X11R6/man ]; then
    # MANPATH=$MANPATH:/usr/X11R6/man
    # export MANPATH
# fi

# PY_VER="2.7"

# PYTHONPATH="/opt/local/lib/python/site-packages:/opt/local/Library/Frameworks/Python.framework/Versions/${PY_VER}/lib/python${PY_VER}/site-packages/"
# #PYTHONHOME="/opt/local/Library/Frameworks/Python.framework/Versions/${PY_VER}"

# export PYTHONPATH
#export PYTHONHOME

#  vim: set ts=4 sw=4 tw=0 ft=zsh : 
