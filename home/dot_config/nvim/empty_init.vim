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

colorscheme habamax

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi Special guibg=NONE ctermbg=NONE
hi Identifier guibg=NONE ctermbg=NONE
