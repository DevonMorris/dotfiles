local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
    },
})
require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
})
