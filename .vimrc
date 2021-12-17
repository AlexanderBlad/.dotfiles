set nocompatible              " required
filetype off                  " required
" Will install vim-plug if not already installed 
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" To install plugins write command: PlugInstall
call plug#begin('~/.vim/plugged')
" Here all plug goes

Plug 'davidhalter/jedi-vim'

" For using vim with conda, especially jedi
Plug 'cjrh/vim-conda'

" Better and faster folding
Plug 'tmhedberg/SimpylFold'

Plug 'tell-k/vim-autopep8'

" Folding according to PEP8
Plug 'vim-scripts/indentpython.vim'

" Syntax checking 
Plug 'vim-syntastic/syntastic'

" Syntax check according to flake8
Plug 'nvie/vim-flake8'

" Theme for vim
Plug 'joshdick/onedark.vim'

" Navigating tmux and vim simulatounsly
Plug 'christoomey/vim-tmux-navigator'

" Plugin for in-editor tree (ctrl-n)
Plug 'scrooloose/nerdtree'

" commision difference in editor
Plug 'airblade/vim-gitgutter'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Status/tabline
Plug 'vim-airline/vim-airline'

call plug#end()

"       
"       Mappings 
"
let mapleader = "," 
" search with space
map <space> ?

inoremap <leader>1 ()<esc>i
inoremap <leader>2 []<esc>i
inoremap <leader>3 {}<esc>i
inoremap <leader>4 {<esc>o}<esc>o
inoremap <leader>q ''<esc>i
inoremap <leader>e ""<esc>i
inoremap <leader>t <><esc>i
inoremap <leader><Tab> <esc>wwi

"
"       settings
"
syntax on
set hidden
let mapleader = "," 
set history=100
filetype indent on
set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on autoindenting
set number relativenumber " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set autochdir     " sets filepathing to relative

" Enable folding
set foldmethod=indent
set foldlevel=99
" map folding to tab
nnoremap <tab> za 

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent

set fileformat=unix
set encoding=utf-8

" Visual stuff
let python_highlight_all=1
syntax on
colorscheme onedark

" Run python for errors in editor
nnoremap <buffer> <F9> :exec '!ipython' shellescape(@%, 1)<cr>
autocmd FileType python noremap <buffer> <F10> :call Autopep8()<CR>
map <F7> :cprevious<Return>
map <F8> :cnext<Return>
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

"
"       Changes to plugs
"

" Open NerdTree automatically when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Synthastic fixes
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['jshint']


" Give the ability to copy and paste using vim yank and paste
set clipboard=unnamed



" Make jedi-vim config
let g:jedi#use_tabs_not_buffers = 1 " Make jedi-vim use tabs when going to a definition 
let g:jedi#popup_select_first = 0


