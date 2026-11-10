return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    cmd = {
      "DapContinue",
      "DapToggleBreakpoint",
      "DapClearBreakpoints",
      "DapToggleRepl",
      "DapStepOver",
      "DapStepInto",
      "DapStepOut",
      "DapPause",
      "DapTerminate",
      "DapDisconnect",
      "DapRestartFrame",
      "DapShowLog",
      "DapSetLogLevel",
      "DapNew",
      "DapEval",
    },
    keys = {
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue debugging",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle debug REPL",
      },
      {
        "<leader>ds",
        function()
          local widgets = require("dap.ui.widgets")
          widgets.centered_float(widgets.scopes)
        end,
        desc = "Show debug scopes",
      },
      {
        "<leader>dK",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Inspect debug value",
      },
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dso",
        function()
          require("dap").step_over()
        end,
        desc = "Debug step over",
      },
      {
        "<leader>dsi",
        function()
          require("dap").step_into()
        end,
        desc = "Debug step into",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Repeat last debug session",
      },
    },
    config = require("epicanard.plugins.dap"),
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {},
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {},
  },
}
