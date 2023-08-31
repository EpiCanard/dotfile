local diffview = require("diffview")
local actions = require("diffview.actions")

diffview.setup({
  enhanced_diff_hl = false,
  key_bindings = {
    view = {
      ["q"] = diffview.close,
      ["<C-x>"] = actions.cycle_layout,
      ["<esc>"] = "<esc>",
    },
    file_panel = {
      ["<tab>"] = actions.select_next_entry,
      ["<s-tab>"] = actions.select_prev_entry,
      ["<leader>e"] = actions.focus_files,
      ["<leader>b"] = actions.toggle_files,
      ["q"] = diffview.close,
      ["<esc>"] = "<esc>",
    },
    file_history_panel = {
      ["q"] = diffview.close,
    },
    option_panel = {
      ["q"] = diffview.close,
    },
  },
})
