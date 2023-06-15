local lualine = require'lualine'

lualine.setup{
  options = {
    theme = 'gruvbox',
    section_separators = {nil, nil},
    component_separators = {nil, nil},
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = { {'filename', file_status = true, path = 1}, {'diagnostics', sources = {'nvim_diagnostic'}} },
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
