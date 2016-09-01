all: git tmux vim zsh

git: FORCE
	rm -f ~/.gitconfig
	ln -s ${PWD}/git/.gitconfig ~/

tmux: FORCE
	rm -rf ~/.tmux*
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s ${PWD}/tmux/.tmux.conf ~/
	~/.tmux/plugins/tpm/bin/install_plugins

vim: vimrc vim-plugins

vimrc: FORCE
	rm -f ~/.vimrc
	rm -f ~/.ctrlpignore
	ln -s ${PWD}/vim/.vimrc ~/
	ln -s ${PWD}/vim/.ctrlpignore ~/

vim-plugins: FORCE
	rm -rf ~/.vim/bundle
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

zsh: FORCE
	rm -f ~/.zshrc
	ln -s ${PWD}/zsh/.zshrc ~/

FORCE:
