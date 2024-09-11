local api = require("nvim-tree.api")

vim.api.nvim_create_user_command("Note", function()
  api.tree.open({ path = "~/.notes/", update_root = false })
end, {})
