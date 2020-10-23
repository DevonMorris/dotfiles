local a = vim.api
local actions = require('telescope.actions')
local config = require('telescope.config')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
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

config = {}

config.find_dots = function(opts)
  opts = opts or {}

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

return config
