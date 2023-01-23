local ls = require("luasnip")

ls.setup({
  history = true,
  update_events = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged",
})

vim.keymap.set({ "i", "s" }, "<c-s>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- Choose choice node in a telescope picker
-- vim.keymap.set({ "i", "s" }, "<c-u>", function()
--   require("luasnip.extras.select_choice")()
-- end)

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/epicanard/snippets/*.lua", true)) do
  loadfile(ft_path)()
end
