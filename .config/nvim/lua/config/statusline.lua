local gps = require'nvim-gps'

gps.setup({
	icons = {
		["class-name"] = ' ',      -- Classes and class-like objects
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' '      -- Methods (functions inside class-like objects)
	},
	separator = ' > ',
})

local lualine = require'lualine'

lualine.setup{
  options = {
    theme = 'auto',
    section_separators = {nil, nil},
    component_separators = {nil, nil},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = { {'filename', file_status = true}, {'diagnostics', sources = {'nvim_lsp'}} },
    lualine_x = { { gps.get_location, condition = gps.is_available }, 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {   }
  }
}
