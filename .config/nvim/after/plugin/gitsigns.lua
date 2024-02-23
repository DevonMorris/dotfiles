local gs = require("gitsigns")

local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
local next_hunk = function()
    if vim.wo.diff then
        vim.cmd('norm ]c')
    else
        gs.next_hunk()
    end
end
local prev_hunk = function()
    if vim.wo.diff then
        vim.cmd('norm [c')
    else
        gs.prev_hunk()
    end
end
local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(next_hunk, prev_hunk)

gs.setup({
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
        map({ "n", "x", "o" }, "]g", next_hunk_repeat)
        map({ "n", "x", "o" }, "[g", prev_hunk_repeat)

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
        map({ 'o', 'x' }, 'ig', ':<C-U>Gitsigns select_hunk<CR>')
    end,
})
