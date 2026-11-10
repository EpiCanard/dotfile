" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({previewer=false, file_ignore_patterns={"Spec"}})<cr>
nnoremap <leader>FF <cmd>lua require('telescope.builtin').find_files({previewer=false})<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>
nnoremap <leader>fs <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <leader>O <cmd>MetalsOrganizeImports<cr><cmd>w<cr>
nnoremap <leader>D <cmd>DiffviewFileHistory %<cr>
vnoremap <leader>D :DiffviewFileHistory<cr>

nnoremap <leader>fy <cmd>Telescope neoclip<cr>
nnoremap <leader>r zR
nnoremap <leader>K <cmd>Telescope keymaps<cr>
nnoremap <leader>ci <cmd>split \| terminal glab ci view<cr>

nnoremap df "_dd
nnoremap vp viw"0p

" Trouble
nnoremap q <cmd>Trouble close<cr><cmd>ccl<cr>
nnoremap gr <cmd>Glance references<cr>
nnoremap gi <cmd>Glance implementations<cr>
nnoremap gs <cmd>MetalsGotoSuperMethod<cr>
nnoremap <leader>dd <cmd>Trouble diagnostics toggle filter.buf=0<cr>
nnoremap <leader>wd <cmd>Trouble diagnostics toggle<cr>
nnoremap gR <cmd>MetalsGotoSuperMethod<cr><cmd>sleep 100m<cr><cmd>Glance references<cr>
nnoremap gd <cmd>Glance definitions<cr>

nnoremap <leader>ll :MetalsToggleLogs<CR>

nnoremap <leader>b :lua require("nvim-tree.api").tree.toggle({ path = vim.fn.getcwd(), update_root = false, find_file = true, focus = true, })<CR>
nnoremap <leader>, :Neogit<CR>

vnoremap < <gv
vnoremap > >gv

" Fold
nnoremap <leader>zz zMzvzz
nnoremap n nzz
nnoremap N Nzz

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

silent! nunmap grr
