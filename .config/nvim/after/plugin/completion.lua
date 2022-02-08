local lspkind = require'lspkind'

local cmp = require'cmp'
cmp.setup{
  sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' , keyword_length = 5},
        { name = "neorg" }
  },
  formatting = {
    format = lspkind.cmp_format{
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        path = "[path]",
        luasnip = "[snip]",
      },
    }
  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  preselect = cmp.PreselectMode.None
}
