return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      { "williamboman/mason.nvim", opts = {} },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = require("epicanard.lsp_servers"),
          automatic_enable = false,
        },
      },
      "SmiteshP/nvim-navic",
      "p00f/clangd_extensions.nvim",
    },
    config = require("epicanard.plugins.lsp"),
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    config = require("epicanard.plugins.completion"),
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = { auto_jump = true, focus = true },
  },
}
