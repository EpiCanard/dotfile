let mapleader = "="
set shortmess-=F

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg "zyiw<ESC>:Telescope live_grep default_text=<C-r>z<cr>
vnoremap <leader>fg "zy<ESC>:Telescope live_grep default_text=<C-r>z<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <leader>fds <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>o <cmd>MetalsOrganizeImports<cr>

nnoremap df "_dd

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap q <cmd>TroubleClose<cr>
nnoremap gr <cmd>Trouble lsp_references<cr>
nnoremap gi <cmd>Trouble lsp_implementations<cr>
nnoremap <leader>dd <cmd>Trouble document_diagnostics<cr>
nnoremap <leader>wd <cmd>Trouble workspace_diagnostics<cr>

nnoremap <leader>ll :MetalsToggleLogs<CR>

nnoremap <leader>) :NvimTreeFindFileToggle<CR>
nnoremap <leader>n :Neogit<CR>

vnoremap < <gv
vnoremap > >gv

" easy switch between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" clean highlight after a search with /
nnoremap <silent> <leader><Esc> :nohlsearch<CR>
" when in terminal, remap tu use Esc
tnoremap <Esc> <C-\><C-n>

" copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" visually select your last past
nnoremap gp `[v`]

nmap <silent> <leader>t :TestNearest<CR>
