-- Awesome rc.lua
-- author: Devon Morris
-- contact: devonmorris1992@gmail.com
-- date: Sat Feb 20 10:45:10 EST 2021
--
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- Widgets
local battery_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")({ enable_battery_warning = false })
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

local has_fdo, freedesktop = pcall(require, "freedesktop")

local battery_widget_visible = true -- A flag to store the widget's visibility status
local battery_widget_container = wibox.container.background()
battery_widget_container:set_widget(battery_widget)

function toggle_battery_widget()
    if battery_widget_visible then
        -- Hide the battery widget
        battery_widget_container:set_widget(nil)
    else
        -- Show the battery widget
        battery_widget_container:set_widget(battery_widget)
    end
    -- Update the visibility flag
    battery_widget_visible = not battery_widget_visible
end

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/themes/gruvbox_material/theme.lua")

-- This is used later as the default terminal and editor to run.
-- The terminal priority is
-- ghostty
-- alacritty
-- urxvt
-- gnome-terminal
-- xterm
--
-- If none of these are available then simply warn and continue
local terminals = { "ghostty", "alacritty", "urxvt", "gnome-terminal", "xterm" }

terminal = ""
for _, t in ipairs(terminals) do
    -- The awesome user guide explicitly says not to do this, but this should
    -- run fast enough to not be an issues
    local f = io.popen("which " .. t)
    f:read("*all")
    local rc = { f:close() }
    if  rc[1] == true then
        naughty.notify({ preset = naughty.config.presets.normal,
            title = "Terminal found",
            text = "Terminal found: " .. t
        })
        terminal = t
        break
    end
end
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.floating,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
    { "hotkeys",     function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual",      terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. awesome.conffile },
    { "restart",     awesome.restart },
    { "quit",        function() awesome.quit() end },
}

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon }
local menu_terminal = { "open terminal", terminal }

if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome },
        after = { menu_terminal }
    })
else
    mymainmenu = awful.menu({
        items = {
            menu_awesome,
            {},
            menu_terminal,
        }
    })
end

mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu
})


-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                { raise = true }
            )
        end
    end),
    awful.button({}, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
        awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
        awful.client.focus.byidx(-1)
    end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s)
    end
end

-- Split ultrawide in multiple virtual screens
--[[ local geo = screen.primary.geometry
local new_width = 1920
local new_width2 = geo.width - new_width
screen.primary:fake_resize(geo.x, geo.y, new_width, geo.height)
screen.fake_add(geo.x + new_width, geo.y, new_width2, geo.height) ]]

local cw = calendar_widget({
    theme = 'naughty',
    placement = 'top_right',
    radius = 8
})

mytextclock:connect_signal("button::press",
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({ "Term", "Viz", "Msg", "Web", "Muz" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
            s.mytasklist, -- Middle widget
        },
        {
            layout = wibox.layout.align.horizontal,
            spacing = 10,
        },
        {             -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing = 10,
            mytextclock,
            battery_widget_container,
            fs_widget(),
            wibox.widget.systray(),
            s.mylayoutbox,
        },
    }
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey, }, "n",
        function()
            awful.client.focus.byidx(1)
        end,
        { description = "focus next by index", group = "client" }),
    awful.key({ modkey, }, "p",
        function()
            awful.client.focus.byidx(-1)
        end,
        { description = "focus previous by index", group = "client" }),
    -- Layout manipulation
    awful.key({ modkey, "Shift" }, "n", function() awful.client.swap.byidx(1) end,
        { description = "swap with next client by index", group = "client" }),
    awful.key({ modkey, "Shift" }, "p", function() awful.client.swap.byidx(-1) end,
        { description = "swap with previous client by index", group = "client" }),
    awful.key({ modkey, "Control" }, "n", function() awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }),
    awful.key({ modkey, "Control" }, "p", function() awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }),
    awful.key({ modkey, }, "u", awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }),
    awful.key({ modkey, }, "Tab",
        function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }),
    -- Standard program
    awful.key({ modkey }, "z",
        function() awful.screen.focused().mywibox.visible = not awful.screen.focused().mywibox.visible end,
        { description = "toggle bar", group = "screen" }),
    awful.key({ modkey, }, "Return", function() awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }),
    awful.key({ modkey, "Shift" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Shift" }, "e", function() os.execute("dmlogout") end,
        { description = "logout menu", group = "awesome" }),
    awful.key({ modkey, }, "space", function() awful.layout.inc(1) end,
        { description = "select next", group = "layout" }),

    awful.key({ modkey, "Control" }, "m",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", { raise = true }
                )
            end
        end,
        { description = "restore minimized", group = "client" }),

    -- Menubar
    awful.key({ modkey }, "d", function() awful.util.spawn("dmenu_run") end,
        { description = "show the menubar", group = "launcher" }),
    awful.key({ modkey, "Control" }, "q", function() awful.util.spawn("dmkill") end,
        { description = "show the menubar", group = "launcher" }),
    -- Scrot
    awful.key({ modkey }, "s", function() os.execute("dmscrot") end,
        { description = "take a screenshot", group = "launcher" }),

    -- Brightness
    awful.key({}, "XF86MonBrightnessUp", function() os.execute("brightnessctl s 5%+") end,
        { description = "Increase brightness", group = "hotkeys" }),
    awful.key({}, "XF86MonBrightnessDown", function() os.execute("brightnessctl s 5%-") end,
        { description = "Decrease brightness", group = "hotkeys" }),

    -- Spotify
    awful.key({}, "XF86AudioPlay", function()
        awful.util.spawn("playerctl play-pause", false)
    end),
    awful.key({}, "XF86AudioNext", function()
        awful.util.spawn("playerctl next", false)
    end),
    awful.key({}, "XF86AudioPrev", function()
        awful.util.spawn("playerctl previous", false)
    end),
    awful.key({}, "XF86AudioLowerVolume", function() os.execute('pactl -- set-sink-volume 0 -5%') end,
        { description = "Lower Volume", group = "hotkeys" }),
    awful.key({}, "XF86AudioRaiseVolume", function() os.execute('pactl -- set-sink-volume 0 +5%') end,
        { description = "Raise Volume", group = "hotkeys" }),

    -- Lock
    awful.key({ modkey, "Control" }, "l", function() os.execute('slock') end,
        { description = "Lock Screen", group = "hotkeys" }),

    -- Toggle battery_widget visibility
    awful.key({ modkey, "Shift" }, "b",
        function()
            toggle_battery_widget()
        end,
        { description = "toggle battery_widget visibility", group = "custom" })
)

clientkeys = gears.table.join(
    awful.key({ modkey, "Shift" }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, }, "q", function(c) c:kill() end,
        { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
        { description = "move to master", group = "client" }),
    awful.key({ modkey, }, "o", function(c) c:move_to_screen() end,
        { description = "move to screen", group = "client" }),
    awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
        { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey, }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = "client" })
)

-- Bind all key numbers to tags.
tag_to_key = { "j", "k", "l", ";", "'" };
for i, k in pairs(tag_to_key) do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, k,
            function()
                local screen = awful.screen.focused()
                local selected_tags = screen.selected_tag
                local tag = screen.tags[i]
                if tag then
                    if selected_tags == tag then
                        awful.tag.history.restore()
                    else
                        tag:view_only()
                    end
                end
            end,
            { description = "view tag #" .. i, group = "tag" }),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, k,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, k,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #" .. i, group = "tag" }),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, k,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
end

clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    {
        rule_any = {
            role = {
                "gimp-toolbox",
                "gimp-dock"
            }
        },
        properties = { ontop = true, floating = true }
    },

    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA",   -- Firefox addon DownThemAll.
                "copyq", -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "Sxiv",
                "teams-for-linux",
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
                "matplotlib",
                "Matplotlib",
                "simplescreenrecorder",
                "SimpleScreenRecorder",
                "Microsoft Teams - Preview",
                "Ocu",
                "zoom" },

            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester", -- xev.
            },
            role = {
                "AlarmWindow",   -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up",        -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    },

    -- Add titlebars to normal clients and dialogs
    {
        rule_any = { type = { "normal", "dialog" }
        },
        properties = { titlebars_enabled = false }
    },
    {
        rule_any = { class = { "Slack", "zoom" } },
        properties = { screen = 1, tag = "Msg" }
    },
    {
        rule_any = { class = { "Spotify", "spotify" }, name = { "Spotify", "spotify" } },
        properties = { screen = 1, tag = "Tunes" }
    },
    {
        rule_any = {
            class = { "Gazebo GUI", "gazebo", "rviz", "rqt_graph", "rqt_image_view", "Gimp", "Sxiv", "feh",
                "CloudCompare", "rerun" },
            name = { "Gazebo Sim" }
        },
        properties = { screen = 1, tag = "Viz" }
    },
    {
        rule_any = { class = { "Navigator", "firefox" } },
        properties = { screen = 1, tag = "Web" }
    }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)


-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({}, 1, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
            c:emit_signal("request::activate", "titlebar", { raise = true })
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c):setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        {     -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--
-- Programs to run upon starting awesomewm
awful.spawn("setxkbmap -layout us -option ctrl:nocaps")
awful.spawn("nm-applet")
awful.spawn("blueman-applet")
awful.spawn("lxpolkit")
