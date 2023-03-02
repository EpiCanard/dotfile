local function setup(package, module)
  return {
    package,
    config = function()
      require(module).setup({})
    end,
  }
end

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
  "L3MON4D3/LuaSnip",

  "scalameta/nvim-metals",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "saadparwaiz1/cmp_luasnip",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "theHamsta/nvim-dap-virtual-text",
  "onsails/lspkind-nvim",
  "neovim/nvim-lspconfig",
  "p00f/clangd_extensions.nvim",
  "SmiteshP/nvim-navic",

  -- Style
  "kyazdani42/nvim-web-devicons",
  "nanozuki/tabby.nvim",
  "ckipp01/stylua-nvim",
  setup("norcalli/nvim-colorizer.lua", "colorizer"),
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
  setup("folke/trouble.nvim", "trouble"),

  -- Git
  "TimUntersberger/neogit",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",

  -- Database
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "kristijanhusak/vim-dadbod-completion",

  -- Utils
  setup("numToStr/Comment.nvim", "Comment"),
  setup("stevearc/dressing.nvim", "dressing"),
  setup("kylechui/nvim-surround", "nvim-surround"),
  setup("AckslD/nvim-neoclip.lua", "neoclip"),
  "windwp/nvim-autopairs",
  setup("asiryk/auto-hlsearch.nvim", "auto-hlsearch"),

  "lpoto/telescope-docker.nvim",

  -- Motion
  "psliwka/vim-smoothie",
  "terryma/vim-expand-region",
  { "phaazon/hop.nvim", branch = "v2" },

  -- Status line
  "nvim-lualine/lualine.nvim",
  "wbthomason/lsp-status.nvim",
  --   use 'arkav/lualine-lsp-progress'
  "liangxianzhe/nap.nvim",

  -- Test
  "vim-test/vim-test",
  "ziontee113/SelectEase",
}
