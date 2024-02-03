require("copilot").setup({
    panel = {
        enabled = false,
    },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
            accept = "<C-a>",
        },
    },
})
vim.cmd("Copilot disable")
