vim.opt_local.shiftwidth = 4
vim.opt_local.colorcolumn = "160"

vim.b.undo_ftplugin = (vim.b.undo_ftplugin and vim.b.undo_ftplugin .. " | " or "")
  .. "setlocal shiftwidth< colorcolumn<"
