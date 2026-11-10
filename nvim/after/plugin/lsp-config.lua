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

local eslint_on_attach = vim.lsp.config.eslint.on_attach
local eslint_augroup = vim.api.nvim_create_augroup("EslintFixOnSave", { clear = true })

vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    if eslint_on_attach then
      eslint_on_attach(client, bufnr)
    end

    local commands = vim.api.nvim_buf_get_commands(bufnr, {})
    local fix_all = commands.LspEslintFixAll and "LspEslintFixAll" or commands.EslintFixAll and "EslintFixAll"
    if not fix_all then
      return
    end

    vim.api.nvim_clear_autocmds({ group = eslint_augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = eslint_augroup,
      buffer = bufnr,
      callback = function()
        if vim.lsp.buf_is_attached(bufnr, client.id) then
          vim.cmd(fix_all)
        end
      end,
    })
  end,
})

vim.lsp.config("sqlls", {
  root_markers = { ".git" },
})

vim.lsp.enable(require("epicanard.lsp_servers"))
