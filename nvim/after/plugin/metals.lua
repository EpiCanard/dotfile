local map = require("epicanard.utils").map
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")

-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("", "K", ":lua vim.lsp.buf.hover()<CR>", {silent = true})
-- map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- map("n", "gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>ws", '<cmd>lua require"metals".worksheet_hover()<CR>')
map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
map("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
map("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")

----------------------------------
-- LSP Setup ---------------------
----------------------------------
metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
  serverVersion = "0.11.6",
  scalafixConfigPath = os.getenv("HOME") .. "/.config/nvim/scalafix.conf"
}

-- Example of how to ovewrite a handler
metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = { prefix = "" },
})

-- *READ THIS*
-- I *highly* recommend setting statusBarProvider to true, however if you do,
-- you *have* to have a setting to display this in your statusline or else
-- you'll not see any messages from metals. There is more info in the help
-- docs about this
metals_config.init_options.statusBarProvider = "on"

local lsp_status = require('lsp-status')
local capabilities = lsp_status.capabilities

--local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

metals_config.capabilities = capabilities

metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()
  lsp_status.on_attach(client)
end

----------------------------------
-- COMMANDS ----------------------
----------------------------------
-- LSP
local lsp_augroup = augroup("lsp", { clear = true })
autocmd("FileType", { pattern = "scala", command = "setlocal omnifunc=v:lua.vim.lsp.omnifunc", group = lsp_augroup })
autocmd("FileType", { pattern = { "scala", "sbt" }, callback = function()
  require("metals").initialize_or_attach(metals_config)
end, group = lsp_augroup })

-- Need for symbol highlights to work correctly
vim.highlight.link("LspCodeLens", "CursorColumn", true)
vim.highlight.link("LspReferenceText", "CursorColumn", true)
vim.highlight.link("LspReferenceRead", "CursorColumn", true)
vim.highlight.link("LspReferenceWrite", "CursorColumn", true)

