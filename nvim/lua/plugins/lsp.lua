return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
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
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim",
    },
    config = require("epicanard.plugins.completion"),
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = { auto_jump = true, focus = true },
  },
}
