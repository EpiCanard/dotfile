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
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
      "theHamsta/nvim-dap-virtual-text",
    },
    config = require("epicanard.plugins.dap"),
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "SmiteshP/nvim-navic",
      "wbthomason/lsp-status.nvim",
      "mfussenegger/nvim-dap",
    },
    config = require("epicanard.plugins.metals"),
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = { auto_jump = true, focus = true },
  },
}
