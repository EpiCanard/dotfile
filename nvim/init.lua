if not require("epicanard.lazy_checker")() then
  return
end

vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.o.foldcolumn = "0"

require("epicanard.options")
vim.cmd.colorscheme("oneducklight")

require("lazy").setup("plugins")

require("epicanard.commands")
require("epicanard.keymaps")

if vim.api.nvim_get_runtime_file("lua/local.lua", false)[1] then
  local ok, err = pcall(require, "local")
  if not ok then
    vim.notify("Error loading local configuration: " .. tostring(err), vim.log.levels.ERROR)
  end
end
