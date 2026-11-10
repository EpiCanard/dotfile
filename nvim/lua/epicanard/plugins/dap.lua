return function()
  local dap = require("dap")
  local scala_tests = require("epicanard.scala_tests")
  scala_tests.setup(dap)

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
  dap.listeners.before.event_initialized["dapui_config"] = function(session)
    if not scala_tests.is_background(session) then
      require("nvim-dap-virtual-text")
      require("dapui")
    end
  end
  -- Keep the output visible after the session ends to inspect test results.
  dap.listeners.after.event_initialized["dapui_config"] = function(session)
    if not scala_tests.is_background(session) then
      require("dapui").open()
    end
  end
  if type(package.loaded.metals) == "table" then
    require("metals").setup_dap()
  end
end
