local devo_lsp = require("devo.lsp")
local nvim_lsp = require("lspconfig")
local nvim_lsp_util = require("lspconfig/util")
local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities
local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

--rust analyzer is managed through rust-tools.nvim
local rust_on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    buf_set_keymap(bufnr, "n", "<F5>", "<Cmd>Make build --all-features<CR>", opts)
    buf_set_keymap(bufnr, "n", "<F6>", "<Cmd>Make test --all-features<CR>", opts)
    buf_set_keymap(
        bufnr,
        "n",
        "<F7>",
        "<Cmd>Make clippy --all-features -- -D warnings -D clippy::missing_docs_in_private_items -D missing_docs<CR>",
        opts
    )
end

local rust_analyzer_opts = {
    capabilities = capabilities,
    on_attach = rust_on_attach,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true,
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
                features = "all",
                allTargets = true,
                autoreload = false,
            },
        },
    },
}

nvim_lsp.rust_analyzer.setup(rust_analyzer_opts)
