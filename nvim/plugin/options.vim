" Database
let g:db_ui_use_nerd_fonts=1
:command Db :tabnew +DBUIToggle
:command Dock :Telescope docker

set clipboard+=unnamedplus

if has('termguicolors')
  set termguicolors
endif

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

map gm :call SynGroup()<CR>

syntax on
