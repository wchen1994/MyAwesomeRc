utils = {}

local gears = require("gears")
del_timeout = 3
del_timer = gears.timer{ timeout = del_timeout, single_shot = true }
del_timer:connect_signal("timeout", function()
	os.execute('rm .awesome_wallpaper_files')
end)

function execute_return_stdout(arg)
	os.execute(arg .. ' > .awesome_wallpaper_files')
	file = io.open('.awesome_wallpaper_files', 'r')
	stdout = {}
	out = file:read()
	while out
	do
		table.insert(stdout, out)
		out = file:read()
	end
	file:close()
	del_timer:start()
	return stdout
end

return utils
