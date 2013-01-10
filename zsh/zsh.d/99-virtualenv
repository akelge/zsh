function venv {

    export WORKON_HOME=$HOME/Src/virtualenvs
    export PROJECT_HOME=$HOME/Src/projects

    VIRTUALENV_SCRIPT=/usr/local/bin/virtualenvwrapper.sh

    [ -d $WORKON_HOME ] || mkdir -p $WORKON_HOME
    [ -d $PROJECT_HOME ] || mkdir -p $PROJECT_HOME

    source $VIRTUALENV_SCRIPT

    echo "virtualenv enabled."
    echo "WORKON_HOME: $WORKON_HOME"
    echo "PROJECT_HOME: $PROJECT_HOME"
    echo
    echo "Virtualenvs:"
    lsvirtualenv
    echo
}

# vim: set ts=4 sw=4 tw=0 ft=sh : 
