local nvim_lsp = require'lspconfig'
local nvim_lsp_util = require'lspconfig/util'

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

local on_attach = function(client, bufnr)
  buf_set_keymap(bufnr, 'n', '<c-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
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
  -- Deprecated need to figre our how to replace this
  -- buf_set_keymap(bufnr, "v", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

  vim.api.nvim_exec([[
    augroup lsp
      autocmd! * <buffer>
      autocmd! BufEnter,BufWritePost <buffer> :lua vim.diagnostic.setloclist{open=false}
    augroup END
  ]], false)
end

local clangd_on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  buf_set_keymap(bufnr, 'n', 'H', "<Cmd><CR>", opts)
end

--Python Config
--[[ nvim_lsp.pyls.setup{
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
} ]]
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require'lspconfig'.jedi_language_server.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}


--C++ config
nvim_lsp.clangd.setup{on_attach=clangd_on_attach,
  capabilities = capabilities,
  cmd = {"clangd", "--background-index", "--clang-tidy", "--compile-commands-dir=./build/", "--completion-style=detailed", "--limit-references=10", "--limit-results=10"},
  -- for older versions of clangd
  -- cmd = {"clangd", "--background-index", "--completion-style=detailed", "--limit-results=10"},
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

-- nvim_lsp.sumneko_lua.setup {
--   on_attach=on_attach,
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = vim.split(package.path, ';'),
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = {
--           [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--           [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--         },
--       },
--     },
--   },
-- }

--Javascript/Typescript
nvim_lsp.tsserver.setup{on_attach=on_attach}

--Html
nvim_lsp.html.setup{on_attach=on_attach}

--Rust
--rust analyzer is managed through rust-tools.nvim
local rust_on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  buf_set_keymap(bufnr, 'n', '<leader>x', '<Cmd>RustRunnables<CR>', opts)
  buf_set_keymap(bufnr, 'n', '<leader>m', '<Cmd>RustExpandMacro<CR>', opts)
  buf_set_keymap(bufnr, 'n', 'K', '<Cmd>RustHoverActions<CR>', opts)
end

local rust_analyzer_opts = {
  capabilities=capabilities,
  on_attach=rust_on_attach,
  settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
      -- enable clippy on save
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
require('rust-tools').setup({
    -- rust-tools options
    tools = {
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler
        hover_with_actions = false,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {

            -- wheter to show parameter hints with the inlay hints or not
            show_parameter_hints = true,

            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- other_hints_prefix = "=> ",
            other_hints_prefix = ">>> ",
        },
    },
    --
    -- rust-analyer options
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = rust_analyzer_opts,
})

--Haskell
nvim_lsp.hls.setup{
  on_attach = on_attach,
  filetypes = { "haskell", "lhaskell" },
  root_dir = nvim_lsp_util.root_pattern("*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git")
}

--Clojure
nvim_lsp.clojure_lsp.setup{
  on_attach = on_attach,
  filtypes = { "clojure", "edn" },
}

--Go
require'lspconfig'.gopls.setup{
  capabilities = capabilities,
  on_attach=on_attach
}
