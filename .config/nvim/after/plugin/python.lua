local nvim_lsp = require("lspconfig")
local devo_lsp = require("devo.lsp")
local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities

require("lspconfig").ruff.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
