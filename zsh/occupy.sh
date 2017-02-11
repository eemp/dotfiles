#!/usr/bin/env sh

SNAPSHOT_DIR=$HOME/.occupy.snapshot

VIMRC=.vimrc
VIMDIR=.vim

TMUXCONF=.tmux.conf
TMUXDIR=.tmux

BASHRC=.bashrc

ZSHRC=.zshrc

GITCONFIG=.gitconfig

DOTFILES=dotfiles

### create SNAPSHOT_DIR

snapshot() {
    mkdir -p $SNAPSHOT_DIR;
    _backup $HOME/$VIMRC
    _backup $HOME/$VIMDIR
    _backup $HOME/$TMUXCONF
    _backup $HOME/$TMUXDIR
    _backup $HOME/$BASHRC
    _backup $HOME/$ZSHRC
    _backup $HOME/$GITCONFIG
    _backup $HOME/$DOTFILES
}

_backup() {
    fileOrDir=${argv[1]}
    if [[ $fileOrDir && (-f $fileOrDir || -d $fileOrDir) ]]; then
        mv $fileOrDir $SNAPSHOT_DIR
    else
        #echo "$fileOrDir does not exist"
    fi
}

### Restore the env of another
loadDevConfigs() {
    devHome=${argv[1]}
    if [[ $devHome && -d $devHome ]]; then
        ln -s $devHome/$VIMRC $HOME/
        ln -s $devHome/$VIMDIR $HOME/
        ln -s $devHome/$TMUXCONF $HOME/
        ln -s $devHome/$TMUXDIR $HOME/
        ln -s $devHome/$BASHRC $HOME/
        ln -s $devHome/$ZSHRC $HOME/
        ln -s $devHome/$GITCONFIG $HOME/
        ln -s $devHome/$DOTFILES $HOME/
    else
        echo "$devHome directory does not exist"
    fi
}

### Restore from SNAPSHOT_DIR

# any reason this needs to be more complicated?
restore() {
    if [[ $SNAPSHOT_DIR && -d $SNAPSHOT_DIR ]]; then
        rm -f $HOME/$VIMRC
        rm -f $HOME/$VIMDIR
        rm -f $HOME/$TMUXCONF
        rm -f $HOME/$TMUXDIR
        rm -f $HOME/$BASHRC
        rm -f $HOME/$ZSHRC
        rm -f $HOME/$GITCONFIG
        rm -f $HOME/$DOTFILES
        cd $SNAPSHOT_DIR && mv -f .* $HOME/ && mv -f $DOTFILES $HOME/ && cd -
        rmdir $SNAPSHOT_DIR
    else
        echo "$SNAPSHOT_DIR directory does not exist"
    fi
}

