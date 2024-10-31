require("oil").setup({
  default_file_explorer = true,
  columns = {
  },
  skip_confirm_for_simple_edits = false,
  keymaps = {
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-h>"] = false,
  },
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true } )
