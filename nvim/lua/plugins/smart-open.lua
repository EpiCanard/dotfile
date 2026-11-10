return {
  "danielfalk/smart-open.nvim",
  branch = "0.2.x",
  lazy = true,
  dependencies = {
    "kkharji/sqlite.lua",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}
