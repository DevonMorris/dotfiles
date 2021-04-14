require'gitsigns'.setup{
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]h'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [h'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    ['n <C-G>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <C-G>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <C-G>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <C-G>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <C-G>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <C-G>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
}
