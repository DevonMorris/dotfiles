opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap

-- Source vimrc
set_keymap('n', '<leader>sv', '<Cmd>source $MYVIMRC<CR>', opts)

-- Docker tools
set_keymap('n', '<leader>w', '<Cmd>DockerToolsToggle<CR>', opts)

-- Jumps
set_keymap('n', '<C-G>', '<Cmd>ta<CR>', opts)
set_keymap('n', '<C-G>', '<C-^>', opts)

-- Quickfix
set_keymap('n', '<C-N>', '<Cmd>cn<CR>', opts)
set_keymap('n', '<C-P>', '<Cmd>cp<CR>', opts)
set_keymap('n', '<C-C>', '<Cmd>ccl<CR>', opts)

-- LocList
set_keymap('n', '<C-J>', '<Cmd>lnext<CR>', opts)
set_keymap('n', '<C-K>', '<Cmd>lprev<CR>', opts)

-- Vim Fugitive
set_keymap('n', '<leader>gb', '<Cmd>Gblame<CR>', opts)
