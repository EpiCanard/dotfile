return {
  -- Lib
  "nvim-lua/plenary.nvim",

  -- Floating term that can be toggled
  { "akinsho/toggleterm.nvim", main = "toggleterm", opts = {} },

  -- Snippet
  { "L3MON4D3/LuaSnip", lazy = true, config = require("epicanard.plugins.luasnip") },

  -- File tree
  {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeOpen", "NvimTreeClose", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeRefresh" },
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
    event = "InsertEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = require("epicanard.plugins.autopairs"),
  },

  -- Highlight searched words
  { "asiryk/auto-hlsearch.nvim", main = "auto-hlsearch" },

  -- Test
  "vim-test/vim-test",
}
