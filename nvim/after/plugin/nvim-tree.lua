require("nvim-tree").setup({
  hijack_cursor = true,
  update_cwd = true,
  diagnostics = {
    enable = true,
  },
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})
