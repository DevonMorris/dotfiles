-- Install packer if not already installed
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

-- Any configuration that is pre-loading goes here
vim.g.kommentary_create_default_mappings = false

return require('packer').startup(function(use)
  -- Let packer manages packer
  use 'wbthomason/packer.nvim'

  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use { 'j-hui/fidget.nvim', tag = "legacy" }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'

  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'

  -- Copilot
  use "zbirenbaum/copilot.lua"

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Async
  use 'tpope/vim-dispatch'

  -- Better Netrw
  use 'tpope/vim-vinegar'

  -- Language specific
  use 'lervag/vimtex'
  use 'simrat39/rust-tools.nvim'

  -- Debugging
  use 'mfussenegger/nvim-dap'

  -- Typing/Editing
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'

	-- Git
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'}}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'nvim-telescope/telescope-ui-select.nvim' }

  -- Theme
  use 'sainnhe/gruvbox-material'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Peek
  use 'nacro90/numb.nvim'

  -- Suda
  use 'lambdalisue/suda.vim'
end)
