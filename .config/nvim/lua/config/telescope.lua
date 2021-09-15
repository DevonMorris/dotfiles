local actions = require('telescope.actions')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local utils = require('telescope.utils')
local conf = require('telescope.config').values


require('telescope').setup{
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    file_previewer   = previewers.vim_buffer_cat.new,
    path_display = {"shorten"},
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist,
      },
      n = {
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}
require('telescope').load_extension('fzf')

M = {}

M.find_dots = function(opts)
  opts.path_display = utils.get_default(opts.path_display, {"shorten"})
  opts = opts or {}

  opts.cwd = os.getenv("HOME")
  -- By creating the entry maker after the cwd options,
  -- we ensure the maker uses the cwd options when being created.
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(opts, {
    prompt_title = '~~ Dotfiles ~~',
    finder = finders.new_oneshot_job(
      { "git",
      "--git-dir="..os.getenv("HOME").."/.dots/",
      "--work-tree="..os.getenv("HOME"),
      "ls-tree", "--full-tree", "-r", "--name-only", "HEAD" },
      opts
    ),
    previewer = previewers.vim_buffer_cat.new(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

-- Keymappings for Telescope
local opts = { noremap=true, silent=true }
local set_keymap = vim.api.nvim_set_keymap
set_keymap('n', '<leader>o',
  [[<Cmd>lua require'telescope.builtin'.find_files{find_command = {'fd', '--type', 'f'}, follow = true}<CR>]],
  opts)
set_keymap('n', '<leader>p',
  [[<Cmd>lua require'telescope.builtin'.find_files{find_command = {'fd', '--type', 'f', '--no-ignore'}, follow = true}<CR>]],
  opts)
set_keymap('n', '<leader>d',
  [[<Cmd>lua require'config.telescope'.find_dots{}<CR>]],
  opts)
set_keymap('n', '<leader>gr',
  [[<Cmd>lua require'telescope.builtin'.live_grep{}<CR>]],
  opts)
set_keymap('n', '<leader>r',
  [[<Cmd>lua require'telescope.builtin'.lsp_references{}<CR>]],
  opts)
set_keymap('n', '<leader>s',
  [[<Cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>]],
  opts)
set_keymap('n', '<leader>b',
  [[<Cmd>lua require'telescope.builtin'.buffers{}<CR>]],
  opts)
set_keymap('n', '<leader>t',
  [[<Cmd>lua require'telescope.builtin'.builtin{}<CR>]],
  opts)
set_keymap('n', '<leader>h',
  [[<Cmd>lua require'telescope.builtin'.help_tags{}<CR>]],
  opts)
set_keymap('n', '<leader>a',
  [[<Cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>]],
  opts)
set_keymap('n', '<C-G>s',
  [[<Cmd>lua require'telescope.builtin'.git_status{}<CR>]],
  opts)
set_keymap('n', '<C-G>v',
  [[<Cmd>lua require'telescope.builtin'.git_commits{}<CR>]],
  opts)
set_keymap('n', '<C-G>b',
  [[<Cmd>lua require'telescope.builtin'.git_branches{}<CR>]],
  opts)
set_keymap('n', '<leader>q',
  [[<Cmd>lua require'telescope.builtin'.quickfix{}<CR>]],
  opts)
set_keymap('n', '<leader>i',
  [[<Cmd>lua require'telescope.builtin'.file_browser{hidden = true}<CR>]],
  opts)
set_keymap('n', '<leader>/',
  [[<Cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>]],
  opts)
set_keymap('n', '<leader>:',
  [[<Cmd>lua require'telescope.builtin'.command_history{}<CR>]],
  opts)

return M
