local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local TaskList = require('widget.task-list')
local TagList = require('widget.tag-list')
local gears = require('gears')
local clickable_container = require('widget.material.clickable-container')
local mat_icon_button = require('widget.material.icon-button')
local mat_icon = require('widget.material.icon')
local dpi = require('beautiful').xresources.apply_dpi
local icons = require('theme.icons')
require("widget.material.slider")
require("widget.material.list-item")
--widgets
local battery_widget = require("widget.battery.init")
local brightness = require("widget.brightness.brightness-slider")
local cpu_meter = require("widget.cpu.cpu-meter")
local ram_meter = require("widget.ram.ram-meter")
local temperature = require("widget.temperature.temperature-meter")
local volume_slider = require("widget.volume.volume-slider")
local wifi_strength = require("widget.wifi.init")
local package = require("widget.package-updater.init")
local harddrive = require("widget.harddrive.harddrive-meter")

-- Titus - Horizontal Tray
-- local systray = wibox.widget.systray()
--   systray:set_horizontal(true)
--   systray:set_base_size(30)
--   systray.forced_height = 20

beautiful.bg_systray = "#1d2021"
beautiful.systray_icon_spacing = 10
local systray = wibox.widget {
  {
      wibox.widget.systray(),
      left   = 10,
      top    = 2,
      bottom = 4,
      right  = 10,
      widget = wibox.container.margin,
  },
   bg         = "#1d2021",
   shape      = gears.shape.rounded_rect,
   shape_clip = true,
   widget     = wibox.container.background,
}

  -- Clock / Calendar 24h format
-- local textclock = wibox.widget.textclock('<span font="Roboto Mono bold 9">%d.%m.%Y\n     %H:%M</span>')
-- Clock / Calendar 12AM/PM fornat
local textclock = wibox.widget.textclock('<span font="Roboto Mono 12">%I:%M %p</span>')
-- textclock.forced_height = 36

-- Add a calendar (credits to kylekewley for the original code)
local month_calendar = awful.widget.calendar_popup.month({
  screen = s,
  start_sunday = false,
  week_numbers = true
})
month_calendar:attach(textclock)

local clock_widget = wibox.container.margin(textclock, dpi(13), dpi(13), dpi(9), dpi(8))

local add_button = mat_icon_button(mat_icon(icons.plus, dpi(24)))
add_button:buttons(
  gears.table.join(
    awful.button(
      {},
      1,
      nil,
      function()
        awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = _G.mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
      end
    )
  )
)

-- Create an imagebox widget which will contains an icon indicating which layout we're using.
-- We need one layoutbox per screen.
local LayoutBox = function(s)
  local layoutBox = clickable_container(awful.widget.layoutbox(s))
  layoutBox:buttons(
    awful.util.table.join(
      awful.button(
        {},
        1,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        3,
        function()
          awful.layout.inc(-1)
        end
      ),
      awful.button(
        {},
        4,
        function()
          awful.layout.inc(1)
        end
      ),
      awful.button(
        {},
        5,
        function()
          awful.layout.inc(-1)
        end
      )
    )
  )
  return layoutBox
end

local TopPanel = function(s)
  
    local panel =
    wibox(
    {
      ontop = true,
      screen = s,
      height = dpi(32),
      width = s.geometry.width,
      x = s.geometry.x,
      y = s.geometry.y,
      stretch = false,
      bg = beautiful.bg_normal .. "00",
      fg = beautiful.fg_normal,
      struts = {
        top = dpi(32)
      }
    }
    )

    panel:struts(
      {
        top = dpi(32)
      }
    )

    panel:setup {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        -- Create a taglist widget
        TagList(s),
        TaskList(s),
        add_button
      },
      nil,
      {
        layout = wibox.layout.fixed.horizontal,
        wibox.container.margin(systray, dpi(2), dpi(3), dpi(6), dpi(3)),
        -- Layout box
        LayoutBox(s),
        -- Clock
        clock_widget,
        --battery_widget,
      --brightness,
      --cpu_meter,
      --ram_meter,
      --temperature,
      --volume_slider,
      --wifi_strength,
      --package,
      --harddrive,

      }
    }

  return panel
end

return TopPanel
