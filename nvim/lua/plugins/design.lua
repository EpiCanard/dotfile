return {
  -- Improve design of ui.select
  { "stevearc/dressing.nvim", main = "dressing" },

  -- Icons for nvim
  "kyazdani42/nvim-web-devicons",

  -- Improvate way of displaying tab
  "nanozuki/tabby.nvim",

  -- Formatter for lua
  "ckipp01/stylua-nvim",

  -- Display Hex code with colors
  { "norcalli/nvim-colorizer.lua", main = "colorizer" },

  -- Detect Ligh/Dark mode of macOs and change colorscheme (disabled on other OS)
  {
    "cormacrelf/dark-notify",
    cond = function()
      return vim.fn.has("macunix")
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
      scope = { enabled = true },
      indent = { char = "┊" },
    },
  },

  -- Bottom status line
  "nvim-lualine/lualine.nvim",
}
