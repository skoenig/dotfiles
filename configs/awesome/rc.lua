-- *created Tuesday, 10. December 2013 - updated Monday, 13. January 2014*
-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- Load Debian menu entries
require("debian.menu")
-- widgets
require("vicious")

-- {{{ Widgets
-- Initialize widgets
batterywidget = widget({ type = "textbox" })
mpdwidget = widget({ type = "textbox" })
-- Register widgets
vicious.register(batterywidget, vicious.widgets.bat, "$1$2%", 10, "BAT0")
vicious.register(mpdwidget, vicious.widgets.mpd,
    function (widget, args)
        if args["{state}"] == "Stop" then
            return " - "
        else
            return args["{Artist}"]..' - '.. args["{Title}"]
        end
    end, 10)

-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init(awful.util.getdir("config") .. "/current_theme/theme.lua")
mythememenu = {}

function theme_load(theme)
   local cfg_path = awful.util.getdir("config")

   -- Create a symlink from the given theme to /home/user/.config/awesome/current_theme
   awful.util.spawn("ln -sfn " .. cfg_path .. "/themes/" .. theme .. " " .. cfg_path .. "/current_theme")
   awesome.restart()
end

function theme_menu()
   -- List your theme files and feed the menu table
   local cmd = "ls -1 " .. awful.util.getdir("config") .. "/themes/"
   local f = io.popen(cmd)

   for l in f:lines() do
      local item = { l, function () theme_load(l) end }
      table.insert(mythememenu, item)
   end

   f:close()
end

-- Generate your table at startup or restart
theme_menu()

-- This is used later as the default terminal and editor to run.
terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
--    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
--    awful.layout.suit.spiral.dwindle,
--    awful.layout.suit.max,
--    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier
}
-- }}}
-- {{{ Theme Tweaks
-- color palette
local  black                 = "#000000"
local  navy                  = "#000080"
local  darkblue              = "#00008b"
local  mediumblue            = "#0000cd"
local  blue                  = "#0000ff"
local  darkgreen             = "#006400"
local  green                 = "#008000"
local  teal                  = "#008080"
local  darkcyan              = "#008b8b"
local  deepskyblue           = "#00bfff"
local  darkturquoise         = "#00ced1"
local  mediumspringgreen     = "#00fa9a"
local  lime                  = "#00ff00"
local  springgreen           = "#00ff7f"
local  aqua                  = "#00ffff"
local  cyan                  = "#00ffff"
local  midnightblue          = "#191970"
local  dodgerblue            = "#1e90ff"
local  lightseagreen         = "#20b2aa"
local  forestgreen           = "#228b22"
local  seagreen              = "#2e8b57"
local  darkslategray         = "#2f4f4f"
local  limegreen             = "#32cd32"
local  mediumseagreen        = "#3cb371"
local  turquoise             = "#40e0d0"
local  royalblue             = "#4169e1"
local  steelblue             = "#4682b4"
local  darkslateblue         = "#483d8b"
local  mediumturquoise       = "#48d1cc"
local  indigo                = "#4b0082"
local  darkolivegreen        = "#556b2f"
local  cadetblue             = "#5f9ea0"
local  cornflowerblue        = "#6495ed"
local  mediumaquamarine      = "#66cdaa"
local  dimgray               = "#696969"
local  slateblue             = "#6a5acd"
local  olivedrab             = "#6b8e23"
local  slategray             = "#708090"
local  lightslategray        = "#778899"
local  mediumslateblue       = "#7b68ee"
local  lawngreen             = "#7cfc00"
local  chartreuse            = "#7fff00"
local  aquamarine            = "#7fffd4"
local  maroon                = "#800000"
local  purple                = "#800080"
local  olive                 = "#808000"
local  skyblue               = "#87ceeb"
local  lightskyblue          = "#87cefa"
local  blueviolet            = "#8a2be2"
local  darkred               = "#8b0000"
local  darkmagenta           = "#8b008b"
local  saddlebrown           = "#8b4513"
local  darkseagreen          = "#8fbc8f"
local  lightgreen            = "#90ee90"
local  mediumpurple          = "#9370db"
local  darkviolet            = "#9400d3"
local  palegreen             = "#98fb98"
local  darkorchid            = "#9932cc"
local  yellowgreen           = "#9acd32"
local  sienna                = "#a0522d"
local  brown                 = "#a52a2a"
local  darkgray              = "#a9a9a9"
local  lightblue             = "#add8e6"
local  greenyellow           = "#adff2f"
local  paleturquoise         = "#afeeee"
local  lightsteelblue        = "#b0c4de"
local  powderblue            = "#b0e0e6"
local  firebrick             = "#b22222"
local  darkgoldenrod         = "#b8860b"
local  mediumorchid          = "#ba55d3"
local  rosybrown             = "#bc8f8f"
local  darkkhaki             = "#bdb76b"
local  gray                  = "#bebebe"
local  silver                = "#c0c0c0"
local  mediumvioletred       = "#c71585"
local  indianred             = "#cd5c5c"
local  peru                  = "#cd853f"
local  chocolate             = "#d2691e"
local  tan                   = "#d2b48c"
local  lightgrey             = "#d3d3d3"
local  thistle               = "#d8bfd8"
local  orchid                = "#da70d6"
local  goldenrod             = "#daa520"
local  palevioletred         = "#db7093"
local  crimson               = "#dc143c"
local  gainsboro             = "#dcdcdc"
local  plum                  = "#dda0dd"
local  burlywood             = "#deb887"
local  lightcyan             = "#e0ffff"
local  lavender              = "#e6e6fa"
local  darksalmon            = "#e9967a"
local  violet                = "#ee82ee"
local  palegoldenrod         = "#eee8aa"
local  lightcoral            = "#f08080"
local  khaki                 = "#f0d58c"
local  aliceblue             = "#f0f8ff"
local  honeydew              = "#f0fff0"
local  azure                 = "#f0ffff"
local  sandybrown            = "#f4a460"
local  wheat                 = "#f5deb3"
local  beige                 = "#f5f5dc"
local  whitesmoke            = "#f5f5f5"
local  mintcream             = "#f5fffa"
local  ghostwhite            = "#f8f8ff"
local  salmon                = "#fa8072"
local  antiquewhite          = "#faebd7"
local  linen                 = "#faf0e6"
local  lightgoldenrodyellow  = "#fafad2"
local  oldlace               = "#fdf5e6"
local  red                   = "#ff0000"
local  fuchsia               = "#ff00ff"
local  magenta               = "#ff00ff"
local  deeppink              = "#ff1493"
local  orangered             = "#ff4500"
local  tomato                = "#ff6347"
local  hotpink               = "#ff69b4"
local  coral                 = "#ff7f50"
local  darkorange            = "#ff8c00"
local  lightsalmon           = "#ffa07a"
local  orange                = "#ffa500"
local  lightpink             = "#ffb6c1"
local  pink                  = "#ffc0cb"
local  gold                  = "#ffd700"
local  peachpuff             = "#ffdab9"
local  navajowhite           = "#ffdead"
local  moccasin              = "#ffe4b5"
local  bisque                = "#ffe4c4"
local  mistyrose             = "#ffe4e1"
local  blanchedalmond        = "#ffebcd"
local  papayawhip            = "#ffefd5"
local  lavenderblush         = "#fff0f5"
local  seashell              = "#fff5ee"
local  cornsilk              = "#fff8dc"
local  lemonchiffon          = "#fffacd"
local  floralwhite           = "#fffaf0"
local  snow                  = "#fffafa"
local  yellow                = "#ffff00"
local  lightyellow           = "#ffffe0"
local  ivory                 = "#fffff0"
local  white                 = "#ffffff"
-- overrides
theme.font          = "monospace 8"
theme.bg_focus      = "#3465A4"
theme.border_width  = "2"
theme.border_focus  = lightsalmon
--theme.bg_focus      = springgreen
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "themes", mythememenu },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "Debian", debian.menu.Debian_menu.Debian },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" }, "%F %T",1)

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mylauncher,
            mytaglist[s],
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        mytextclock,
        s == 1 and mysystray or nil,
        batterywidget,
        mpdwidget,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
--    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
--    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    awful.key({ modkey,           }, "Down", function () awful.client.focus.byidx( 1) if client.focus then client.focus:raise() end end),
    awful.key({ modkey,           }, "Right", function () awful.client.focus.byidx( 1) if client.focus then client.focus:raise() end end),
    awful.key({ modkey,           }, "Up", function () awful.client.focus.byidx(-1) if client.focus then client.focus:raise() end end),
    awful.key({ modkey,           }, "Left", function () awful.client.focus.byidx(-1) if client.focus then client.focus:raise() end end),

    awful.key({ modkey, "Shift"   }, "Down", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "Right", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "Up", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Shift"   }, "Left", function () awful.client.swap.byidx( -1)    end),

    -- Layout manipulation
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab", function () awful.client.focus.history.previous() if client.focus then client.focus:raise() end end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Control" }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- multimedia keybindings
    awful.key({ modkey,           }, "Delete", function () awful.util.spawn("amixer set Master toggle -q") end),
    awful.key({ modkey,           }, "Prior", function () awful.util.spawn("amixer set Master 4%+ -q") end),
    awful.key({ modkey,           }, "Next", function () awful.util.spawn("amixer set Master 4%- -q") end),
    awful.key({ modkey,           }, "Home", function () awful.util.spawn("mpc prev") end),
    awful.key({ modkey,           }, "End", function () awful.util.spawn("mpc next") end),
    awful.key({ modkey,           }, "Insert", function () awful.util.spawn("mpc toggle") end),
    awful.key({ modkey, "Shift"   }, "Delete", function () awful.util.spawn("gnome-screensaver-command --lock") end),

    -- Prompt
    awful.key({ modkey            }, "r",     function () mypromptbox[mouse.screen]:run() end)

--    awful.key({ modkey            }, "x",
--              function ()
--                  awful.prompt.run({ prompt = "Run Lua code: " },
--                  mypromptbox[mouse.screen].widget,
--                  awful.util.eval, nil,
--                  awful.util.getdir("cache") .. "/history_eval")
--              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "x",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
--    c:add_signal("mouse::enter", function(c)
--        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
--            and awful.client.focus.filter(c) then
--            client.focus = c
--        end
--    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
-- {{{ Misc
--function run_once(prg,arg_string,pname,screen)
--    if not prg then
--        do return nil end
--    end
--
--    if not pname then
--       pname = prg
--    end
--
--    if not arg_string then
--        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. "' || (" .. prg .. ")",screen)
--    else
--        awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. pname .. " ".. arg_string .."' || (" .. prg .. " " .. arg_string .. ")",screen)
--    end
--end
--
--run_once("muttwork",nil,nil,8)
-- }}}
