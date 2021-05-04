-- Vim Fugitive
vim.api.nvim_set_var("fugitive_no_maps", 1)
vim.api.nvim_set_keymap('n', '<leader>gb', '<Cmd>Git blame<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-G>f', '<Cmd>Git fetch<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-G>p', '<Cmd>Git push<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-G>c', '<Cmd>Git commit<CR>', opts)
