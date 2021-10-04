local cmp = require'cmp'
cmp.setup{
  sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = "neorg" }
  }
}
vim.api.nvim_set_var('completion_matching_strategy_list', {'exact', 'substring', 'fuzzy'})
vim.api.nvim_set_var('completion_matching_ignore_case', 1)
vim.api.nvim_set_var('completion_enable_auto_hover', 1)
