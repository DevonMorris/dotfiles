require("copilot").setup({
    suggestion = {
        enabled = true,
        auto_trigger = false,
        keymap = {
            accept = "<C-l><C-y>",
            next = "<C-l><C-n>",
            prev = "<C-l><C-p>",
        },
    },
})

vim.api.nvim_set_keymap("n", "<C-l><C-e>", ":Copilot enable<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-l><C-d>", ":Copilot disable<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-l><C-o>", "<cmd>Copilot panel<CR>", { noremap = true, silent = true })
