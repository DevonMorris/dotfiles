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

-- Utility functions to use from cmd
require'functions'

-- Autocmds
require'autocmd'

-- Mappings
require'mappings'

-- Settings
require'settings'

-- Plugins
require'plugins'

-- Package configuration and package specific mappings
require'config'
