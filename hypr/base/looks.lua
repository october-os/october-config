--
-- Look and feel
--

hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border   = { colors = {"rgb(".. color6 ..")", "rgb(" .. color4 .. ")"}, angle = 45 },
            inactive_border = "rgba(" .. color0 .. "88)",
        },
        layout = "dwindle",
    },

    decoration = {
        rounding       = 5,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 7,
            render_power = 2,
            color        = "rgba(" .. color0 .. "55)",
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 2,
            special = true,
            vibrancy  = 0,
        },
    },

    animations = {
        enabled = false,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 2,
        disable_hyprland_logo   = true,
        on_focus_under_fullscreen = 2,
        session_lock_xray = true,
    },
})
