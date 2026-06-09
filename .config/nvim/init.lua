--[[
Neovim init.lua
author: Devon Morris
contact: devonmorris1992@gmail.com
date: Wed May 14 09:47:48 AM EDT 2025
]]

-- Utility functions to use from cmd
require("devo.functions")

-- Autocmds
require("devo.autocmd")

-- Settings
require("devo.settings")

-- Mappings
require("devo.mappings")

-- Plugins
require("devo.plugins")

-- LSP (servers configured in lsp/<server>.lua; the lsp/ files require
-- devo.lsp, so it must finish loading before enable resolves them)
require("devo.lsp")
vim.lsp.enable({
    "clangd",
    "lua_ls",
    "rust_analyzer",
    "ruff",
    "ty",
    "typos_lsp",
})
