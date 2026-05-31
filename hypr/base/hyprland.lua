--
-- Variables
--

browser = "zen-browser"
terminal = "kitty"
main_mod = "SUPER"
app_launcher = "cd " .. os.getenv("HOME") .. "/.config/october-config/styles && wofi -S drun"
wallpaper_script = os.getenv("HOME") .. "/.config/october-config/scripts/update-wall.sh"

require("base/colors")
require("base/monitors")

--
-- Environment variables
--

hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/screenshots")

--
-- Autostart
--

hl.on("hyprland.start", function ()
    hl.exec_cmd("quickshell")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd(wallpaper_script)
end)

--
-- Windows and workspaces
--

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

require("base/bindings")
require("base/looks")
require("base/input")
