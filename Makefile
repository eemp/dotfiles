all: vim tmux

tmux: FORCE
	cp .tmux.conf ~/

vim: vimrc vim-plugins

vimrc: FORCE
	cp .vimrc ~/

vim-plugins: FORCE
	rm -rf ~/.vim/bundle
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	cd ~/.vim/bundle && git clone https://github.com/tpope/vim-sensible.git
	cd ~/.vim/bundle && git clone https://github.com/tpope/vim-sleuth.git
	cd ~/.vim/bundle && git clone https://github.com/tpope/vim-fugitive.git
	cd ~/.vim/bundle && git clone https://github.com/tpope/vim-surround.git
	cd ~/.vim/bundle && git clone https://github.com/kien/ctrlp.vim.git ctrlp
	cd ~/.vim/bundle && git clone https://github.com/scrooloose/nerdcommenter.git
	cd ~/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git
	cd ~/.vim/bundle && git clone https://github.com/ervandew/supertab.git
	cd ~/.vim/bundle && git clone https://github.com/bling/vim-bufferline
	cd ~/.vim/bindle && git clone https://github.com/diepm/vim-rest-console.git

FORCE:
