autocmd BufWritePre * :%s/\s\+$//e

autocmd BufWritePre *.scala :lua vim.lsp.buf.format { async = true }
autocmd BufWritePre *.lua :lua require("stylua-nvim").format_file()
autocmd BufEnter *.java :set colorcolumn=160

autocmd TermOpen * startinsert

autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }

function! s:expand_commit_template()
  let context = {
        \ 'MY_BRANCH': matchstr(system('git rev-parse --abbrev-ref HEAD'), 'CT-\p\+'),
        \ }

  let lnum = nextnonblank(1)
  while lnum && lnum < line('$')
    call setline(lnum, substitute(getline(lnum), '\${\(\w\+\)}',
          \ '\=get(context, submatch(1), submatch(0))', 'g'))
    let lnum = nextnonblank(lnum + 1)
  endwhile
endfunction

autocmd Filetype NeogitCommitMessage,COMMIT_EDITMSG,gitcommit call s:expand_commit_template()
