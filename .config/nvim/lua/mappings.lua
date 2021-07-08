opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap

-- Alternate File
set_keymap('n', '<C-H>', '<C-^>', opts)

-- Quickfix
set_keymap('n', '<C-N>', '<Cmd>cn<CR>zz', opts)
set_keymap('n', '<C-P>', '<Cmd>cp<CR>zz', opts)
set_keymap('n', '<C-C>', '<Cmd>ccl<Bar>lcl<CR>', opts)

-- LocList
--[[ set_keymap('n', '<C-J>', '<Cmd>lnext<CR>zz', opts)
set_keymap('n', '<C-K>', '<Cmd>lprev<CR>zz', opts) ]]

-- Execute some lua
set_keymap('n', '<leader>l', ':lua ', { noremap = true, silent = false})
