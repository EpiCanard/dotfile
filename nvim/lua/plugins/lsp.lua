return {

  -- Lsp managers
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- Auto-completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",

  -- Cmp for luasnip
  "saadparwaiz1/cmp_luasnip",

  -- Debugger
  "mfussenegger/nvim-dap",
  { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
  "theHamsta/nvim-dap-virtual-text",

  -- Pictogram in cmp list
  "onsails/lspkind-nvim",

  -- Programming languages

  -- Lsp for C
  "p00f/clangd_extensions.nvim",

  -- Lsp for metals (scala)
  "scalameta/nvim-metals",

  -- Pretty lsp navigation
  { "folke/trouble.nvim", cmd = "Trouble", opts = {
    auto_jump = true,
    focus = true,
  } },

  -- Display lsp info in status line
  "wbthomason/lsp-status.nvim",
}
