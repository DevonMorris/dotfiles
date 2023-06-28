local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  -- Lsp
  'neovim/nvim-lspconfig',
  'nvim-lua/lsp-status.nvim',
  { 'j-hui/fidget.nvim', tag = "legacy" },

  -- Treesitter
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/playground',

  -- Autocomplete
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/nvim-cmp',
  'onsails/lspkind-nvim',

  -- Copilot
  'zbirenbaum/copilot.lua',

  -- Snippets
  'L3MON4D3/LuaSnip',

  -- Async
  'tpope/vim-dispatch',

  -- Better Netrw
  'tpope/vim-vinegar',

  -- Language specific
  'lervag/vimtex',
  'simrat39/rust-tools.nvim',

  -- Debugging
  'mfussenegger/nvim-dap',

  -- Typing/Editing
  'b3nj5m1n/kommentary',
  'tpope/vim-surround',
  'tpope/vim-repeat',

	-- Git
  'tpope/vim-fugitive',
  { 'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim'
    }
  },
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {'nvim-telescope/telescope-ui-select.nvim' },

  -- Theme
  'sainnhe/gruvbox-material',

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    }
  },

  -- Peek
  'nacro90/numb.nvim',

  -- Suda
  'lambdalisue/suda.vim',
})
