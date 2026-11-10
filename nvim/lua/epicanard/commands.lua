vim.api.nvim_create_user_command("Note", function()
  local notes_path = os.getenv("NOTES_PATH") or vim.fn.expand("~/.notes/")
  require("nvim-tree.api").tree.open({ path = notes_path, update_root = false })
end, {})

vim.api.nvim_create_user_command("ScalaTestExplorer", function()
  require("epicanard.scala_test_explorer").open()
end, { desc = "Select Scala test suites from the workspace to run sequentially" })
