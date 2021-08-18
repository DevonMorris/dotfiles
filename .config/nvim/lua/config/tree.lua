opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<leader>ex', ':NvimTreeToggle<CR>', opts)

vim.g.nvim_tree_width = 40
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
