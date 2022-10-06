-- Vim Fugitive
local opts = { noremap=true, silent=true }
vim.api.nvim_set_var("fugitive_no_maps", 1)
vim.api.nvim_set_keymap('n', '<leader>gb', '<Cmd>Git blame<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-G>h', '<Cmd>diffget //2<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-G>l', '<Cmd>diffget //3<CR>', opts)
