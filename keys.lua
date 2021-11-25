local awful = require("awful")
local helpers = require("helpers")
local keys = {}

modkey = "Mod4"

awful.keyboard.append_global_keybindings({
--Rofi
awful.key({modkey}, "space", function() awful.spawn.with_shell("rofi -show drun") end,
     { }),
awful.key({modkey}, "z", function() awful.spawn.with_shell("rofi -show window") end,
     { }),

awful.key({ }, "XF86PowerOff",
        function ()
            exit_screen_show()
        end,
        {description = "quit awesome", group = "awesome"}),

        -- Brightness
    awful.key( { }, "XF86MonBrightnessDown",
        function()
            awful.spawn.with_shell("light -U 10")
        end,
        {description = "decrease brightness", group = "brightness"}),
    awful.key( { }, "XF86MonBrightnessUp",
        function()
            awful.spawn.with_shell("light -A 10")
        end,
        {description = "increase brightness", group = "brightness"}),

    -- Volume Control with volume keys
    awful.key( { }, "XF86AudioMute",
        function()
            helpers.volume_control(0)
        end,
        {description = "(un)mute volume", group = "volume"}),
    awful.key( { }, "XF86AudioLowerVolume",
        function()
            helpers.volume_control(-5)
        end,
        {description = "lower volume", group = "volume"}),
    awful.key( { }, "XF86AudioRaiseVolume",
        function()
            helpers.volume_control(5)
        end,
        {description = "raise volume", group = "volume"}),
    })
        return keys