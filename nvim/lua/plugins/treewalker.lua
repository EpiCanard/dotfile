return {
  "aaronik/treewalker.nvim",
  dependencies = { "nvimtools/hydra.nvim" },
  config = function()
    local Hydra = require("hydra")
    local hint = [[
          _<C-h>_: parent   _<C-j>_: next   _<C-k>_: previous   _<C-l>_: child
          ^
          ^ ^              _q_: exit
      ]]

    Hydra({
      name = "Treewalker",
      hint = hint,
      config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
          position = "bottom",
          float_opts = {
            border = "rounded",
          },
        },
      },
      mode = { "n", "v" },
      body = "<leader>.",
      heads = {
        { "<C-h>", "<cmd>Treewalker Left<cr>" },
        { "<C-j>", "<cmd>Treewalker Down<cr>" },
        { "<C-k>", "<cmd>Treewalker Up<cr>" },
        { "<C-l>", "<cmd>Treewalker Right<cr>" },
        { "q", nil, { exit = true, nowait = true } },
      },
    })
  end,
}
