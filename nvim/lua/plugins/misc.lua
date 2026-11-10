return {
  -- Lib
  "nvim-lua/plenary.nvim",

  -- Floating term that can be toggled
  { "akinsho/toggleterm.nvim", main = "toggleterm", opts = {} },

  -- Snippet
  { "L3MON4D3/LuaSnip", config = require("epicanard.plugins.luasnip") },

  -- File tree
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = require("epicanard.plugins.tree"),
  },

  -- Comment for many language support
  { "numToStr/Comment.nvim", main = "Comment" },

  -- Surround selection with charactère
  "kylechui/nvim-surround",

  -- Automatically add pair (brackets, etc)
  {
    "windwp/nvim-autopairs",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = require("epicanard.plugins.autopairs"),
  },

  -- Highlight searched words
  { "asiryk/auto-hlsearch.nvim", main = "auto-hlsearch" },

  -- Test
  "vim-test/vim-test",
}
