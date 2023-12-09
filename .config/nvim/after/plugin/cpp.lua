local nvim_lsp = require("lspconfig")
local devo_lsp = require("devo.lsp")

local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities

--C++ config
nvim_lsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--limit-references=10",
		"--limit-results=10",
		"--offset-encoding=utf-8",
	},
	-- for older versions of clangd
	-- cmd = {"clangd", "--background-index", "--completion-style=detailed", "--limit-results=10"},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})
