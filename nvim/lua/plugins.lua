return require('packer').startup(function(use)
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-lua/plenary.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
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
  use 'onsails/lspkind-nvim'
  use 'neovim/nvim-lspconfig'
  use 'p00f/clangd_extensions.nvim'

  -- Style
  use 'kyazdani42/nvim-web-devicons'
  use 'sainnhe/gruvbox-material'
  use 'chrisbra/Colorizer'

  -- File tree
  use 'kyazdani42/nvim-tree.lua'

  -- Trouble
  use 'folke/trouble.nvim'

  -- Git
  use 'TimUntersberger/neogit'
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'

  -- Database
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'

  -- Utils
  use 'numToStr/Comment.nvim'
  use 'psliwka/vim-smoothie'
  use 'windwp/nvim-autopairs'
  use 'unblevable/quick-scope'
  use 'terryma/vim-expand-region'
  use 'norcalli/nvim-colorizer.lua'

  -- Status line
  use 'nvim-lualine/lualine.nvim'
  use 'wbthomason/lsp-status.nvim'
--   use 'arkav/lualine-lsp-progress'


  -- Test
  use 'vim-test/vim-test'
end)
