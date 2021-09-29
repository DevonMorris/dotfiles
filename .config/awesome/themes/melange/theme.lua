-------------------------------
--  "melange" awesome theme  --
--    By Devon Morris  --
-------------------------------

local themes_path = "~/.config/awesome/themes/"
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.wallpaper = themes_path .. "melange/melange.jpg"
-- }}}

-- {{{ Styles
theme.font      = "IBM Plex Sans 9"

-- {{{ Colors
theme.fg_normal  = "#94A8D1"
theme.fg_focus   = "#2A2622"
theme.fg_urgent  = "#2A2622"
theme.bg_normal  = "#2A2622"
theme.bg_focus   = "#F7C96E"
theme.bg_urgent  = "#94A8D1"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(0)
theme.border_width  = dpi(0)
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.bg_focus
theme.border_marked = theme.bg_urgent
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
theme.fg_widget = theme.fg_normal
theme.bg_widget = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_bg = theme.bg_normal

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
theme.taglist_squares_sel   = themes_path .. "melange/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "melange/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "melange/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "melange/layouts/tile.png"
theme.layout_tileleft   = themes_path .. "melange/layouts/tileleft.png"
theme.layout_tilebottom = themes_path .. "melange/layouts/tilebottom.png"
theme.layout_tiletop    = themes_path .. "melange/layouts/tiletop.png"
theme.layout_fairv      = themes_path .. "melange/layouts/fairv.png"
theme.layout_fairh      = themes_path .. "melange/layouts/fairh.png"
theme.layout_spiral     = themes_path .. "melange/layouts/spiral.png"
theme.layout_dwindle    = themes_path .. "melange/layouts/dwindle.png"
theme.layout_max        = themes_path .. "melange/layouts/max.png"
theme.layout_fullscreen = themes_path .. "melange/layouts/fullscreen.png"
theme.layout_magnifier  = themes_path .. "melange/layouts/magnifier.png"
theme.layout_floating   = themes_path .. "melange/layouts/floating.png"
theme.layout_cornernw   = themes_path .. "melange/layouts/cornernw.png"
theme.layout_cornerne   = themes_path .. "melange/layouts/cornerne.png"
theme.layout_cornersw   = themes_path .. "melange/layouts/cornersw.png"
theme.layout_cornerse   = themes_path .. "melange/layouts/cornerse.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "melange/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "melange/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "melange/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "melange/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "melange/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "melange/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "melange/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "melange/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "melange/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "melange/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "melange/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "melange/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "melange/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "melange/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "melange/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "melange/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "melange/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "melange/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
