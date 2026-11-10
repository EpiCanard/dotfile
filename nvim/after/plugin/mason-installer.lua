require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = require("epicanard.lsp_servers"),
  automatic_enable = false,
})
