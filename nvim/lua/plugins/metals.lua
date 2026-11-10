return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "sc" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "SmiteshP/nvim-navic",
    "wbthomason/lsp-status.nvim",
  },
  keys = {
    {
      "<leader>ws",
      function()
        require("metals").worksheet_hover()
      end,
      desc = "Inspect Scala worksheet",
    },
  },
  config = require("epicanard.plugins.metals"),
}
