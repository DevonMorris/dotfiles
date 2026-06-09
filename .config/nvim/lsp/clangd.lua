local devo_lsp = require("devo.lsp")

local clangd_on_attach = function(client, bufnr)
    devo_lsp.on_attach(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "H", "<Cmd><CR>", { noremap = true, silent = true })
end

return {
    on_attach = clangd_on_attach,
    capabilities = devo_lsp.capabilities,
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--compile-commands-dir=./build/",
        "--completion-style=detailed",
        "--limit-references=10",
        "--limit-results=10",
    },
    -- for older versions of clangd
    -- cmd = {"clangd", "--background-index", "--completion-style=detailed", "--limit-results=10"},
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}
