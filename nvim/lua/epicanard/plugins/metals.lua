return function()
  local autocmd = vim.api.nvim_create_autocmd
  local augroup = vim.api.nvim_create_augroup

  local metals_config = require("metals").bare_config()

  -- Example of settings
  metals_config.settings = {
    showImplicitArguments = true,
    showImplicitConversionsAndClasses = true,
    showInferredType = true,
    autoImportBuild = "all",
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    serverVersion = "1.6.9",
    scalafixConfigPath = os.getenv("HOME") .. "/.config/nvim/scalafix.conf",
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

  local lsp_status = require("lsp-status")
  local capabilities = lsp_status.capabilities

  --local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  metals_config.capabilities = capabilities

  metals_config.on_attach = function(client, bufnr)
    if package.loaded.dap then
      require("metals").setup_dap()
    end
    lsp_status.on_attach(client)
    require("nvim-navic").attach(client, bufnr)
  end

  ----------------------------------
  -- COMMANDS ----------------------
  ----------------------------------
  -- LSP
  local lsp_augroup = augroup("Metals", { clear = true })
  autocmd("FileType", { pattern = "scala", command = "setlocal omnifunc=v:lua.vim.lsp.omnifunc", group = lsp_augroup })
  autocmd("FileType", {
    pattern = { "scala", "sbt", "sc" },
    callback = function()
      require("metals").initialize_or_attach(metals_config)
    end,
    group = lsp_augroup,
  })

  if package.loaded.telescope then
    require("telescope").load_extension("metals")
  end
end
