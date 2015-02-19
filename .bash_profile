# .bash_profile

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

BASHFILES=$HOME/.bash/*.bashrc

for f in $BASHFILES
    do
        # echo $f
        source $f
    done

