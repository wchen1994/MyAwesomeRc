local wibox = require("wibox")
local awful = require("awful")

local batt_text = wibox.widget.textbox()
batt_text:set_align("right")

battery_widget = wibox.layout.fixed.horizontal()
battery_widget:add(batt_text)

function update_batt()
	local fd = io.popen("acpi -b")
	local status = fd:read("*all")
	local status = status:match(", (%d?%d?%d)")
	batt_text:set_markup("bat:" .. status .. "%")
end

local mytimer = timer({timeout = 0.2})
mytimer:connect_signal("timeout", function () update_batt() end)
mytimer:start()
