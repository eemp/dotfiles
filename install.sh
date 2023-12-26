#!/usr/bin/sh

prep_git() {
    mv ~/.gitconfig ~/.gitconfig.bak 2>/dev/null ||:
    ln -s ${PWD}/git/.gitconfig ~/
}

prep_tmux() {
	mv ~/.tmux.conf ~/.tmux.conf.bak 2>/dev/null ||:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s ${PWD}/tmux/.tmux.conf ~/
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
	ln -s ${PWD}/vim/.vimrc ~/
	ln -s ${PWD}/vim/.ctrlpignore ~/
}

prep_zsh() {
	mv ~/.zshrc ~/.zshrc.bak 2>/dev/null
	ln -s ${PWD}/zsh/.zshrc ~/
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

prep_git
prep_vim
prep_zsh
prep_tmux