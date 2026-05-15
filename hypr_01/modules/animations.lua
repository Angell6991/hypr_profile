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
local list_animation    =   {

    { leaf = "windows",         speed = 2,  style = "slide" },          -- movimiento/cambio de ventanas  
    { leaf = "windowsIn",       speed = 3,  style = "slide bottom"},    -- entrada de ventanas            
    { leaf = "windowsOut",      speed = 2,  style = "slide top" },      -- salida de ventanas   

    { leaf = "border",          speed = 1 },     -- bordes                         
    { leaf = "borderangle",     speed = 1 },     -- gradientes/ángulo RGB 

    { leaf = "fade",            speed = 3 },     -- opacidad general               
    { leaf = "fadeIn",          speed = 3 },     -- aparición                      
    { leaf = "fadeOut",         speed = 3 },     -- desaparición                   
    
    { leaf = "layers",          speed = 3,  style = "slide" },          -- overlays/barras                
    { leaf = "layersIn",        speed = 3,  style = "slide bottom" },   -- entrada de layers              
    { leaf = "layersOut",       speed = 3,  style = "slide top" },      -- salida de layers               
    
    { leaf = "workspaces",      speed = 2,  style =  "slidefadevert 100%" },     -- cambio de workspace            
    { leaf = "workspacesIn",    speed = 2,  style =  "slidefadevert 100%" },     -- workspace entrando             
    { leaf = "workspacesOut",   speed = 2,  style =  "slidefadevert 100%" },     -- workspace saliendo             
    
    { leaf = "zoomFactor",      speed = 1 },     -- zoom suave                     
    { leaf = "global",          speed = 1 },     -- fallback global                

}

for i   =   1,  #list_animation do
    hl.animation({ 
        leaf    = list_animation[i].leaf,      
        enabled = true,  
        speed   = list_animation[i].speed,    
        bezier  = "animation_main", 
        style   = list_animation[i].style, 
    })
end


