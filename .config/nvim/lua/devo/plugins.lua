local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    -- Lsp
    "neovim/nvim-lspconfig",
    "nvim-lua/lsp-status.nvim",
    "j-hui/fidget.nvim",

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate"
    },

    -- Zen Mode (writing and man pages)
    {
        "folke/zen-mode.nvim",
        dependencies = {
            "folke/twilight.nvim",
        }
    },

    -- Lean
    {
      'Julian/lean.nvim',
      event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      opts = {
        mappings = true,
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
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
            "zbirenbaum/copilot.lua",        -- for providers='copilot'
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "Avante" },
                },
                ft = { "Avante" },
            },
        },
    },

    -- Async Jobs
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
        tag = '0.1.8',
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
