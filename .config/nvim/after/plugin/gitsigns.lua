require("gitsigns").setup({
    numhl = false,
    signcolumn = true,

    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation
        map("n", "]g", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "[g", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<C-G>a", gs.stage_hunk)
        map("n", "<C-G>r", gs.reset_hunk)
        map("v", "<C-G>a", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "<C-G>r", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "<C-G>A", gs.stage_buffer)
        map("n", "<C-G>u", gs.undo_stage_hunk)
        map("n", "<C-G>R", gs.reset_buffer)
        map("n", "<C-G>p", gs.preview_hunk)
    end,
})
