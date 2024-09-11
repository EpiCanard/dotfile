if not require("epicanard.lazy_checker")() then
  return
end

vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.o.foldcolumn = "0"

require("epicanard.options")

require("lazy").setup("plugins")

require("epicanard.commands")
