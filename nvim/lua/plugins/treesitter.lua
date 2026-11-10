return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
  },

  -- Display breadcrump to see path to current location
  "SmiteshP/nvim-navic",

  -- Text objects / motions that can be used with treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
}
