local devo_lsp = require'devo.lsp'
local nvim_lsp = require'lspconfig'
local nvim_lsp_util = require'lspconfig/util'
local on_attach = devo_lsp.on_attach
local capabilities = devo_lsp.capabilities
local buf_set_keymap = vim.api.nvim_buf_set_keymap
local opts = { noremap=true, silent=true }

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
