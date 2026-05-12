--------------------------------------------------------
----------------------- INPUT --------------------------
--------------------------------------------------------
hl.config({
    input = {
        kb_layout  = "latam",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 0, -- hacer que el foco de la mentana cambie con el movimiento del puntero 1 = true y 0 = false

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    }
})


hl.config({
    cursor={
        inactive_timeout    =   5,
    }
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


--------------------------------------------------------
-------------------- CONFIG_LAYAUT ---------------------
--------------------------------------------------------
hl.config({
    dwindle =   {
        -- pseudotile      =   true,
        preserve_split  =   true,
        -- smart_split     =   true,
        smart_resizing  =   true,
        force_split     =   2,
        -- force_split     =   0,
        default_split_ratio     =   1.0,
        split_width_multiplier  =   1.2,
    },
})

hl.config({
    master  =   {
        new_on_top      =   true,
        new_on_active   =   none,
        orientation     =   "center",
        slave_count_for_center_master   =   4,
        center_master_fallback  =   "left",
    },
})

hl.config({
    scrolling   =   {
        fullscreen_on_one_column    =   false,
        column_width                =   0.7,
        direction                   =   "right",
        focus_fit_method            =   0,
    },
})


