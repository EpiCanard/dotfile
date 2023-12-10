autocmd BufWritePre * :%s/\s\+$//e

autocmd BufWritePre *.scala :lua vim.lsp.buf.format { async = true }
autocmd BufWritePre *.lua :lua require("stylua-nvim").format_file()
autocmd BufEnter *.java :set colorcolumn=160

autocmd TermOpen * startinsert

autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
