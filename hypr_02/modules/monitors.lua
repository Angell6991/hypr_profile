--------------------------------------------------------
------------------- MONITORS ---------------------------
--------------------------------------------------------

-------- function ocuppy name array monitors -----------
local function get_monitor_names()
    local monitors = hl.get_monitors()
    local names = {}

    for _, monitor in ipairs(monitors) do
        table.insert(names, monitor.name)
    end

    return names
end

-- def array name monitors
local names = get_monitor_names()


--------------------------------------------------------
------------ dynamic monitor configuration -------------
--------------------------------------------------------

-- config 1 monitor
if  #names == 1  then
    
    hl.monitor({
        output   = names[1],
        mode     = "preferred",
        position = "auto",
        scale    = "auto",
    })

-- config 2 monitors
elseif  #names ==   2 then

    hl.monitor({
        output   = names[1],
        mode     = "1366x768@60",
        position = "0x0",
        scale    = "1",
    })

    hl.monitor({
        output   = names[2],
        mode     = "preferred",
        position = "0x1366",
        scale    = "1",
        -- mirror   = names[1],
        -- transform = 1    -- rotar pantalla
    })


end


--------------------------------------------------------
-- sysmtem notifycations conet and disconet monitors ---
--------------------------------------------------------

-- conect monitor
hl.on("monitor.added", function(m)
    hl.notification.create({
        text = "Monitor conectado: " .. m.name,
        duration    = 5000,     -- 5segundos     
        color       = "rgb(226,226,226)",
        font_size   = 18,    
    })

    hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))
end)

-- disconet monitor
hl.on("monitor.removed", function(m)
    hl.notification.create({
        text = "Monitor desconectado: " .. m.name,
        duration    = 5000,     -- 5segundos     
        color       = "rgb(226,226,226)",
        font_size   = 18,    
    })

    hl.dispatch(hl.dsp.exec_cmd("hyprctl reload"))
end)


--------------------------------------------------------
------ obsiones de rotacion para; transforms -----------
--------------------------------------------------------

-- 0 -> normal (no transforms)
-- 1 -> 90 degrees
-- 2 -> 180 degrees
-- 3 -> 270 degrees
-- 4 -> flipped
-- 5 -> flipped + 90 degrees
-- 6 -> flipped + 180 degrees
-- 7 -> flipped + 270 degrees


