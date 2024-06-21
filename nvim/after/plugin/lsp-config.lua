local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

require("clangd_extensions").setup()

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          "vim",
          "next",
          "pairs",
          "pcall",
          "type",
          "tostring",
          "ipairs",
          "table",
          "string",
          "require",
          "setmetatable",
          "print",
          "unpack",
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
})

lspconfig.jdtls.setup({
  settings = {
    java = {
      completion = {
        importOrder = {
          "",
          "java",
          "javax",
          "#",
        },
      },
    },
  },
})

lspconfig.pyright.setup({})

lspconfig.robotframework_ls.setup({
  cmd = { "typescript-language-server", "--stdio", "--jsx" },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup({
  capabilities = capabilities,
})

lspconfig.tsserver.setup({})

lspconfig.sqlls.setup({
  root_dir = lspconfig.util.root_pattern(".git"),
})
