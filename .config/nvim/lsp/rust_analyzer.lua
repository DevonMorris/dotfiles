local devo_lsp = require("devo.lsp")

return {
    on_attach = devo_lsp.on_attach,
    capabilities = devo_lsp.capabilities,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            },
            lruCapacity = 44,
            check = {
                command = "clippy",
                features = {},
                extraArgs = {
                    "--",
                    "-D",
                    "warnings",
                    "-D",
                    "clippy::missing_docs_in_private_items",
                    "-D",
                    "missing_docs",
                },
            },
            cargo = {
                buildScripts = {
                    enable = false,
                },
                features = {},
                allTargets = true,
                autoreload = true,
            },
            completion = {
                postfix = {
                    enable = false,
                },
                hideDeprecated = true,
            },
            procMacro = {
                enable = true,
            },
            checkOnSave = false,
            cachePriming = {
                enable = false,
            },
            lens = {
                enable = false,
            },
        },
    },
}
