local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- Alternate File
set_keymap("n", "<C-H>", "<C-^>", opts)

-- Quickfix
set_keymap("n", "<C-N>", "<Cmd>cn<CR>", opts)
set_keymap("n", "<C-P>", "<Cmd>cp<CR>", opts)
set_keymap("n", "<C-C>", "<Cmd>ccl<Bar>lcl<CR>", opts)

-- Clear Search
set_keymap("n", "<C-L>", "<Cmd>nohlsearch<CR>", opts)

-- Y act like D and C
set_keymap("n", "Y", "y$", opts)

-- Undo break points
set_keymap("i", ",", ",<c-g>u", opts)
set_keymap("i", ".", ".<c-g>u", opts)
set_keymap("i", ":", ":<c-g>u", opts)

-- Dispatch
set_keymap("n", "<F1>", ":FocusDispatch ", { noremap = true })
set_keymap("n", "<F4>", "<Cmd>Dispatch<CR>", opts)
