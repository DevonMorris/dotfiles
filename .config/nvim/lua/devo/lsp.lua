M = {}
-- LSP loading status
require("fidget").setup({})

vim.diagnostic.config({
    signs = false,
    underline = false,
    update_in_insert = false,
    virtual_text = false,
})

local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

M.on_attach = function(_, bufnr)
    buf_set_keymap(bufnr, "n", "<c-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap(bufnr, "n", "gt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>l", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap(bufnr, "n", "]e",
        "<Cmd>lua vim.diagnostic.goto_next({float=false, severity = vim.diagnostic.severity.ERROR})<CR>", opts)
    buf_set_keymap(bufnr, "n", "[e",
        "<Cmd>lua vim.diagnostic.goto_prev({float=false, severity = vim.diagnostic.severity.ERROR})<CR>", opts)
    buf_set_keymap(bufnr, "n", "]d", "<Cmd>lua vim.diagnostic.goto_next({float=false})<CR>", opts)
    buf_set_keymap(bufnr, "n", "[d", "<Cmd>lua vim.diagnostic.goto_prev({float=false})<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>ci", "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>co", "<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>a", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    buf_set_keymap(bufnr, "v", "<leader>f", "<Cmd>lua vim.lsp.formatexpr()<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return M
