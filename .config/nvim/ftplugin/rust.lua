local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

vim.o.colorcolumn = "101"
vim.b.makeprg = "cargo build"
cargo_check_cmd = "check --profile release --verbose --all-features"
cargo_test_cmd = "test --profile release --verbose --all-features"
cargo_doc_cmd = "doc --profile release --verbose --all-features"
cargo_clippy = "clippy --profile release --verbose --no-deps --all-features"

buf_set_keymap(0, "n", "<F5>", "<Cmd>Make " .. cargo_check_cmd .. "<CR>", opts)
buf_set_keymap(0, "n", "<F6>", "<Cmd>Make " .. cargo_test_cmd .. "<CR>", opts)
buf_set_keymap(0, "n", "<F7>", "<Cmd>Make " .. cargo_clippy .. "<CR>", opts)
buf_set_keymap(0, "n", "<F8>", "<Cmd>Make " .. cargo_doc_cmd .. "<CR>", opts)
