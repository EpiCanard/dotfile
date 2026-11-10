return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<C-p>", "<cmd>Telescope project<cr>", desc = "Choose project" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    {
      "<leader>m",
      function()
        require("metals")
        local telescope = require("telescope")
        telescope.load_extension("metals")
        telescope.extensions.metals.commands({})
      end,
      desc = "Metals commands",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-project.nvim",
    -- Collect clipboard history before the first Telescope picker is opened.
    { "AckslD/nvim-neoclip.lua", main = "neoclip", opts = {}, lazy = false },
    "danielfalk/smart-open.nvim",
  },
  config = require("epicanard.plugins.telescope"),
}
