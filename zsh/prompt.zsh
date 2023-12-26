source $DOTFILES/zsh/git-prompt.sh

PS1="%F{white}[%n@%m %~%F{green}\$(__git_ps1)%F{white}] %# "

## color bash prompt when outside the home dir
precmd () {
    # detech ssh env, and thrown in a machine prefix
    if [ -n "$SSH_CLIENT" ]; then
        MACHINE_PREFIX="%F{red}%m%F{white}|"
    fi

    # If outside of your home directory, print the current directory in red, blue otherwise.
    if [[ $PWD/ != $HOME/* ]]; then
        PS1="%F{white}[$MACHINE_PREFIX%K{red}%/%k%F{green}\$(__git_ps1)%F{white}] %# "
    else
        PS1="%F{white}[$MACHINE_PREFIX%/%F{green}\$(__git_ps1)%F{white}] %# "
    fi
}

RPROMPT="[%D{%y/%m/%f}|%*]"
