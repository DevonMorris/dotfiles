local telescope = require'telescope.builtin'
M = {}

M.find_dots = function(opts)
  opts = opts or {}

  opts.cwd = os.getenv("HOME").."/.dots"
  telescope.git_files(opts)
end

return M
