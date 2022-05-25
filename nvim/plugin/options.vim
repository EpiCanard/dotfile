set shell=/bin/zsh
set encoding=utf8

" Hidden character
set list
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮

set showbreak=↪
set backspace=indent,eol,start

" Tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set completeopt=menuone,noinsert,noselect,preview

" Number column
set number
set relativenumber

set smartcase
set hidden

set signcolumn=yes
set colorcolumn=120

" Scroll
set scrolloff=8
set sidescrolloff=8

set mouse=a

" Open on right and below on split
set splitbelow
set splitright

" Fold
"set foldmethod=marker
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set foldlevel=2
