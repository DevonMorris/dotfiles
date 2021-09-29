opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<leader>ex', ':NvimTreeToggle<CR>', opts)

vim.g.nvim_tree_quit_on_open = 1
require'nvim-tree'.setup{
  auto_close = true,
  auto_open = false,
  view = {
    width = 40
  }
}
