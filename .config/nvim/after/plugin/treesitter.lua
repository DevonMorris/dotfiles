fts = {
  "rust",
  "c",
  "cpp",
  "lua",
  "ocaml",
  "go",
  "python",
  "bash",
}
require('nvim-treesitter').install(fts):wait(300000)

vim.api.nvim_create_augroup("Treesitter", { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = fts,
  callback = function() vim.treesitter.start() end,
  group = "Treesitter",
})
