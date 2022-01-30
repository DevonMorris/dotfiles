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

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Gps
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter"
  }

  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Async
  use 'tpope/vim-dispatch'

  -- Language specific
  use 'lervag/vimtex'
  use {
    'Olical/conjure',
    ft = 'clojure',
    tag = 'v4.15.0'
  }
  use {
    'itchyny/vim-haskell-indent',
    ft = 'haskell'
  }
  use {
    'mfussenegger/nvim-jdtls',
    config = function()
      require("plugin.jdtls.config").attach()
    end,
    module = "jdtls"
  }

  -- Typing/Editing
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use {
    'guns/vim-sexp',
    ft = {'clojure', 'scheme'},
    requires = 'tpope/vim-sexp-mappings-for-regular-people'
  }

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

  -- Theme
  use 'sainnhe/gruvbox-material'
  use 'rose-pine/neovim'
  use 'savq/melange'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Peek
  use 'nacro90/numb.nvim'

  -- Suda
  use 'lambdalisue/suda.vim'

  -- Notes
  use {'oberblastmeister/neuron.nvim',
      branch = 'unstable',
      opt = true,
      requires = {{'nvim-lua/popup.nvim'},
                  {'nvim-lua/plenary.nvim'},
                  {'nvim-telescope/telescope.nvim'},
      }
  }

  use {
    'nvim-neorg/neorg',
    requires = {{'nvim-lua/plenary.nvim'},
                {"vhyrro/neorg-telescope"}
    }
  }
end)
