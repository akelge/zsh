function venv {

    # export WORKON_HOME=$HOME/Src/virtualenvs
    # export PROJECT_HOME=$HOME/Src/projects
    if [ -z $WORKON_HOME ] || [ -z $PROJECT_HOME ]; then
        echo "Please, set WORKON_HOME and PROJECT_HOME first."
        echo "Better place to set them is 99-local.zsh"
        return
    fi

    [ -z $VIRTUALENV_SCRIPT ] && VIRTUALENV_SCRIPT=/usr/local/bin/virtualenvwrapper.sh

    [ -d $WORKON_HOME ] || mkdir -p $WORKON_HOME
    [ -d $PROJECT_HOME ] || mkdir -p $PROJECT_HOME

    source $VIRTUALENV_SCRIPT

    if [ -z $1 ]; then
        echo "virtualenv enabled."
        echo "WORKON_HOME: $WORKON_HOME"
        echo "PROJECT_HOME: $PROJECT_HOME"
        echo
        echo "Virtualenvs:"
        lsvirtualenv -b
        echo
    else
        workon $1
    fi
}
