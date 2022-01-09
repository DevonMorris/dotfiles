-- This is really funky, but some autocommands only works if filetype plugin on
-- is called before. Although this is set by default in neovim I believe it is
-- called later. TODO: If I put this in a /after directory will everything be
-- happier?
vim.cmd([[filetype plugin on]])

-- Yank Highlight
vim.api.nvim_exec([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}
]], false)
-- Copy to clipboard on exit
vim.api.nvim_exec([[
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")
]], false)
-- Install New Packages Automatically
vim.api.nvim_exec([[
autocmd BufWritePost plugins.lua PackerCompile
]], false)

-- Let me use o in terminal buffers
vim.api.nvim_exec([[
augroup TermMappings
  autocmd!
  autocmd TermOpen * nnoremap <buffer> o i
augroup END
]], false)

-- Don't assume I want a line comment after another line comment
vim.api.nvim_exec([[
autocmd BufNewFile,BufRead * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]], false)

-- Hybrid Numbers: Relative Numbers in Active windows, Norelative number in
-- inactive windows
vim.api.nvim_exec([[
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
]],false)

-- Remove whitespace on save
vim.api.nvim_exec([[
autocmd BufWritePre * %s/\s\+$//e
]],false)
