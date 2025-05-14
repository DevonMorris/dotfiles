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
            check = {
                command = "clippy",
                features = "all",
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
                    enable = true,
                    rebuildOnSave = false,
                },
                features = "all",
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
                enable = true,
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
