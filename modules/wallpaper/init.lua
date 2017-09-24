beautiful = require("beautiful")
gears = require("gears")
screen = require("screen")

local m_wallpaper = {}

function m_wallpaper.set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, false)
    end
end

function m_wallpaper.set_wallpaper()
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        for s in screen
        do
            if type(wallpaper) == "function" then
                wallpaper = wallpaper(s)
            end
            gears.wallpaper.maximized(wallpaper, s, false)
        end
    end
end

-- {{{ Reset Wallpaper after start of nautilus
-- setup the timer
wp_timer = gears.timer { timeout = 0.2 }
wp_timer:connect_signal("timeout", function()
    -- set wallpaper to current index for all screens
    m_wallpaper.set_wallpaper()
    -- stop the timer (we don't need multiple instances running at the same time)
    wp_timer:stop()
end)
 
-- initial start when rc.lua is first run
wp_timer:start()
-- }}}

-- {{{ Signals
-- Reset timer when tag changed
screen.connect_signal("tag::history::update", function() wp_timer:start() end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function() m_wallpaper.set_wallpaper() end)
-- }}}

return m_wallpaper
