let mapleader = "="
set shortmess-=F

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg "zyiw<ESC>:Telescope live_grep default_text=<C-r>z<cr>
vnoremap <leader>fg "zy<ESC>:Telescope live_grep default_text=<C-r>z<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap q <cmd>TroubleClose<cr>
nnoremap gr <cmd>Trouble lsp_references<cr>
nnoremap gi <cmd>Trouble lsp_implementations<cr>

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
" when in terminal, remap tu use Esc
tnoremap <Esc> <C-\><C-n>

" copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
