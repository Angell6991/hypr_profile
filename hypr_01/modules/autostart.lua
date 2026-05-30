--------------------------------------------------------
---------------------- AUTOSTART -----------------------
--------------------------------------------------------
local initial   =   {
    
    -- instalar:  pacman -S xdg-desktop-portal-hyprland , para el soporte de compartir pantalla 
    "dbus-update-activation-environment -- systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP GTK_THEME",
    "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP GTK_THEME",

    "awww-daemon &",                        
    "sleep 4 && ~/.config/hypr/random_imagen.sh &",
    "hypridle &",                                           -- iniciando el control para himbernacion del sistema
    "dunst &",                                              -- iniciando el gestor de notificaciones
    "wlsunset -S 6:00 -s 19:00 -t 5500 -T 6500 -d 2 &",     --inicio de luz "nocturna"
    "udiskie &",                                            -- iniciando el montador de usb
    "kanata -c ~/.config/kanata.kbd & disown &", 
    -- "hyprpm reload &",

    ----------------------iniciar_eww-----------------------
    "~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_inf_system daemon &",
    "~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_inf_system open widget_inf &",

    "~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_workspace daemon &",
    "~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_workspace open widget_workspace &",

    "~/.config/mako/scripts/mode_cover_laptop.sh",
}


hl.on("hyprland.start", function ()

    for i   =   1, #initial do
        hl.exec_cmd( initial[i] ) 
    end

end)


--------------------------------------------------------
------------------- PERMISSIONS ------------------------
--------------------------------------------------------
hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

local   permiss =   {
    { "/usr/(bin|local/bin)/grim",                              "screencopy",   "allow" },
    { "/usr/(bin|local/bin)/hyprlock",                          "screencopy",   "allow" },
    { "/usr/(bin|local/bin)/hyprpicker",                        "screencopy",   "allow" },
    { "/usr/(bin|local/bin)/wf-recorder",                       "screencopy",   "allow" },
    { "/usr/(bin|local/bin)/",                                  "screencopy",   "allow" },
    { "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",   "screencopy",   "allow" },
    { "/usr/(bin|local/bin)/hyprpm",                            "plugin",       "allow" },
}

for i   =   1,  #permiss    do
    hl.permission(permiss[i][1], permiss[i][2], permiss[i][3])
end

--------------------------------------------------------
----------------------  MISC  --------------------------
--------------------------------------------------------
hl.config({
    misc = {
        force_default_wallpaper =   -1,     -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   =   true,   -- If true disables the random hyprland logo / anime girl background. :(
        enable_anr_dialog       =   false   -- whether to enable the ANR (app not responding) dialog when your apps hang
    },
})


