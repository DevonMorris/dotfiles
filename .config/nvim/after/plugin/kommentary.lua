require("kommentary.config").configure_language("default", {
	prefer_single_line_comments = true,
})
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_increase", {})
vim.api.nvim_set_keymap("n", "<leader>cu", "<Plug>kommentary_line_decrease", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>cc", "<Plug>kommentary_visual_increase", {})
vim.api.nvim_set_keymap("v", "<leader>cu", "<Plug>kommentary_visual_decrease", {})
