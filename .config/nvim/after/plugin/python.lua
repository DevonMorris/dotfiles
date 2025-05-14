local devo_lsp = require("devo.lsp")
local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities

vim.lsp.enable({ 'ruff', 'ty' })
vim.lsp.config('ruff', {
    capabilities = capabilities,
    on_attach = on_attach,
})
vim.lsp.config('ty', {
    capabilities = capabilities,
    on_attach = on_attach,
})
