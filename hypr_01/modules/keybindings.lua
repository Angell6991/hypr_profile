-----------------------------------------------------------
--------------------- KEYBINDINGS -------------------------
-----------------------------------------------------------
local   mod_01  =   "SUPER"
local   mod_02  =   "CTRL" 
local   mod_03  =   "SHIFT"

local   bind_simple =   {

    -------------------------apps------------------------------
    { "Return", "kitty" },
    { "space",  "fuzzel" },

    ------------------control_brillo_pantalla------------------
    { "f6", "~/.config/mako/scripts/brightness_01.sh" },
    { "f5", "~/.config/mako/scripts/brightness_02.sh" },

    ------------------------Audio_config-----------------------
    { "f12", "~/.config/mako/scripts/volume_01.sh" },
    { "f11", "~/.config/mako/scripts/volume_02.sh" },
    { "f10", "~/.config/mako/scripts/volume_03.sh" },

    ---------------------capturas_de_pantalla------------------
    { "Print", "~/.config/mako/scripts/full_screenshot.sh" },
    -- descarga grim y slurp con sudo pacman -S grim slurp

    -----------------------grabar_pantalla---------------------
    { "f3", "~/.config/mako/scripts/video_init.sh" },
    { "f4", "~/.config/mako/scripts/video_stop.sh" },
    -- descarga: sudo pacman -S wf-recorder

    ------------------zbarimg_for_scan_QR----------------------
    { "f7", "~/.config/mako/scripts/zbar_QR.sh" },
    { "f8", "hyprpicker -a" },

}

local bind_no_simple    =   {

    { "q",  "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'" },
    { "l",  "~/.eww/target/release/eww -c ~/.config/hypr/eww/widget_power_menu open bar-window" },
    { "f1", "hyprlock & sleep 2 && systemctl suspend" },
    { "f9", "~/.config/hypr/eww/widget_lock/lock.sh"},

    ------------------------Audio_config-----------------------
    { "f10", "~/.config/mako/scripts/pause_audio.sh" },

    ---------------------capturas_de_pantalla------------------
    { "Print", "~/.config/mako/scripts/screenshot_of_a_section.sh" },

}

local bluetooth =   {
    -- install: sudo pacman -S wev
    { "XF86AudioPlay",  "~/.config/mako/scripts/pause_audio.sh" },
    { "XF86AudioPause", "~/.config/mako/scripts/pause_audio.sh" },
    { "XF86AudioNext",  "hyprlock" },
    { "XF86AudioPrev",  "~/.config/mako/scripts/volume_03.sh" },
}

for i   =   1,  #bind_simple    do
    hl.bind(mod_01 .. "+" .. bind_simple[i][1] , hl.dsp.exec_cmd(bind_simple[i][2]))
end

for i   =   1,  #bind_no_simple    do
    hl.bind(mod_01 .. "+" .. mod_02 .. "+" .. bind_no_simple[i][1] , hl.dsp.exec_cmd(bind_no_simple[i][2]))
end

for i   =   1,  #bluetooth    do
    hl.bind(bluetooth[i][1] , hl.dsp.exec_cmd(bluetooth[i][2]))
end

----------------cambio_entre_tipo_de_ventanas--------------
hl.bind(mod_01 .. " + f ", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod_01 .. " + p ", hl.dsp.window.pseudo())
hl.bind(mod_01 .. " + BackSpace ", hl.dsp.window.close())


-----------------------------------------------------------
------------- Mover_el_foco_de_las_ventanas ---------------
-------------------- Mover_ventanas -----------------------
-----------------------------------------------------------
local   dir   =   { "left", "right", "up", "down" }

for i   =   1,  #dir    do
    hl.bind(mod_01 .. "+" .. dir[i], hl.dsp.focus({ direction = dir[i] }))
    hl.bind(mod_01 .. "+" .. mod_03 .. "+" .. dir[i], hl.dsp.window.move({ direction = dir[i] }))
end


-----------------------------------------------------------
----- Submap_Mover_ventanas_Redimensionar_ventanas --------
-----------------------------------------------------------
hl.bind(mod_01 .. "+ r", function ()
    
    -- activa el submap
    hl.dispatch(hl.dsp.submap("float_setting"))
    
    -- notifica init submap
    hl.notification.create({
        text        =   "  float setting",
        duration    =   1500,   -- 1.5 segundo
        color       =   "rgb(226,226,226)",
        font_size   =   18,
    })

end)

----------------------def submap --------------------------
hl.define_submap("float_setting", function()
  
    -- def config submap
    local   setting_window   =   {
        { "right",  { x = 50,   y = 0,   relative = true } },
        { "left",   { x = -50,  y = 0,   relative = true } },
        { "up",     { x = 0,    y = -50, relative = true } },
        { "down",   { x = 0,    y = 50,  relative = true } },
    }

    for i   =   1,  #setting_window do

        -- Redimensionar_ventanas
        hl.bind(
            mod_01 .. "+" .. setting_window[i][1], 
            hl.dsp.window.resize( setting_window[i][2] )
        )
        -- Mover_ventanas
        hl.bind(
            mod_01 .. "+" .. mod_03 .. "+" .. setting_window[i][1], 
            hl.dsp.window.move( setting_window[i][2] )
        )

    end

    -- cambiar wallpaper
    hl.bind("w", hl.dsp.exec_cmd("~/.config/hypr/random_imagen.sh"))

    -- salir manualmente
    hl.bind("escape", function ()
       
        -- activar la salida del submap
        hl.dispatch(hl.dsp.submap("reset"))
        
        -- notifica exit submap
        hl.notification.create({
            text        =   "  setting exit",
            duration    =   1500,   -- 1.5 segundo
            color       =   "rgb(226,226,226)",
            font_size   =   18,
        })

    end) 

end)


-----------------------------------------------------------
-------------- Moverse_entre_los_workspaces ---------------
-------------- Mover_ventana_a_un_workspace ---------------
------ Mover_ventana_a_un_workspace_sin_cambiar_foco ------
-----------------------------------------------------------
local   workspaces =   {1, 2, 3, 4} 

for i = 1, #workspaces do
    hl.bind(mod_01 .. "+" .. workspaces[i], hl.dsp.focus({ workspace = workspaces[i] }))
    hl.bind(mod_01 .. "+" .. mod_02 .. "+" .. workspaces[i], hl.dsp.window.move({ workspace = workspaces[i] }))
    hl.bind(mod_02 .. "+" .. mod_03 .. "+" .. workspaces[i], hl.dsp.window.move({ workspace = workspaces[i], follow = false }))
end


------------Mover_el_foco_entre_workspace_activos----------
local focus_workspaces  =   {
    {"up",   "e-1"}, {"down",   "e+1"},
    {"left", "e-1"}, {"right",  "e+1"},
}

for i   =   1,  #focus_workspaces    do
    hl.bind(
        mod_01 .. "+" .. mod_02 .. "+" .. focus_workspaces[i][1], 
        hl.dsp.focus({ workspace = focus_workspaces[i][2] })
    )
end

-----------mover_entre_workspaces_con_mause_touchpad-------
hl.bind(mod_01 .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod_01 .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-----------mover_ventanas_con_el_mause_touchpad------------
hl.bind(mod_01 .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod_01 .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod_01 .. "+ tab", hl.dsp.window.cycle_next()) 


