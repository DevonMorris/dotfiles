--[[
Neovim init.lua
author: Devon Morris
contact: devonmorris1992@gmail.com
date: Wed Mar 17 21:40:09 EDT 2021
Note: everything in this file should be neovim or plugin specific
for everything regarding plain vim config check out ~/.vimrc
]]

-- Source vimrc for neovim/plugin agnostic config
vim.cmd'source ~/.vimrc'

-- Plugins
require'devo.plugins'

-- Utility functions to use from cmd
require'devo.functions'

-- Autocmds
require'devo.autocmd'

-- Mappings
require'devo.mappings'

-- Settings
require'devo.settings'
