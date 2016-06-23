# TODO: just source everything in $DOTFILES/zsh
# source $DOTFILES/zsh/prompt.zsh

for f in $DOTFILES/zsh/*.zsh
    do
        if [[ $f != $DOTFILES/zsh/main.zsh ]]
        then
            source $f
        fi
    done

