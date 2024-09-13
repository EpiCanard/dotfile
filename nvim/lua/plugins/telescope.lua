return {
  "nvim-telescope/telescope.nvim",

  -- Telescope extensions for fzf
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Telescope extensions for symbols/emoji
  "nvim-telescope/telescope-symbols.nvim",

  -- Telescope extensions to list and navigate between projects
  "nvim-telescope/telescope-project.nvim",

  -- Telescope extensions for docker
  "lpoto/telescope-docker.nvim",

  -- Telescope extensions for handle clipboard
  { "AckslD/nvim-neoclip.lua", main = "neoclip" },
}
