source $DOTFILES/zsh/git-prompt.sh

PS1="%F{white}[%n@%m %~%F{green}\$(__git_ps1)%F{white}] %# "
PATH_FORMATTER=$DOTFILES/bin/prompt-helper.pl

## color bash prompt when outside the home dir
precmd () {
    # If outside of your home directory, print the current directory in red, blue otherwise.
    if [[ $PWD/ != $HOME/* ]]; then
        PS1="%F{white}[%K{red}\$($PATH_FORMATTER)%k%F{green}\$(__git_ps1)%F{white}] %# "
    else
        PS1="%F{white}[\$($PATH_FORMATTER)%F{green}\$(__git_ps1)%F{white}] %# "
    fi
}

RPROMPT="[%D{%y/%m/%f}|%*]"
