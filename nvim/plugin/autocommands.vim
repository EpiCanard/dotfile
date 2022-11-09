autocmd BufWritePre * :%s/\s\+$//e

autocmd BufWritePre *.scala :lua vim.lsp.buf.formatting()
autocmd BufWritePre *.lua :lua require("stylua-nvim").format_file()

autocmd TermOpen * startinsert

autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
