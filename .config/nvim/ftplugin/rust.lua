local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

vim.o.colorcolumn = "101"
vim.b.makeprg = "cargo build"
local cargo_check_cmd = "check --profile release-with-debug --verbose --all-features --all-targets --workspace"
local cargo_test_cmd = "test --profile release-with-debug --verbose --all-features --all-targets --workspace"
local cargo_doc_cmd = "doc --profile release-with-debug --verbose --all-features --document-private-items"
local cargo_clippy =
"clippy --profile release-with-debug --verbose --no-deps --all-features --all-targets --no-deps --workspace"

buf_set_keymap(0, "n", "<F5>", "<Cmd>Make " .. cargo_check_cmd .. "<CR>", opts)
buf_set_keymap(0, "n", "<F6>", "<Cmd>Make " .. cargo_test_cmd .. "<CR>", opts)
buf_set_keymap(0, "n", "<F7>", "<Cmd>Make " .. cargo_clippy .. "<CR>", opts)
buf_set_keymap(0, "n", "<F8>", "<Cmd>Make " .. cargo_doc_cmd .. "<CR>", opts)
