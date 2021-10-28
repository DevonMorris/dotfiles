local ok, neuron = pcall(require, 'neuron')
if not ok then
  return
end

neuron.setup{
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/zettelkasten", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "<leader>n",
}

opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap
set_keymap('n', '<leader>ns',
  [[<Cmd>lua require'neuron'.rib{address = "127.0.0.1:8200", verbose = true, open = false}<CR>]],
  opts)
set_keymap('n', '<leader>no',
  [[<cmd>lua require'neuron/telescope'.find_zettels()<CR>]],
  opts)
set_keymap('n', '<leader>np',
  [[<cmd>lua require'neuron/telescope'.find_zettels{ insert = true }<CR>]],
  opts)
set_keymap('i', '<c-o>',
  [[<cmd>lua require'neuron/telescope'.find_zettels{ insert = true }<CR>]],
  opts)
