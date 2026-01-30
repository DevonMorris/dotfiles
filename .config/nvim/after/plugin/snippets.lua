-- local ls = require("luasnip")

-- ls.config.set_config({
--     history = true,
--     updateevents = "TextChanged,TextChangedI",
--     enable_autosnippets = true,
-- })

-- vim.cmd([[
--   imap <silent><expr> <c-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
--   inoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
--   snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(1)<CR>
--   snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
-- ]])

-- local s = ls.s
-- local fmt = require("luasnip.extras.fmt").fmt
-- local i = ls.insert_node
-- local rep = require("luasnip.extras").rep
