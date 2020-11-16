local nvim_lsp = require'nvim_lsp'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
  }
)

on_attach = function(_, buffnr)
  require'completion'.on_attach{}
  -- Mappings.
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-k>', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gn', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gp', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
nvim_lsp.clangd.setup{on_attach=on_attach;
  cmd = {"clangd", "--background-index", "--clang-tidy"}
}

--CMake config
--require'nvim_lsp'.cmake.setup{}

--VimLang config
nvim_lsp.vimls.setup{on_attach=on_attach}

--Lua config
require'nvim_lsp'.sumneko_lua.setup{on_attach=on_attach}

--Javascript/Typescript
require'nvim_lsp'.tsserver.setup{on_attach=on_attach}

--Html
require'nvim_lsp'.html.setup{on_attach=on_attach}
