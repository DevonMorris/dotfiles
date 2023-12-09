local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local make_entry = require("telescope.make_entry")
local previewers = require("telescope.previewers")
local utils = require("telescope.utils")
local conf = require("telescope.config").values

require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		layout_config = {
			vertical = { width = 0.5 },
		},
		file_sorter = sorters.get_fzy_sorter,
		file_previewer = previewers.vim_buffer_cat.new,
		path_display = { "truncate" },
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
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})
require("telescope").load_extension("fzf")

-- Keymappings for Telescope
local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap
set_keymap(
	"n",
	"<leader>o",
	[[<Cmd>lua require'telescope.builtin'.find_files{find_command = {'fd', '--type', 'f'}, follow = true}<CR>]],
	opts
)
set_keymap(
	"n",
	"<leader>p",
	[[<Cmd>lua require'telescope.builtin'.find_files{find_command = {'fd', '--type', 'f', '--no-ignore'}, follow = true}<CR>]],
	opts
)
set_keymap("n", "<leader>d", [[<Cmd>lua require'devo.telescope'.find_dots{}<CR>]], opts)
set_keymap("n", "<leader>gr", [[<Cmd>lua require'telescope.builtin'.live_grep{}<CR>]], opts)
set_keymap("n", "gr", [[<Cmd>lua require'telescope.builtin'.lsp_references{}<CR>]], opts)
set_keymap("n", "<leader>s", [[<Cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>]], opts)
set_keymap(
	"n",
	"<leader>b",
	[[<Cmd>lua require'telescope.builtin'.buffers{sort_mru = true, ignore_current_buffer = true}<CR>]],
	opts
)
set_keymap("n", "<leader>h", [[<Cmd>lua require'telescope.builtin'.help_tags{}<CR>]], opts)
set_keymap("n", "<C-G>d", [[<Cmd>lua require'telescope.builtin'.git_status{}<CR>]], opts)
set_keymap("n", "<C-G>v", [[<Cmd>lua require'telescope.builtin'.git_commits{}<CR>]], opts)
set_keymap("n", "<C-G>b", [[<Cmd>lua require'telescope.builtin'.git_branches{}<CR>]], opts)
set_keymap("n", "<leader>q", [[<Cmd>lua require'telescope.builtin'.quickfix{}<CR>]], opts)
set_keymap("n", "<leader>/", [[<Cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>]], opts)
set_keymap("n", "<leader>:", [[<Cmd>lua require'telescope.builtin'.command_history{}<CR>]], opts)
set_keymap("n", "<leader>a", [[<Cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>]], opts)
require("telescope").load_extension("ui-select")
