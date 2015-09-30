vim-plugins: FORCE
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	cd ~/.vim/bundle; git clone https://github.com/ervandew/supertab.git
	cd ~/.vim/bundle; git clone https://github.com/tpope/vim-fugitive.git
	cd ~/.vim/bundle; git clone https://github.com/kien/ctrlp.vim.git ctrlp
	cd ~/.vim/bundle; git clone https://github.com/scrooloose/nerdtree.git
	cd ~/.vim/bundle; git clone https://github.com/bling/vim-bufferline

FORCE:
