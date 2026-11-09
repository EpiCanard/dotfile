local navic = require("nvim-navic")

require("clangd_extensions").setup()

vim.lsp.config("lua_ls", {
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

vim.lsp.config("jdtls", {
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

vim.lsp.config("pyright", {})

vim.lsp.config("robotframework_ls", {})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("html", {
  capabilities = capabilities,
})

vim.lsp.config("ts_ls", {})

vim.lsp.config("sqlls", {
  root_markers = { ".git" },
})

vim.lsp.enable({ "lua_ls", "jdtls", "pyright", "robotframework_ls", "html", "ts_ls", "sqlls" })
