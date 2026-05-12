--------------------------------------------------------
------------------- LOOK AND FEEL ----------------------
--------------------------------------------------------
hl.config({
    
    general =   {
        gaps_in     =   15,
        gaps_out    =   { top = 10, left = 25, right = 25, bottom = 25 },       

        border_size = 0,

        col = {
            active_border   = { colors = {"rgba(ff0000ee)", "rgba(ff44a0ee)"}, angle = 10 },
            inactive_border = "rgba(1d1d1dee)",
        },

        resize_on_border    =   true,
        allow_tearing       =   false,
        layout              =   "dwindle",
        -- layout              =   "master",
        -- layout              =   "scrolling",
    },

    decoration = {
        rounding       = 20,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = true,
            range        = 50,
            render_power = 5,
            color        = 0xee1e1e1e,
            color_inactive  =   0x002e2e2e,
            -- ignore_window   =   false,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 5,
            vibrancy  = -10,
        },
    },

    animations = {
        enabled = true,
    },

})


--------------------------------------------------------
---------------- ENVIRONMENT VARIABLES -----------------
--------------------------------------------------------
var_env =   {

    { "QT_AUTO_SCREEN_SCALE_FACTOR",            "1" },
    { "QT_QPA_PLATFORM",                        "wayland;xcb" },
    { "QT_WAYLAND_DISABLE_WINDOWDECORATION",    "1" }, 
    { "QT_QPA_PLATFORMTHEME",                   "qt5ct" }, 

    { "XDG_CURRENT_DESKTOP",    "Hyprland" },
    { "XDG_SESSION_TYPE",       "wayland" },
    { "XDG_SESSION_DESKTOP",    "Hyprland" },

    { "XCURSOR_THEME",      "Moga-Neon-Water" },
    { "XCURSOR_SIZE",       "30" },
    { "HYPRCURSOR_THEME",   "Moga-Neon-Water" },
    { "HYPRCURSOR_SIZE",    "30" },
    { "GTK_THEME",          "Graphite-green-Dark" },

}

for i   = 1, #var_env   do
    hl.env(var_env[i][1], var_env[i][2])
end

-- env = XCURSOR_THEME,oreo_white_cursors
-- env = HYPRCURSOR_THEME,oreo_white_cursors
-- env = GTK_THEME,Graphite-teal-Dark


