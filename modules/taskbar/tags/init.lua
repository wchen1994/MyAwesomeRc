screen = require("screen")
awful = require("awful")
root = require("root")

m_tags = {}

local tag_names = { "Desktop", "Network", "Terminal", "Music", "Chat", "Showroom" }
local state = 1
function m_tags.toggle_tagnames()
	if state >= 2 then state = 0 else state = state + 1 end
	if state < 0 then state = 0 end
	for s in screen
	do
		tags = s.tags
		for t=1,#tags
		do
			if tag_names[t] then
				if state == 0 then
					tags[t].name = tostring(t)
				elseif state == 1 then
					tags[t].name = tag_names[t]
				elseif state == 2 then
					tags[t].name = tostring(t) .. ". " .. tag_names[t]
				end
			else
				tags[t].name = tostring(t)
			end
		end
	end
end

return m_tags
