set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-bufferline'
Plugin 'diepm/vim-rest-console'
"Plugin 'google/vim-colorscheme-primary'
Plugin 'pangloss/vim-javascript'
Plugin 'Shutnik/jshint2.vim'
Plugin 'NLKNguyen/papercolor-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""
" > GENERAL
""""""""""""""""""
" 
set nomodeline

" Set to auto read when a file is changed from the outside
set autoread

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Show matching brackets when text indicator is over them
set showmatch

" comma is more convenient for leader
let mapleader=","

"""""""""""""""""""""
" > VISUAL
"""""""""""""""""""""
" Enable syntax highlighting
"syntax enable
set t_Co=256
set background=dark
colorscheme PaperColor

highlight LineNr ctermfg=grey

""""""""""""""""""""""""
" > SEARCHING
"""""""""""""""""""""""" 
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 80 characters
"set lbr
"au BufRead,BufNewFile notes,*.md,*.js,*.comp,*.pm,*.pl,*.config,*.conf,*.c,*.cpp,*.py,*.java setlocal textwidth=80
" enforce
"au BufNewFile,BufRead notes set filetype=mynotes
"au FileType mynotes,markdown,javascript,perl,c,cpp,python,java setlocal formatoptions+=t formatoptions-=l
" highlight long lines
"augroup vimrc_autocmds
  "autocmd BufEnter * highlight OverLength ctermfg='160'
  "autocmd BufEnter * match OverLength /\%80v.*/
"augroup END

" mark 80th character on a line
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 100)

set ai "Auto indent
set si "Smart indent

map <C-w> :set wrap! linebreak nolist<cr>

""""""""""""""""""""""""""""""
" > Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

""""""""""""""""""""""""""""""
" > MOUSE
""""""""""""""""""""""""""""""
" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
if has('mouse')
    set mouse=a
endif

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
if !has('nvim')
  set ttymouse=xterm2
endif

"""""""""""""""""""""""""""""""
" > Cursor lost weight!
"""""""""""""""""""""""""""""""
if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
endif

"""""""""""""""""""""""""""""""
" > Miscellaneous
"""""""""""""""""""""""""""""""
" line numbers
set nu
"make < > shifts and keep selection afterward
vnoremap < <gv
vnoremap > >gv
"avoid scanning includes for autocompletion - slows it down
set complete-=i
"avoid delay after esc to return to normal mode
"set timeoutlen=10 ttimeoutlen=0


"""""""""""""""""""""""""""""""
" > CUSTOM CTRLP
"""""""""""""""""""""""""""""""

"let g:ctrlp_user_command = 'find %s -name "*.js" -o -name "*.pm" -o -name "*.pl" -o -name "*.config" -type f'
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat ~/.ctrlpignore`"'

"""""""""""""""""""""""""""""""
" > CUSTOM DIFF COLORSCHEME
"""""""""""""""""""""""""""""""

highlight DiffAdd    cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=15 ctermbg=88 gui=none guifg=bg guibg=Red

"""""""""""""""""""""""""""""""
" > CUSTOM F# TOGGLES
"""""""""""""""""""""""""""""""
" map <C-w> :set wrap! linebreak nolist<cr>
" line numbers
map <C-n> :set nu!<cr>
" highlights
map <C-f> :set hlsearch!<cr>

if &diff
    " diff mode
    set diffopt+=iwhite
endif

""""""""""""""""""""""""""""""
" > BUFFERS
""""""""""""""""""""""""""""""
function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

"No prompt for unsaved changes while switching buffers
set hidden

"""""""""""""""""""""""""""""""""
" > TERMINAL EMULATOR
"""""""""""""""""""""""""""""""""
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

"""""""""""""""""""""""""""""""""
" > Better split nav
"""""""""""""""""""""""""""""""""
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""
" > Better path completion
""""""""""""""""""""""""""""""""
set wildmode=longest,list,full
set wildmenu

" set vim to chdir for each file
cabbr <expr> %% expand('%:p:h')

