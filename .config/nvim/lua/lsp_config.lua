local nvim_lsp = require'nvim_lsp'

on_attach = function(_, buffnr)
  require'completion'.on_attach()
  require'diagnostic'.on_attach()

  -- Mappings.
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-n>', '<cmd>NextDiagnosticCycle<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-p>', '<cmd>PrevDiagnosticCycle<CR>', opts)
end

--Python Config
nvim_lsp.pyls.setup{
  on_attach=on_attach;
  settings = {
    pyls = {
      plugins = {
        pycodestyle = {
          enabled = false;
        };
        pyls_mypy = {
          enabled = false;
        };
      }
    }
  }
}

--C++ config
nvim_lsp.clangd.setup{on_attach=on_attach}

--VimLang config
nvim_lsp.vimls.setup{on_attach=on_attach}

--Lua config
require'nvim_lsp'.sumneko_lua.setup{on_attach=on_attach}

--Javascript/Typescript
require'nvim_lsp'.tsserver.setup{on_attach=on_attach}

--Html
require'nvim_lsp'.html.setup{on_attach=on_attach}
