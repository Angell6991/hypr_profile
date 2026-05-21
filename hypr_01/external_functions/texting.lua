---------------lansar una notificacion -----------------
hl.bind("SUPER + X", function()
    hl.notification.create({
        text        =   "Hola Mundo",
        duration    =   5000,
        color       =   "rgb(226,226,226)",
        font_size   =   18,
    })
end)

--------------- notify new window open -----------------
hl.on("window.open", function(w)
    local ws = hl.get_active_workspace()

    hl.notification.create({
        text        = "  WS: " .. ws.name .. " | NW: " .. w.title,
        duration    = 5000,     -- 5segundos     
        color       = "rgb(226,226,226)",
        font_size   = 18,
    })
end)


