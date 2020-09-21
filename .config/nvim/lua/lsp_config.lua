local nvim_lsp = require'nvim_lsp'

--Python Config
nvim_lsp.pyls.setup{
  on_attach=require'on_attach'.on_attach;
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
nvim_lsp.clangd.setup{on_attach=require'on_attach'.on_attach}

--VimLang config
nvim_lsp.vimls.setup{on_attach=require'on_attach'.on_attach}
