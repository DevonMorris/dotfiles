local wezterm = require'wezterm'

local keys = {
}

return {
  font = wezterm.font 'Fira Code',
  color_scheme = "Gruvbox Dark",
  enable_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  warn_about_missing_glyphs = false,
  check_for_updates = false,
  show_update_window = false,
  keys = keys
}
