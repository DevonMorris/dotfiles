M = {}
-- LSP loading status
require'fidget'.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
  }
)

local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap=true, silent=true }

M.on_attach = function(client, bufnr)
  buf_set_keymap(bufnr, 'n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>l', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap(bufnr, 'n', ']e', '<Cmd>lua vim.diagnostic.goto_next({float=false})<CR>', opts)
  buf_set_keymap(bufnr, 'n', '[e', '<Cmd>lua vim.diagnostic.goto_prev({float=false})<CR>', opts)
  buf_set_keymap(bufnr, 'n', ']d', '<Cmd>lua vim.diagnostic.goto_next({float=false})<CR>', opts)
  buf_set_keymap(bufnr, 'n', '[d', '<Cmd>lua vim.diagnostic.goto_prev({float=false})<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>ci', '<Cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>co', '<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>a', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  vim.api.nvim_exec([[
    augroup lsp
      autocmd! * <buffer>
      autocmd! BufEnter,BufWritePost <buffer> :lua vim.diagnostic.setloclist{open=false}
    augroup END
  ]], false)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


return M
