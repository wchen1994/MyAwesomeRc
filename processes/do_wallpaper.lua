local gears = require("gears")

-- {{{ Reset Wallpaper after start of nautilus
-- configuration - edit to your liking
wp_timeout  = 3
-- setup the timer
wp_timer = gears.timer { timeout = wp_timeout, single_shot = true }
wp_timer:connect_signal("timeout", function()
   for s = 1, screen.count() do
      set_wallpaper(s)
   end
   wp_timer:stop()
end)
 
-- initial start when rc.lua is first run
wp_timer:start()
-- }}}
