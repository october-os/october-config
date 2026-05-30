--
-- Variables
--

local browser = "zen-browser"
local terminal = "kitty"
local main_mod = "SUPER"
local app_launcher = "wofi -S drun"
local wallpaper_script = os.getenv("HOME") .. "/.config/october-config/scripts/update-wall.sh"

require("./colors.lua")
require("./monitors.lua")

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

require("./bindings.lua")
require("./looks.lua")
require("./input.lua")
