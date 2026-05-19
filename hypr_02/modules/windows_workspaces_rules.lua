--------------------------------------------------------
--------------------  WORKSPACES -----------------------
--------------------------------------------------------
local   workspace_type  =   {
    { "1", "scrolling" },
    { "2", "master" },
    { "3", "dwindle" },
    { "4", "scrolling" },
}

for i   = 1, #workspace_type     do
    hl.workspace_rule({ 
        workspace   =   workspace_type[i][1], 
        layout      =   workspace_type[i][2],
    })
end

-------- example float workspace number 3 --------------
-- hl.window_rule({
--     match = { workspace = "3" },
--     float = true
-- })


--------------------------------------------------------
----------------------- WINDOWS  -----------------------
--------------------------------------------------------

----------------------workspace_1-----------------------
hl.window_rule({ match = { class = "kitty" }, workspace = "1" })
hl.window_rule({ match = { class = "firefox" }, workspace = "1" })

----------------------workspace_2-----------------------
hl.window_rule({ match = { class = "org.pwmt.zathura" }, workspace = "2" })

----------------------workspace_3-----------------------
local   list_workspace_3 =   {
    "org.matplotlib.Matplotlib3",
    "Matplotlib",
    "Tk",
    "eog",
    "org.gnome.eog",
    "python3.12",
    "blueman-manager",
    "blueman-services",
    "blueman-sendto",
    "org.pulseaudio.pavucontrol",
    "org.gnome.clocks",
    "org.gnome.Calendar",
    "mpv",
    "org.telegram.desktop",
    "com.usebottles.bottles",
    "io.bassi.Amberol",
    "flet",
    "python3.13",
    "io.github.seadve.Mousai",
    "libreoffice-startcenter",
    "localsend",
}

for i   =   1,  #list_workspace_3   do
  hl.window_rule({ match = { class = list_workspace_3[i] }, workspace = "3" })
end

----------------------workspace_4-----------------------
local   list_workspace_4 =   {
    "org.libretro.RetroArch",
    "com.libretro.RetroArch",
    "com.github.xournalpp.xournalpp",
    "Lightdm-gtk-greeter-settings",
    "gimp",
    "draw.io",
    "fontforge",
    "org.inkscape.Inkscape",
    "net.lutris.Lutris",
}

for i   =   1,   #list_workspace_4   do
  hl.window_rule({ match = { class = list_workspace_4[i] }, workspace = "4" })
end

---------------------float_windows-------------------------
local floating_windows = {
      { class = "com.gabm.satty",               size = { 954, 618 } },
      { class = "blueman-manager",              size = { 581, 358 } },
      { class = "blueman-services" },
      { class = "blueman-sendto" },
      { class = "org.pulseaudio.pavucontrol",   size = { 627, 414 } },
      { class = "org.gnome.clocks",             size = { 450, 600 } },
      { class = "org.gnome.Calendar",           size = { 800, 600 } },
      { class = "org.telegram.desktop",         size = { 717, 642 } },
      { class = "io.bassi.Amberol",             size = { 364, 704 } },
}

for i   =   1,  #floating_windows   do
    hl.window_rule({
        match = { class = floating_windows[i].class },
        float = true,
        size = floating_windows[i].size,
    })
end


-----------------------------------------------------------
----------------------layerrule----------------------------
-----------------------------------------------------------

-- hyprctl clients -> consulta class de los windows
-- hyprctl layers  -> consulta namespace de las capas

--------------------- fuzzel_launcher ---------------------
hl.layer_rule({
    match = { namespace = "launcher" },
    blur = true,
    blur_popups = true,
    ignore_alpha = 0.2,
    -- animation = "slide 10%",
})

------------------------ eww_widget ------------------------
hl.layer_rule({
    match = { namespace = "gtk-layer-shell" },
    -- blur = true,
    -- blur_popups = true,
    -- ignore_alpha = 0.7,
    animation = "slide 10%",
})

----------------------- swaync_notify -----------------------
hl.layer_rule({
    match = { namespace = "notifications" },
    blur = true,
    blur_popups = true,
    ignore_alpha = 0.2,
    animation = "slide 10%",
})

------------------animations_for_layerrule-----------------
-- fade      ->  Aparece/desaparece con transparencia
-- fadein    ->  Solo animación de entrada (fade)
-- fadeout   ->  Solo animación de salida (fade)
-- popin     ->  Aparece desde un tamaño pequeño (efecto “zoom con rebote”)
-- zoom      ->  Zoom simple, más directo que `popin`
-- slide     ->  Se desliza desde una dirección
-- lidefade  ->  Combina deslizamiento + fade (más suave)


