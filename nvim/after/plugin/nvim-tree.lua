vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_group_empty = 1

require('nvim-tree').setup {
  auto_close = true,
  diagnostics = {
    enable = true
  },
  view = {
    auto_resize = true
  }
}
