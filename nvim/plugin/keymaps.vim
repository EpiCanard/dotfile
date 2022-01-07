let mapleader = "="
set shortmess-=F

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap q <cmd>TroubleClose<cr>
nnoremap gr <cmd>Trouble lsp_references<cr>

nnoremap <leader>ll :MetalsToggleLogs<CR>

nnoremap <leader>) :NvimTreeFindFileToggle<CR>
nnoremap <leader>n :Neogit<CR>

vnoremap < <gv
vnoremap < <gv

" easy switch between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" clean highlight after a search with /
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
