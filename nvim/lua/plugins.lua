return {

  -- Library
  "nvim-lua/plenary.nvim",

  -- Tree sitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  --use 'nvim-treesitter/nvim-treesitter-context'
  "nvim-treesitter/playground",
  "RRethy/nvim-treesitter-textsubjects",
  "nvim-treesitter/nvim-treesitter-textobjects",

  -- Telescope
  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-telescope/telescope-symbols.nvim",
  "nvim-telescope/telescope-project.nvim",

  -- Lsp
  "scalameta/nvim-metals",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "onsails/lspkind-nvim",
  "neovim/nvim-lspconfig",
  "p00f/clangd_extensions.nvim",
  "SmiteshP/nvim-navic",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Style
  "kyazdani42/nvim-web-devicons",
  "nanozuki/tabby.nvim",
  "ckipp01/stylua-nvim",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
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

  -- File tree
  "kyazdani42/nvim-tree.lua",

  -- Trouble
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end,
  },

  -- Git
  "TimUntersberger/neogit",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",

  -- Database
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "kristijanhusak/vim-dadbod-completion",

  -- Utils
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  },
  "psliwka/vim-smoothie",
  "windwp/nvim-autopairs",
  "terryma/vim-expand-region",
  { "phaazon/hop.nvim", branch = "v2" },
  {
    "asiryk/auto-hlsearch.nvim",
    config = function()
      require("auto-hlsearch").setup()
    end,
  },

  "lpoto/telescope-docker.nvim",
  -- Status line
  "nvim-lualine/lualine.nvim",
  "wbthomason/lsp-status.nvim",
  --   use 'arkav/lualine-lsp-progress'
  "liangxianzhe/nap.nvim",

  -- Test
  "vim-test/vim-test",
  "ziontee113/SelectEase",
}
