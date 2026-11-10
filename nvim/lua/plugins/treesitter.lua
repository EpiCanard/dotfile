return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      "neovim-treesitter/treesitter-parser-registry",
      { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    config = require("epicanard.plugins.treesitter"),
  },

  -- Display breadcrump to see path to current location
  "SmiteshP/nvim-navic",
}
