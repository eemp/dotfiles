all: git tmux vim zsh

git: FORCE
	cp git/.gitconfig ~/

tmux: FORCE
	cp tmux/.tmux.conf ~/

vim: vimrc vim-plugins

vimrc: FORCE
	cp vim/.vimrc ~/

vim-plugins: FORCE
	rm -rf ~/.vim/bundle
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

zsh: FORCE
	cp ~/zsh/.zshrc ~/

FORCE:
