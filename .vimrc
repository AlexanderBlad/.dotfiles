set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'joshdick/onedark.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
"Plugin 'davidhalter/jedi-vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'airblade/vim-gitgutter'
" ..
" All of your Plugins must be added before the following line
"""  Mappings """
let mapleader = "," 
map <space> %s/
"map <space> ?
imap jj <esc>
" disable highlight when using leader
inoremap <silent> <leader><cr> :noh<cr> 
inoremap <leader>1 ()<esc>i
inoremap <leader>2 []<esc>i
inoremap <leader>3 {}<esc>i
inoremap <leader>4 {<esc>o}<esc>o
inoremap <leader>q ''<esc>i
inoremap <leader>e ""<esc>i
inoremap <leader>t <><esc>i
call vundle#end()            " required
filetype plugin indent on    " required

set pythonthreehome=
set pythonthreedll=
set number 
syntax on
set hidden
let mapleader = "," 
set history=100
filetype indent on
set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" Enable folding
set foldmethod=indent
set foldlevel=99
" map folding to spacebar
nnoremap <tab> za 

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

set encoding=utf-8

let python_highlight_all=1
syntax on
colorscheme onedark

"hi Normal guibg=NONE ctermbg=NONE
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F8> :cprevious<Return>
map <F10> :cnext<Return>

" Open NerdTree automatically when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" Disable rope mode, this should fix slow autocompletion with jedi-vim
let g:pymode_rope = 0

" Give the ability to copy and paste using vim yank and paste
set clipboard=unnamed
