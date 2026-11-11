return {
  "2giosangmitom/sqmeow.nvim",
  version = "*",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "Sqmeow",
  build = function()
    require("sqmeow").install()
  end,
  opts = {},
  keys = {
    { "<leader>qq", "<cmd>Sqmeow toggle<cr>", desc = "Toggle database UI" },
  },
}
