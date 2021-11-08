local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local utils = require('telescope.utils')
local conf = require('telescope.config').values

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

return M