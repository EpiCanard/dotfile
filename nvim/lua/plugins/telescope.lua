return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-symbols.nvim",
    "nvim-telescope/telescope-project.nvim",
    { "AckslD/nvim-neoclip.lua", main = "neoclip", opts = {} },
    "danielfalk/smart-open.nvim",
    "scalameta/nvim-metals",
  },
  config = require("epicanard.plugins.telescope"),
}
