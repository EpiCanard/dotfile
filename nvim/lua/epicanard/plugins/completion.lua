return function()
  require("blink.cmp").setup({
    keymap = {
      preset = "none",
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Esc>"] = { "cancel", "fallback" },
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        function(cmp)
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
          if col > 0 and not text:sub(col, col):match("%s") then
            return cmp.show()
          end
        end,
        "fallback",
      },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    completion = {
      list = { selection = { preselect = false, auto_insert = false } },
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          components = { label = { width = { max = 75 } } },
        },
      },
      documentation = { auto_show = true },
    },
    snippets = { preset = "luasnip" },
    signature = { enabled = true },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      per_filetype = {
        gitcommit = { "gitmoji", inherit_defaults = true },
        NeogitCommitMessage = { "gitmoji", inherit_defaults = true },
      },
      providers = {
        gitmoji = {
          name = "Gitmoji",
          module = "gitmoji.blink",
          opts = {
            filetypes = { "NeogitCommitMessage", "gitcommit" },
            completion = { append_space = true, complete_as = "text" },
          },
        },
      },
    },
    cmdline = { enabled = false },
  })
end
