return function()
  local autocmd = vim.api.nvim_create_autocmd
  local augroup = vim.api.nvim_create_augroup

  local metals_config = require("metals").bare_config()

  -- Example of settings
  metals_config.settings = {
    showImplicitArguments = true,
    showImplicitConversionsAndClasses = true,
    showInferredType = true,
    automaticImportBuild = "all",
    excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    serverVersion = "1.6.9",
    scalafixConfigPath = vim.fs.normalize(
      vim.g.scalafix_config or vim.env.SCALAFIX_CONFIG or vim.fs.joinpath(vim.fn.stdpath("config"), "scalafix.conf")
    ),
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
  metals_config.capabilities = require("blink.cmp").get_lsp_capabilities(lsp_status.capabilities)

  metals_config.on_attach = function(client, bufnr)
    vim.lsp.codelens.enable(true, { bufnr = bufnr, client_id = client.id })
    vim.keymap.set("n", "<leader>t", require("epicanard.scala_tests").run, {
      buffer = bufnr,
      desc = "Run Scala test code lens in background",
    })
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
