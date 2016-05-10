""""""""""""""""""
" > GENERAL
""""""""""""""""""
" Behave like Vim instead of Vi
set nocompatible

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
syntax enable

colorscheme desert
set background=dark

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

" Linebreak on 500 characters
set lbr
set tw=500

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
" > PATHOGEN
"""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on

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

let g:ctrlp_user_command = 'find %s -name "*.js" -o -name "*.pm" -o -name "*.pl" -o -name "*.config" -type f'

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
map <C-l> :set nu!<cr>
" highlights
map <C-f> :set hlsearch!<cr>

:filetype plugin on

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

"""""""""""""""""""""""""""""""""
" > vimdiff
"""""""""""""""""""""""""""""""""

" ignore case
set diffopt+=icase 

