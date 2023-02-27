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

" Number column
set number
set relativenumber

set smartcase
set hidden

set signcolumn=yes
set colorcolumn=120

" Scroll
set scrolloff=8
set sidescrolloff=2

set mouse=a
set cursorline

" Open on right and below on split
set splitbelow
set splitright

" Fold
"set foldmethod=marker
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set foldlevel=2

" Database
let g:db_ui_use_nerd_fonts=1
:command Db :tabnew +DBUIToggle
:command Dock :Telescope docker

if has('termguicolors')
  set termguicolors
endif


function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

map gm :call SynGroup()<CR>
