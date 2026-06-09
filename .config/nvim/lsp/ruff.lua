local devo_lsp = require("devo.lsp")

return {
    on_attach = devo_lsp.on_attach,
    capabilities = devo_lsp.capabilities,
}
