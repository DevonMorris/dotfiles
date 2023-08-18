local nvim_lsp = require("lspconfig")
local devo_lsp = require("devo.lsp")

local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities

--Ocaml config
nvim_lsp.ocamllsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
