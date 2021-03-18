-- Don't repeat line comments
vim.api.nvim_exec([[
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]], false)
-- Yank Highlight
vim.api.nvim_exec([[
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{on_visual = false}
]], false)
-- Copy to clipboard on exit
vim.api.nvim_exec([[
  autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")
]], false)
