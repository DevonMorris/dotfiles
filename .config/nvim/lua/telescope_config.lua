local a = vim.api
local actions = require('telescope.actions')
local config = require('telescope.config')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local utils = require('telescope.utils')
local conf = require('telescope.config').values


require('telescope').setup{
  defaults = {
    shorten_path = true,
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
  },
  },
}

M = {}

M.find_dots = function(opts)
  opts.shorten_path = utils.get_default(opts.shorten_path, true)
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
    previewer = previewers.cat.new(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

-- Looks for git files, but falls back to normal files
M.files = function(opts)
  opts = opts or {}

  vim.fn.system("git status")
  local is_not_git = vim.v.shell_error > 0
  if is_not_git then
    require'telescope.builtin'.find_files(opts)
    return
  end

  if opts.cwd then
    opts.cwd = vim.fn.expand(opts.cwd)
  else
    --- Find root of git directory and remove trailing newline characters
    opts.cwd = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), '[\n\r]+', '')
  end

  -- By creating the entry maker after the cwd options,
  -- we ensure the maker uses the cwd options when being created.
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)

  pickers.new(opts, {
    prompt_title = 'Git File',
    finder = finders.new_oneshot_job(
      { "git", "ls-files", "--recurse-submodules" },
      opts
    ),
    previewer = previewers.cat.new(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

M.tagstack = function(opts)
  opts = opts or {}
  local tagstack = vim.fn.gettagstack()
  if vim.tbl_isempty(tagstack.items) then
    return
  end

  for i, value in pairs(tagstack.items) do
    value.text = value.tagname
    value.lnum = value.from[2]
    value.filename = vim.fn.bufname(value.from[1])
  end

  -- reverse the list
  tags = {}
  for i=#tagstack.items, 1, -1 do
    tags[#tags+1] = tagstack.items[i]
  end

  pickers.new(opts, {
      prompt_title = 'TagStack',
      finder = finders.new_table {
        results = tags,
        entry_maker = make_entry.gen_from_quickfix(opts),
      },
      previewer = previewers.qflist.new(opts),
      sorter = conf.generic_sorter(opts),
    }):find()
end

return M
