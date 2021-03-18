-- Install packer if not already installed
if not file_exists('~/.local/share/nvim/site/pack/packer') then
  os.execute(
    "git clone https://github.com/wbthomason/packer.nvim"
    .. " ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
  )
  vim.api.nvim_exec([[
  autocmd VimEnter * PackerInstall
  ]], false)
end

-- Any configuration that is pre-loading goes here
vim.g.kommentary_create_default_mappings = false

local use = require'packer'.use

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
