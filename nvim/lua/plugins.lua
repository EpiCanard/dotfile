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
  {
    "Dynge/gitmoji.nvim",
    main = "gitmoji",
    opts = {
      filetypes = { "NeogitCommitMessage" },
      completion = { complete_as = "text" },
    },
    ft = "NeogitCommitMessage",
  },

  -- Lsp
  "L3MON4D3/LuaSnip",

  "scalameta/nvim-metals",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "saadparwaiz1/cmp_luasnip",
  "mfussenegger/nvim-dap",
  { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
  "theHamsta/nvim-dap-virtual-text",
  "onsails/lspkind-nvim",
  "neovim/nvim-lspconfig",
  "p00f/clangd_extensions.nvim",
  "SmiteshP/nvim-navic",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Style
  "kyazdani42/nvim-web-devicons",
  "nanozuki/tabby.nvim",
  "ckipp01/stylua-nvim",
  { "norcalli/nvim-colorizer.lua", main = "colorizer" },
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
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "┊" },
    },
  },

  -- File tree
  "kyazdani42/nvim-tree.lua",

  -- Trouble
  { "folke/trouble.nvim", cmd = "Trouble", opts = {} },

  -- Git
  "TimUntersberger/neogit",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",

  -- Database
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "kristijanhusak/vim-dadbod-completion",

  -- Utils
  { "numToStr/Comment.nvim", main = "Comment" },
  { "stevearc/dressing.nvim", main = "dressing" },
  "kylechui/nvim-surround",
  { "AckslD/nvim-neoclip.lua", main = "neoclip" },
  "windwp/nvim-autopairs",
  { "asiryk/auto-hlsearch.nvim", main = "auto-hlsearch" },

  "lpoto/telescope-docker.nvim",

  -- Motion
  "psliwka/vim-smoothie",
  "terryma/vim-expand-region",
  { "phaazon/hop.nvim", branch = "v2" },
  {
    "chrisgrieser/nvim-various-textobjs",
    main = "various-textobjs",
    opts = { useDefaultKeymaps = true },
  },

  -- Status line
  "nvim-lualine/lualine.nvim",
  "wbthomason/lsp-status.nvim",
  --   use 'arkav/lualine-lsp-progress'
  "liangxianzhe/nap.nvim",

  -- Test
  "vim-test/vim-test",
  "ziontee113/SelectEase",
  { "akinsho/toggleterm.nvim", main = "toggleterm" },
}
