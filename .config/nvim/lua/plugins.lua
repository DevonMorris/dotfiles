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
  use 'nvim-lua/diagnostic-nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate'
  }

  -- Autocomplete
  use 'nvim-lua/completion-nvim'

  -- Async
  use 'tpope/vim-dispatch'

  -- Language specific
  use 'lervag/vimtex'
  use {
    'Olical/conjure',
    ft = 'clojure',
    tag = 'v4.15.0'
  }

  -- Typing/Editing
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use {
    'guns/vim-sexp',
    ft = {'clojure', 'scheme'},
    requires = 'tpope/vim-sexp-mappings-for-regular-people'
  }
  use 'yamatsum/nvim-cursorline'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'},
                {'nvim-telescope/telescope-fzy-native.nvim'}}
  }

  -- Theme
  use 'sainnhe/gruvbox-material'

  -- Statusline
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- Suda
  use 'lambdalisue/suda.vim'

  -- Docker
  use 'kkvh/vim-docker-tools'

  -- Notes
  use {'oberblastmeister/neuron.nvim',
      branch = 'unstable',
      requires = {{'nvim-lua/popup.nvim'},
                  {'nvim-lua/plenary.nvim'},
                  {'nvim-telescope/telescope.nvim'}
      }
  }
end)
