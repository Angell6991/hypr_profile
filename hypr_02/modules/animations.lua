--------------------------------------------------------
------------------------ CURVES ------------------------
--------------------------------------------------------

-------------------------bezier-------------------------

hl.curve("animation_main", {
    type = "bezier",
    points = { { 0.45, 0.0 }, { 0.55, 1.0 }, },
})

-------------------------spring------------------------
hl.curve("easy", { 
    type = "spring", 
    mass = 1, 
    stiffness = 71.2633, 
    dampening = 15.8273644 
})

--------------------------------------------------------
--------------------- ANIMATIONS -----------------------
--------------------------------------------------------
hl.animation({
    leaf        =   "windows",
    enabled     =   true,
    speed       =   2,
    bezier      =   "animation_main",
    style       =   "slide bottom",
})

hl.animation({
    leaf        =   "windowsOut",
    enabled     =   true,
    speed       =   3,
    bezier      =   "animation_main",
    style       =   "slide top",
})

hl.animation({
    leaf        =   "border",
    enabled     =   true,
    speed       =   1,
    bezier      =   "animation_main",
})

hl.animation({
    leaf        =   "borderangle",
    enabled     =   true,
    speed       =   1,
    bezier      =   "animation_main",
})

hl.animation({
    leaf        =   "fade",
    enabled     =   true,
    speed       =   5,
    bezier      =   "animation_main",
})

hl.animation({
    leaf        =   "workspaces",
    enabled     =   true,
    speed       =   3,
    bezier      =   "animation_main",
    style       =   "slidefadevert 100%",
})


