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
    shorten_path = true,
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
      fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
    },
  },
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('docker')

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
    previewer = previewers.vim_buffer_cat.new(opts),
    sorter = conf.file_sorter(opts),
  }):find()
end

local filter = vim.tbl_filter
M.terminals = function(opts)
  local bufnrs = filter(function(b)
    if 1 ~= vim.fn.buflisted(b) then
        return false
    end
    if not opts.show_all_buffers and not vim.api.nvim_buf_is_loaded(b) then
      return false
    end
    if opts.ignore_current_buffer and b == vim.api.nvim_get_current_buf() then
      return false
    end
    return true
  end, vim.api.nvim_list_bufs())
  if not next(bufnrs) then return end

  local t_bufnrs = filter(function(b)
      return vim.fn.getbufinfo(b)[1].variables.term_title ~= nil
  end, bufnrs)
  if not next(t_bufnrs) then return end

  local buffers = {}
  local default_selection_idx = 1
  for _, bufnr in ipairs(t_bufnrs) do
    local flag = bufnr == vim.fn.bufnr('') and '%' or (bufnr == vim.fn.bufnr('#') and '#' or ' ')

    if opts.sort_lastused and not opts.ignore_current_buffer and flag == "#" then
      default_selection_idx = 2
    end

    local element = {
      bufnr = bufnr,
      flag = flag,
      info = vim.fn.getbufinfo(bufnr)[1],
    }

    if opts.sort_lastused and (flag == "#" or flag == "%") then
      local idx = ((buffers[1] ~= nil and buffers[1].flag == "%") and 2 or 1)
      table.insert(buffers, idx, element)
    else
      table.insert(buffers, element)
    end
  end

  if not opts.bufnr_width then
    local max_bufnr = math.max(unpack(bufnrs))
    opts.bufnr_width = #tostring(max_bufnr)
  end

  pickers.new(opts, {
    prompt_title = 'Terminals',
    finder    = finders.new_table {
      results = buffers,
      entry_maker = opts.entry_maker or make_entry.gen_from_buffer(opts)
    },
    previewer = conf.grep_previewer(opts),
    sorter = conf.generic_sorter(opts),
    default_selection_index = default_selection_idx,
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
  [[<Cmd>lua require'telescope.builtin'.grep_string{ only_sort_text = true, search = vim.fn.input("Grep For >") }<CR>]],
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
set_keymap('n', '<leader>x',
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
set_keymap('n', '<leader>wc',
  [[<Cmd>lua require'telescope'.extensions.docker.containers{}<CR>]],
  opts)
set_keymap('n', '<leader>ws',
  [[<Cmd>lua require'telescope'.extensions.docker.search{}<CR>]],
  opts)
set_keymap('n', '<leader>wi',
  [[<Cmd>lua require'telescope'.extensions.docker.images{}<CR>]],
  opts)
set_keymap('n', '<leader>i',
  [[<Cmd>lua require'telescope.builtin'.file_browser{hidden = true}<CR>]],
  opts)

return M
