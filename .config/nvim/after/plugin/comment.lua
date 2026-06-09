-- Built-in commenting (gc); these preserve the old kommentary <leader>c maps.
-- The built-in operator toggles, so increase/decrease both map to toggle.
vim.keymap.set("n", "<leader>cc", "gcc", { remap = true })
vim.keymap.set("n", "<leader>cu", "gcc", { remap = true })
vim.keymap.set("n", "<leader>c", "gc", { remap = true })
vim.keymap.set("v", "<leader>cc", "gc", { remap = true })
vim.keymap.set("v", "<leader>cu", "gc", { remap = true })
