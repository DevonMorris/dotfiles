local devo_lsp = require("devo.lsp")
local nvim_lsp = require("lspconfig")
local nvim_lsp_util = require("lspconfig/util")
local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities
local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

local cmake_opts = {
    capabilities = capabilities,
    on_attach = rust_on_attach,
}

nvim_lsp.cmake.setup(cmake_opts)
