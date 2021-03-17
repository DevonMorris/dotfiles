return require('packer').startup(function()
  -- Let packer manages packer
  use 'wbthomason/packer.nvim'

  -- Lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'nvim-lua/diagnostic-nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    use = 'vim.cmd[[TSUpdate]]'
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
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-fugitive'
  use {
    'guns/vim-sexp',
    ft = {'clojure', 'scheme'},
    requires = 'tpope/vim-sexp-mappings-for-regular-people'
  }

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
  use 'itchyny/lightline.vim'

  -- Suda
  use 'lambdalisue/suda.vim'

  -- Docker
  use 'kkvh/vim-docker-tools'
end)
