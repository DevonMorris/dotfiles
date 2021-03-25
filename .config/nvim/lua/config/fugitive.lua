-- Vim Fugitive
vim.api.nvim_set_var("fugitive_no_maps", 1)
vim.api.nvim_set_keymap('n', '<leader>gb', '<Cmd>Git blame<CR>', opts)
