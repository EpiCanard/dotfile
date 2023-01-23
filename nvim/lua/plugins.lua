--stylua: ignore
return require('packer').startup(function(use)

  -- Packer
  use 'wbthomason/packer.nvim'

  -- Library
  use 'nvim-lua/plenary.nvim'

  -- Tree sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'RRethy/nvim-treesitter-textsubjects'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-project.nvim'

  -- Lsp
  use 'scalameta/nvim-metals'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'onsails/lspkind-nvim'
  use 'neovim/nvim-lspconfig'
  use 'p00f/clangd_extensions.nvim'
  use 'SmiteshP/nvim-navic'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Style
  use 'kyazdani42/nvim-web-devicons'
  use 'sainnhe/gruvbox-material'
  use 'nanozuki/tabby.nvim'
  use 'ckipp01/stylua-nvim'
  use 'ayu-theme/ayu-vim'
  use {'sonph/onehalf', rtp = '/vim'}
  use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}
  use {
    'cormacrelf/dark-notify',
    cond = function() return vim.fn.has('macunix') end,
    config = function()
      require('dark_notify').run({
        schemes = {
          dark  = "oneduckdark",
          light = "oneducklight"
        }
      })
    end
  }

  -- File tree
  use 'kyazdani42/nvim-tree.lua'

  -- Trouble
  use {'folke/trouble.nvim', config = function() require('trouble').setup({}) end}

  -- Git
  use 'TimUntersberger/neogit'
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'

  -- Database
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'

  -- Utils
  use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end}
  use {'stevearc/dressing.nvim', config = function() require('dressing').setup() end}
  use {'AckslD/nvim-neoclip.lua', config = function() require('neoclip').setup() end}
  use 'psliwka/vim-smoothie'
  use 'windwp/nvim-autopairs'
  use 'unblevable/quick-scope'
  use 'terryma/vim-expand-region'
  use {'phaazon/hop.nvim', branch = 'v2'}
  use {'asiryk/auto-hlsearch.nvim', config = function() require('auto-hlsearch').setup() end}

  -- Status line
  use 'nvim-lualine/lualine.nvim'
  use 'wbthomason/lsp-status.nvim'
--   use 'arkav/lualine-lsp-progress'


  -- Test
  use 'vim-test/vim-test'
end)
