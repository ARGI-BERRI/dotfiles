set nocompatible

"
" Encode
"
set encoding=utf-8 nobomb
set fileencoding=utf-8
set fileencodings=utf-8

" 
" Mode
"
set backspace=indent,eol,start

"
" Status Line
"
set cmdheight=1
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

"
" File Util
"
set autoread
set hidden
set noswapfile
set nobackup

"
" View
"
set title
set number
set ruler
set cursorline
set showmatch
set showcmd
set showmode
set showmatch
set scrolloff=5

"
" Tab
"
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent

"
" Searching
"
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch

"
" Command
"
set wildmenu

"
" Others
"
set ttyfast
set gdefault
set noerrorbells

"
" Color
"
let base16colorspace=256
colorscheme ron
syntax on

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'chriskempson/base16-vim'
call plug#end()