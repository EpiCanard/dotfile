return function()
  local dap = require("dap")
  -- Setup
  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run",
      metals = {
        runType = "run",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Run play",
      metals = {
        runType = "run",
        mainClass = "play.core.server.ProdServerStart",
        envFile = "configurations/envs/local/perso_conf.env",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test File",
      metals = {
        runType = "testFile",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }
  dap.listeners.before.event_initialized["dapui_config"] = function()
    require("nvim-dap-virtual-text")
    require("dapui")
  end
  dap.listeners.after.event_initialized["dapui_config"] = function()
    require("dapui").open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    if package.loaded.dapui then
      require("dapui").close()
    end
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    if package.loaded.dapui then
      require("dapui").close()
    end
  end
  if type(package.loaded.metals) == "table" then
    require("metals").setup_dap()
  end
end
