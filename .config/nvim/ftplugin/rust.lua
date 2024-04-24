local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

vim.o.colorcolumn = "101"
vim.b.makeprg = "cargo build"
buf_set_keymap(0, "n", "<leader>y", [[<Cmd>Make check<CR>]], opts)
buf_set_keymap(0, "n", "<leader>t", [[<Cmd>Make test<CR>]], opts)
