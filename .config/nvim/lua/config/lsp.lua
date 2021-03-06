local nvim_lsp = require'lspconfig'
local nvim_lsp_util = require'lspconfig/util'

local completion = require'completion'
local lsp_status = require'lsp-status'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
  }
)

local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
  completion.on_attach{}
  buf_set_keymap(bufnr, 'n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<c-k>', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>ci', '<Cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>co', '<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)

  if client.resolved_capabilities.document_formatting then
    buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  vim.api.nvim_exec([[
    augroup lsp
      autocmd! * <buffer>
      autocmd! BufEnter,BufWritePost,InsertLeave <buffer> :lua vim.lsp.diagnostic.set_loclist{open_loclist=false}
    augroup END
  ]], false)
end

local clangd_on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  buf_set_keymap(bufnr, 'n', 'H', "<Cmd>lua require'lspconfig'.clangd.switch_source_header(0)<CR>", opts)
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
  };
}

--C++ config
nvim_lsp.clangd.setup{on_attach=clangd_on_attach,
  cmd = {"clangd", "--background-index", "--clang-tidy"},
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}

--CMake config
--require'nvim_lsp'.cmake.setup{}

--VimLang config
--nvim_lsp.vimls.setup{on_attach=on_attach}

--Lua config
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/nvim_lsp/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

nvim_lsp.sumneko_lua.setup {
  on_attach=on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

--Javascript/Typescript
nvim_lsp.tsserver.setup{on_attach=on_attach}

--Html
nvim_lsp.html.setup{on_attach=on_attach}

--Rust
nvim_lsp.rust_analyzer.setup{on_attach=on_attach}

--Haskell
nvim_lsp.hls.setup{
  on_attach=on_attach,
  filetypes = { "haskell", "lhaskell" },
  root_dir = nvim_lsp_util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git")
}

--Clojure
nvim_lsp.clojure_lsp.setup{
  on_attach=on_attach,
  filtypes = { "clojure", "edn" },
}
