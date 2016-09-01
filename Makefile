all: git tmux vim zsh

git: FORCE
	ln -s $PWD/git/.gitconfig ~/

tmux: FORCE
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s $PWD/tmux/.tmux.conf ~/
	~/.tmux/plugins/tpm/bin/install_plugins

vim: vimrc vim-plugins

vimrc: FORCE
	ln -s $PWD/vim/.vimrc ~/

vim-plugins: FORCE
	rm -rf ~/.vim/bundle
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

zsh: FORCE
	ln -s $PWD/zsh/.zshrc ~/

FORCE:
