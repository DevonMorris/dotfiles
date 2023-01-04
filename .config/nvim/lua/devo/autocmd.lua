-- This is really funky, but some autocommands only works if filetype plugin on
-- is called before. Although this is set by default in neovim I believe it is
-- called later. TODO: If I put this in a /after directory will everything be
-- happier?
vim.cmd([[filetype plugin on]])

-- Yank Highlight
vim.api.nvim_create_augroup("HighlightOnYank", {clear = true})
vim.api.nvim_create_autocmd(
  "TextYankPost",
  {callback = function ()
    vim.highlight.on_yank{on_visual = false}
  end, group = "HighlightOnYank"}
)
-- Copy to clipboard on exit
-- TODO: This is going to be hard to port over to lua
vim.api.nvim_exec([[
autocmd VimLeave * call system("echo -n $'" . escape(getreg(), "'") . "' | xsel -ib")
]], false)

-- Don't assume I want a line comment after another line comment
vim.api.nvim_create_augroup("Comment", {clear = true})
vim.api.nvim_create_autocmd(
  {"BufNewFile","BufRead"},
  {command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o", group = "Comment"}
)

-- Hybrid Numbers: Relative Numbers in Active windows, Norelative number in
-- inactive windows
vim.api.nvim_create_augroup("HybridNumbers", {clear = true})
vim.api.nvim_create_autocmd(
  {"BufEnter", "FocusGained", "InsertLeave"},
  {command = "set relativenumber", group = "HybridNumbers"}
)
vim.api.nvim_create_autocmd(
  {"BufLeave", "FocusLost", "InsertEnter"},
  {command = "set norelativenumber", group = "HybridNumbers"}
)

-- Remove whitespace on save
vim.api.nvim_create_augroup("StripWhitespace", {clear = true})
vim.api.nvim_create_autocmd("BufWritePre", {command = "%s/\\s\\+$//e", group = "StripWhitespace"})

-- Format code on save
vim.api.nvim_create_augroup("CodeFormat", {clear = true})
vim.api.nvim_create_autocmd("BufWritePre",
  {
    pattern = {"*.hpp", "*.h", "*.cpp", "*.tpp", "*.c", "*.rs"},
    command = "lua vim.lsp.buf.formatting()",
    group = "CodeFormat"
  }
)
