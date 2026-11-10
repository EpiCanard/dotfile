return {
  -- Improve design of ui.select
  { "stevearc/dressing.nvim", main = "dressing" },

  -- Icons for nvim
  "kyazdani42/nvim-web-devicons",

  -- Improvate way of displaying tab
  {
    "nanozuki/tabby.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = require("epicanard.plugins.tabby"),
  },

  -- Formatter for lua
  "ckipp01/stylua-nvim",

  -- Display Hex code with colors
  { "norcalli/nvim-colorizer.lua", main = "colorizer", opts = { "*" } },

  -- Detect Ligh/Dark mode of macOs and change colorscheme (disabled on other OS)
  {
    "cormacrelf/dark-notify",
    cond = function()
      return vim.fn.has("macunix") == 1
    end,
    config = function()
      require("dark_notify").run({
        schemes = {
          dark = "oneduckdark",
          light = "oneducklight",
        },
      })
    end,
  },

  -- Add indent vertical dash (┊) to better see indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = { enabled = true, char = "│" },
      indent = { char = "┊" },
    },
  },

  -- Bottom status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "SmiteshP/nvim-navic", "kyazdani42/nvim-web-devicons" },
    config = require("epicanard.plugins.statusline"),
  },
}
