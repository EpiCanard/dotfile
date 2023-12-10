vim.opt.shell = "/bin/zsh"
vim.opt.encoding = "utf8"

-- Hidden character
vim.opt.list = true
vim.opt.listchars:append({ tab = "→ " })
vim.opt.listchars:append({ trail = "⋅" })
vim.opt.listchars:append({ extends = "❯" })
vim.opt.listchars:append({ precedes = "❮" })

vim.opt.showbreak = "↪"
vim.opt.backspace = "indent,eol,start"

-- Tab
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Number column
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartcase = true
vim.opt.hidden = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"

-- Scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 2

vim.opt.mouse = "a"
vim.opt.cursorline = true

-- Open on right and below on split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Fold
--vim.opt.foldmethod=marker
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldlevel = 2
