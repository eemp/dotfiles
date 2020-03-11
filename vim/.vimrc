" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

call SourceIfExists("/etc/vimrc")

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin overrides
let g:PaperColor_Dark_Override = { 'comment' : '#5f875f' }

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-flagship'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/grep.vim'

"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_arrow_function       = "⇒"
"set conceallevel=1
Plugin 'pangloss/vim-javascript'

Plugin 'mxw/vim-jsx'
"Plugin 'Valloric/MatchTagAlways'

let g:vim_markdown_folding_disabled = 1
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

let g:vrc_trigger = '<C-n>'
let g:vrc_show_command = 1
Plugin 'diepm/vim-rest-console'

"let's keep vim simple
"Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

au BufRead,BufNewFile *.ipy set filetype=python
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.rest set filetype=rest

let g:vrc_curl_opts = {
  \ '-k': '',
\}

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

" line numbers
set nu
map <C-n> :set nu!<cr>

" comma is more convenient for leader
let mapleader=","

"""""""""""""""""""""
" > VISUAL
"""""""""""""""""""""
" Enable syntax highlighting
"syntax enable
set t_Co=256
set background=dark
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

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
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent

"make < > shifts and keep selection afterward
vnoremap < <gv
vnoremap > >gv

" Show trailing and preceding spaces
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

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
" > CUSTOM CTRLP
"""""""""""""""""""""""""""""""

"let g:ctrlp_user_command = 'find %s -name "*.js" -o -name "*.pm" -o -name "*.pl" -o -name "*.config" -type f'
let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat ~/.ctrlpignore`"'
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"""""""""""""""""""""""""""""""
" > CUSTOM DIFF COLORSCHEME
"""""""""""""""""""""""""""""""

highlight DiffAdd    cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=15 ctermbg=88 gui=none guifg=bg guibg=Red

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

"Close buffers without changing layout
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

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

"""""""""""""""""""""""""""""""
" > Miscellaneous
"""""""""""""""""""""""""""""""
"avoid scanning includes for autocompletion - slows it down
set complete-=i

"avoid delay after esc to return to normal mode
"set timeoutlen=10 ttimeoutlen=0

" mark 80th character on a line
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 100)

" flagship
set laststatus=2
set showtabline=2
set guioptions-=e

" syntastic
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_json_checkers = ['jsonlint']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '!'


" vim-jsx
let g:jsx_ext_required = 0

" remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"set ttimeoutlen=10

" improve experience with large files


" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" ycm & snippets
let g:ycm_python_binary_path = 'python'
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:UltiSnipsEditSplit="vertical"

" If you want :UltiSnipsEdit to split your window.
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsSnippetDirectories = [$HOME.'/dotfiles/vim/UltiSnips']
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger      = '<C-l>'
let g:UltiSnipsJumpBackwardTrigger     = '<C-k>'

nmap <leader>c<space> gcc
vmap <leader>c<space> gc

