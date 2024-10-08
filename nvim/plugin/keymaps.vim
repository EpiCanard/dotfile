let mapleader = " "
set shortmess-=F

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files previewer=false<cr>
nnoremap <leader>fg "zyiw<ESC>:Telescope live_grep layout_strategy=vertical default_text=<C-r>z<cr>
vnoremap <leader>fg "zy<ESC>:lua require('telescope.builtin').live_grep({default_text='<C-r>z'})<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>
nnoremap <leader>fs <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <leader>fds <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>o <cmd>MetalsOrganizeImports<cr>
nnoremap <leader>D <cmd>DiffviewFileHistory %<cr>

nnoremap <leader>P <cmd>Telescope neoclip<cr>
nnoremap <leader>c <cmd>Neogit commit<cr>
nnoremap <C-t> <cmd>ToggleTerm<CR>
tnoremap <C-t> <cmd>ToggleTerm<CR>
nnoremap <leader>c <cmd>Telescope colorscheme default_text=duck<cr>

nnoremap df "_dd
nnoremap vp viwp

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap q <cmd>TroubleClose<cr>
nnoremap gr <cmd>Trouble lsp_references<cr>
nnoremap gi <cmd>Trouble lsp_implementations<cr>
nnoremap gs <cmd>MetalsGotoSuperMethod<cr>
nnoremap <leader>dd <cmd>Trouble document_diagnostics<cr>
nnoremap <leader>wd <cmd>Trouble workspace_diagnostics<cr>
nnoremap gR <cmd>MetalsGotoSuperMethod<cr><cmd>sleep 100m<cr><cmd>Trouble lsp_references<cr>

nnoremap <leader>ll :MetalsToggleLogs<CR>

nnoremap <leader>b :lua require("nvim-tree.api").tree.toggle({ path = vim.fn.getcwd(), update_root = false, find_file = true, focus = true, })<CR>
nnoremap <leader>n :Neogit<CR>

vnoremap < <gv
vnoremap > >gv

" Fold
nnoremap <leader>zz zMzvzz
nnoremap n nzMzvzz
nnoremap N NzMzvzz

" clean highlight after a search with /
nnoremap <silent> <leader><Esc> :nohlsearch<CR>
" when in terminal, remap tu use Esc
tnoremap <Esc> <C-\><C-n>

" copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

" Replace current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>S :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>s "ay<esc>:%s/<C-r>a/
vnoremap <Leader>S "ay<esc>:%s/<C-r>a/<C-r>a

" visually select your last past
nnoremap gp `[v`]

nmap <silent> <leader>t :TestNearest<CR>

