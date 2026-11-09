require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "jdtls", "lua_ls", "ts_ls", "eslint" },
})
