-- Vim Fugitive

-- Copies the SHA of HEAD to the + register
local function copy_commit() vim.fn.setreg("+", vim.fn.system("git rev-parse HEAD")) end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_var("fugitive_no_maps", 1)
vim.api.nvim_set_keymap("n", "<leader>gb", "<Cmd>Git blame<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-G>g", "<Cmd>diffget //2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-G>h", "<Cmd>diffget //3<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-G>l", "<Cmd>vertical Git log<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-G>s", "<Cmd>vertical G<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-G>c", "<Cmd>G commit<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-G>f", ":G commit --fixup=<C-R>c<BAR>lua copy_commit()<CR>",
    { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-G>+", "lua copy_commit()", opts)
