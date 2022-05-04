call plug#begin()
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/plenary.nvim'

  " Telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-symbols.nvim'
  Plug 'nvim-telescope/telescope-project.nvim'

  " Lsp
  Plug 'scalameta/nvim-metals'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'mfussenegger/nvim-dap'
  Plug 'onsails/lspkind-nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'p00f/clangd_extensions.nvim'

  " Style
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'sainnhe/gruvbox-material'
  Plug 'chrisbra/Colorizer'

  " File tree
  Plug 'kyazdani42/nvim-tree.lua'

  " Trouble
  Plug 'folke/trouble.nvim'

  " Git
  Plug 'TimUntersberger/neogit'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'sindrets/diffview.nvim'

  " Database
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-ui'
  Plug 'kristijanhusak/vim-dadbod-completion'

  " Utils
  Plug 'numToStr/Comment.nvim'
  Plug 'psliwka/vim-smoothie'
  Plug 'jiangmiao/auto-pairs'
  Plug 'unblevable/quick-scope'
  Plug 'terryma/vim-expand-region'

  " Status line
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'wbthomason/lsp-status.nvim'
"   Plug 'arkav/lualine-lsp-progress'


  " Test
  Plug 'vim-test/vim-test'
call plug#end()

