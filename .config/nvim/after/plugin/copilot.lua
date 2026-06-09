require("copilot").setup({
    suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = true,
        debounce = 15,
        trigger_on_accept = true,  -- new in recent copilot.lua; restores the old next behavior
        keymap = {
            accept = "<C-l><C-y>",
            next   = "<C-l><C-n>",
            prev   = "<C-l><C-p>",
            dismiss = "<C-]>",
        },
    },
})

vim.keymap.set("n", "<C-l><C-e>", "<cmd>Copilot enable<CR>",  { noremap = true })
vim.keymap.set("n", "<C-l><C-d>", "<cmd>Copilot disable<CR>", { noremap = true })
vim.keymap.set("n", "<C-l><C-o>", "<cmd>Copilot panel<CR>",   { noremap = true, silent = true })
