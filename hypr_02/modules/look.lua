--------------------------------------------------------
------------------- LOOK AND FEEL ----------------------
--------------------------------------------------------
hl.config({
    
    general =   {
        gaps_in     =   5,
        gaps_out    =   { top = 10, left = 10, right = 10, bottom = 10 },       

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(b8b8ffee)", "rgba(470038ee)"}, angle = 50 },
            inactive_border = "rgba(226, 226, 226, 0)",
        },

        resize_on_border    =   true,
        allow_tearing       =   false,
        layout              =   "dwindle",
        -- layout              =   "master",
        -- layout              =   "scrolling",
    },

    decoration = {
        rounding       = 20,
        rounding_power = 1,

        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        shadow = {
            enabled      = true,
            range        = 50,
            render_power = 5,
            color        = 0x001e1e1e,
            color_inactive  =   0x80080808,
            -- color_inactive  =   0x002e2e2e,  -- quitar sombra de ventanas 
            -- ignore_window   =   false,
        },

        blur = {
            enabled   = true,
            size      = 10,
            passes    = 2,
            vibrancy  = 100,
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

    { "XCURSOR_THEME",      "Moga-Neon-Magenta" },
    { "XCURSOR_SIZE",       "30" },
    { "HYPRCURSOR_THEME",   "Moga-Neon-Magenta" },
    { "HYPRCURSOR_SIZE",    "30" },
    { "GTK_THEME",          "Dracula" },

}

for i   = 1, #var_env   do
    hl.env(var_env[i][1], var_env[i][2])
end

-- env = XCURSOR_THEME,oreo_white_cursors
-- env = HYPRCURSOR_THEME,oreo_white_cursors
-- env = GTK_THEME,Graphite-teal-Dark


