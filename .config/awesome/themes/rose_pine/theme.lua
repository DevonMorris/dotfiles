-------------------------------
--  "gruvbox_material" awesome theme  --
--    By Devon Morris  --
-------------------------------

local themes_path = "~/.config/awesome/themes/"
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "rose_pine/rose_pine.jpg"
-- }}}

-- {{{ Styles
theme.font      = "sans 8"

-- {{{ Colors
theme.fg_normal  = "#d4be98"
theme.fg_focus   = "#282828"
theme.fg_urgent  = "#282828"
theme.bg_normal  = "#1d2021"
theme.bg_focus   = "#a9b665"
theme.bg_urgent  = "#ea6962"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(6)
theme.border_width  = dpi(0)
theme.border_normal = "#1d2021"
theme.border_focus  = "#7daea3"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = theme.bg_focus
theme.titlebar_bg_normal = theme.bg_normal
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}
theme.tasklist_bg_focus = theme.bg_focus
theme.tasklist_fg_focus = theme.fg_focus

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "gruvbox_material/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "gruvbox_material/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "gruvbox_material/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "gruvbox_material/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "gruvbox_material/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "gruvbox_material/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "gruvbox_material/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "gruvbox_material/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "gruvbox_material/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "gruvbox_material/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "gruvbox_material/layouts/dwindle.png"
theme.layout_max        = themes_path .. "gruvbox_material/layouts/max.png"
theme.layout_fullscreen = themes_path .. "gruvbox_material/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "gruvbox_material/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "gruvbox_material/layouts/floating.png"
theme.layout_cornernw   = themes_path .. "gruvbox_material/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "gruvbox_material/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "gruvbox_material/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "gruvbox_material/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "gruvbox_material/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "gruvbox_material/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "gruvbox_material/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "gruvbox_material/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "gruvbox_material/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "gruvbox_material/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "gruvbox_material/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "gruvbox_material/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "gruvbox_material/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "gruvbox_material/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "gruvbox_material/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "gruvbox_material/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "gruvbox_material/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "gruvbox_material/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "gruvbox_material/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "gruvbox_material/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "gruvbox_material/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "gruvbox_material/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
