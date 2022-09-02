local opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap

-- Alternate File
set_keymap('n', '<C-H>', '<C-^>', opts)

-- Quickfix
set_keymap('n', '<C-N>', '<Cmd>cn<CR>zz', opts)
set_keymap('n', '<C-P>', '<Cmd>cp<CR>zz', opts)
set_keymap('n', '<C-D>', '<C-D>zz', opts)
set_keymap('n', '<C-U>', '<C-U>zz', opts)
set_keymap('n', '}', '}zz', opts)
set_keymap('n', '{', '{zz', opts)
set_keymap('n', '<C-C>', '<Cmd>ccl<Bar>lcl<CR>', opts)

-- Clear Search
set_keymap('n', '<C-L>', '<Cmd>nohlsearch<CR>', opts)

-- Y act like D and C
set_keymap('n', 'Y', 'y$', opts)

-- Keep things centered
set_keymap('n', 'n', 'nzz', opts)
set_keymap('n', 'N', 'Nzz', opts)
set_keymap('n', 'J', "mzJ`z", opts)

-- Undo break points
set_keymap('i', ',', ",<c-g>u", opts)
set_keymap('i', '.', ".<c-g>u", opts)
set_keymap('i', ':', ":<c-g>u", opts)

-- Netrw
set_keymap('n', '<leader>ex', '<Cmd>execute \'Explore\' getcwd()<CR>', opts)
set_keymap('n', '<leader>cex', '<Cmd>Ex<CR>', opts)
