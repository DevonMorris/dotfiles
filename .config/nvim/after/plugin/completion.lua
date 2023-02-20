local lspkind = require'lspkind'
local ls = require 'luasnip'

local cmp = require'cmp'
local types = require'cmp.types'
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
  mapping = {
    ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
    ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  preselect = cmp.PreselectMode.None
}
