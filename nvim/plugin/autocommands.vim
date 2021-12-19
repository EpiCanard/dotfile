autocmd BufWritePre * :%s/\s\+$//e

autocmd BufWritePre *.scala :lua vim.lsp.buf.formatting()
