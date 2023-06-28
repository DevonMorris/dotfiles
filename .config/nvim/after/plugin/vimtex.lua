vim.api.nvim_exec(
	[[
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
]],
	false
)
vim.api.nvim_set_var("vimtex_view_method", "zathura")
vim.api.nvim_set_var("tex_flavor", "latex")
