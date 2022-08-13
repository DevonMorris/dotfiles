local vim = vim
local opt = vim.opt

opt.foldcolumn = '1'
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 0
opt.foldnestmax = 5
