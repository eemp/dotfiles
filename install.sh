#!/usr/bin/sh

prep_git() {
    mv ~/.gitconfig ~/.gitconfig.bak 2>/dev/null ||:
    ln -s ~/dotfiles/git/.gitconfig ~/
    ln -s ~/dotfiles/git/.gitconfig.personal ~/
}

prep_tmux() {
    mv ~/.tmux.conf ~/.tmux.conf.bak 2>/dev/null ||:
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ln -s ~/dotfiles/tmux/.tmux.conf ~/
    ~/.tmux/plugins/tpm/bin/install_plugins
}

prep_vim_plugins() {
    rm -rf ~/.vim/bundle
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

prep_vim() {
    mv ~/.vimrc ~/.vimrc.bak 2>/dev/null ||:
    mv ~/.ctrlpignore ~/.ctrlpignore.bak ||:
    ln -s ~/dotfiles/vim/.vimrc ~/
    ln -s ~/dotfiles/vim/.ctrlpignore ~/
}

install_zsh() {
    if command -v apt >/dev/null; then
        apt install zsh -y
    elif command -v yum >/dev/null; then
        yum install zsh -y
    else
        echo "No idea how to install zsh..."
    fi
}

prep_zsh() {
    if ! command -v zsh >/dev/null; then
        install_zsh
    fi
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    mv ~/.zshrc ~/.zshrc.bak 2>/dev/null
    ln -s ~/dotfiles/zsh/.zshrc ~/
}

prep_git
prep_vim
prep_zsh
prep_tmux
