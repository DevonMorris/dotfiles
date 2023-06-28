local ls = require("luasnip")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

vim.cmd([[
  imap <silent><expr> <c-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
  inoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(-1)<CR>
]])

vim.cmd([[
  nnoremap <silent> <leader><leader>s <cmd>source ~/.config/nvim/after/plugin/snippets.lua<CR>
]])

local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.snippets = {
	cpp = {
		ls.parser.parse_snippet("lmb", "[$1]($2)\n{\n\t$0\n}"),
		ls.parser.parse_snippet("func", "$1 $2($3)\n{\n\t$0\n}"),
		ls.parser.parse_snippet("mfunc", "$1 $2::$3($4)\n{\n\t$0\n}"),
		ls.parser.parse_snippet("ns", "namespace $1\n{\n\t$0\n}"),
		ls.parser.parse_snippet("alias", "using $1 = $0;"),
		s("cls", fmt("class {} \n\n\t{}();\n\t~{}();\n", { i(1, "Class"), rep(1), rep(1) })),
	},
}
