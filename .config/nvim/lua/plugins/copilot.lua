local function configure_copilot()
    require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_trigger = false,
            hide_during_completion = true,
            debounce = 15,
            trigger_on_accept = true, -- new in recent copilot.lua; restores the old next behavior
            keymap = {
                accept = "<C-l><C-y>",
                next = "<C-l><C-n>",
                prev = "<C-l><C-p>",
                dismiss = "<C-]>",
            },
        },
    })

    vim.keymap.set("n", "<C-l><C-e>", "<cmd>Copilot enable<CR>", { noremap = true })
    vim.keymap.set("n", "<C-l><C-d>", "<cmd>Copilot disable<CR>", { noremap = true })
    vim.keymap.set("n", "<C-l><C-o>", "<cmd>Copilot panel<CR>", { noremap = true, silent = true })
end

return {
    {
        "zbirenbaum/copilot.lua",
        config = configure_copilot,
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
            "zbirenbaum/copilot.lua",        -- for providers='copilot'
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "Avante" },
                },
                ft = { "Avante" },
            },
        },
    },
}
