--------------------------------------------------------
------------------------ CURVES ------------------------
--------------------------------------------------------

-------------------------bezier-------------------------

hl.curve("animation_main", {
    type = "bezier",
    points = { { 0.34, 1.56 }, {  0.64, 1 }, },
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

    { leaf = "windows",         speed = 3,  style = "slide" },          -- movimiento/cambio de ventanas  
    { leaf = "windowsIn",       speed = 4,  style = "slide bottom"},    -- entrada de ventanas            
    { leaf = "windowsOut",      speed = 4,  style = "slide top" },      -- salida de ventanas   

    { leaf = "border",          speed = 2 },     -- bordes                         
    { leaf = "borderangle",     speed = 2 },     -- gradientes/ángulo RGB 

    { leaf = "fade",            speed = 4 },     -- opacidad general               
    { leaf = "fadeIn",          speed = 4 },     -- aparición                      
    { leaf = "fadeOut",         speed = 4 },     -- desaparición                   
    
    { leaf = "layers",          speed = 4,  style = "slide" },          -- overlays/barras                
    { leaf = "layersIn",        speed = 4,  style = "slide bottom" },   -- entrada de layers              
    { leaf = "layersOut",       speed = 4,  style = "slide top" },      -- salida de layers               
    
    { leaf = "workspaces",      speed = 2,  style =  "slidefadevert 100%" },     -- cambio de workspace            
    { leaf = "workspacesIn",    speed = 2,  style =  "slidefadevert 100%" },     -- workspace entrando             
    { leaf = "workspacesOut",   speed = 2,  style =  "slidefadevert 100%" },     -- workspace saliendo             
    
    { leaf = "zoomFactor",      speed = 2 },     -- zoom suave                     
    { leaf = "global",          speed = 2 },     -- fallback global                

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


