require'gitsigns'.setup{
  numhl = true,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]g'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [g'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    ['n <C-G>a'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <C-G>A'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <C-G>u'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <C-G>r'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <C-G>R'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <C-G>B'] = '<cmd>Gitsigns toggle_current_line_blame<CR>',

    -- Text objects
    ['o ig'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ig'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    },
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 50,
  },
}
