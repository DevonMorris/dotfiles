local nvim_lsp = require("lspconfig")
local devo_lsp = require("devo.lsp")

local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities

local clangd_on_attach = function(client, bufnr)
	on_attach(client, bufnr)
	buf_set_keymap(bufnr, "n", "H", "<Cmd><CR>", opts)
end

local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

--C config
nvim_lsp.clangd.setup({
	on_attach = clangd_on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--compile-commands-dir=./build/",
		"--completion-style=detailed",
		"--limit-references=10",
		"--limit-results=10",
	},
	-- for older versions of clangd
	-- cmd = {"clangd", "--background-index", "--completion-style=detailed", "--limit-results=10"},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})
