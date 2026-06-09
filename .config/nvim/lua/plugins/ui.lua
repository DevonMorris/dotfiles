local function configure_colorscheme()
    vim.g.gruvbox_material_palette = "original"
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_transparent_background = 1
    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox-material")
end

local function configure_statusline()
    require("lualine").setup({
        options = {
            theme = "gruvbox",
            section_separators = { nil, nil },
            component_separators = { nil, nil },
            icons_enabled = false,
            globalstatus = true,
        },
        sections = {
            lualine_a = { { "mode", upper = true } },
            lualine_b = { { "branch", icon = "branch:" } },
            lualine_c = { { "filename", file_status = true, path = 1 } },
            lualine_x = { { "diagnostics", sources = { "nvim_diagnostic" } }, "encoding", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
    })
end

return {
    -- Theme
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = configure_colorscheme,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        config = configure_statusline,
    },

    -- Zen Mode (writing and man pages)
    {
        "folke/zen-mode.nvim",
        dependencies = {
            "folke/twilight.nvim",
        },
    },
}
