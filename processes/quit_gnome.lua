-- Override awesome.quit when we're using GNOME
_awesome_quit = awesome.quit
awesome.quit = function()
    if os.getenv("DESKTOP_SESSION") == "awesome-gnome" then
       os.execute("pkill -9 gnome-session") -- I use this on Ubuntu 16.04
    else
    _awesome_quit()
    end
end
