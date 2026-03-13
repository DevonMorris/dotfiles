local devo_lsp = require("devo.lsp")
local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities

local rust_on_attach = function(client, bufnr)
    on_attach(client, bufnr)
end

local rust_analyzer_opts = {
    capabilities = capabilities,
    on_attach = rust_on_attach,
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
                enable = false,
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

vim.lsp.enable('rust_analyzer')
vim.lsp.config('rust_analyzer',
    rust_analyzer_opts
)
