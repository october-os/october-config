--
-- Bindings
--

local hyprlock_config = os.getenv("HOME") .. "/.config/hypr/base/hyprlock.conf"

-- Hyprland management
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("awww kill && hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(main_mod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock -c " .. hyprlock_config))

-- October management
hl.bind(main_mod .. " + W", hl.dsp.exec_cmd(wallpaper_script))

-- Open apps
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(main_mod .. " + R", hl.dsp.exec_cmd(app_launcher))

-- Screenshots
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Windows management
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle"}))
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))
hl.bind(main_mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"}))

-- Move focus with main_mod + arrow keys
hl.bind(main_mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move focus with main_mod + vim keys
hl.bind(main_mod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + J",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with main_mod + [0-9]
-- Move active window to a workspace with main_mod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(main_mod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(main_mod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with main_mod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Volume, multimedia and brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),      { locked = true, repeating = true })

hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),     { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),   { locked = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("swayosd-client --brightness +10"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("swayosd-client --brightness -10"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("swayosd-client --playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("swayosd-client --playerctl prev"),   { locked = true })