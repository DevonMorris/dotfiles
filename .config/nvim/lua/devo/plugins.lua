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

return require("lazy").setup({
    -- Lsp
    "neovim/nvim-lspconfig",
    "nvim-lua/lsp-status.nvim",
    {
        "j-hui/fidget.nvim",
        tag = "legacy"
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",

    -- Zen Mode (writing and man pages)
    {
        "folke/zen-mode.nvim",
        dependencies = {
            "folke/twilight.nvim",
        }
    },

    -- Tables
    "godlygeek/tabular",

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },

    -- Autocomplete
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "onsails/lspkind-nvim",

    -- Copilot
    "zbirenbaum/copilot.lua",

    -- Async
    "tpope/vim-dispatch",

    -- Better Netrw
    "stevearc/oil.nvim",

    -- Language specific
    "lervag/vimtex",
    "rust-lang/rust.vim",

    -- Debugging
    "mfussenegger/nvim-dap",

    -- Typing/Editing
    "b3nj5m1n/kommentary",
    "tpope/vim-surround",
    "tpope/vim-repeat",

    -- Git
    "tpope/vim-fugitive",

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Theme
    "sainnhe/gruvbox-material",

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
    },

    -- Suda
    "lambdalisue/suda.vim",
})
