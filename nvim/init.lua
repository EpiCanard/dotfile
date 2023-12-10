if not require("epicanard.lazy_checker")() then
  return
end

vim.g.mapleader = " "
vim.opt.termguicolors = true

require("epicanard.options")
require("lazy").setup("plugins")
