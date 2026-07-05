---------------------- info layout ---------------------
-- hl.bind("SUPER + a", function()
--     -- local inf_layout = hl.get_active_workspace().tiled_layout 
--     local inf_layout = hl.get_active_window().class 

--     hl.notification.create({
--         text        = inf_layout,
--         duration    = 5000,
--         color       = "rgb(226,226,226)",
--         font_size   = 18,
--     })
-- end)

---------------- windows for workspaces ----------------
hl.bind("SUPER + a", function()

    local text = ""
    local workspaces = hl.get_workspaces()

    for _, ws in ipairs(workspaces) do
        
        local windows = hl.get_workspace_windows(ws.id)

        if #windows > 0 then
            
            text = text .. string.format("  Workspace %s\n", ws.name)
            text = text .. "──────────────────────────────\n"

            for _, w in ipairs(windows) do
                text = text .. string.format(
                    " ╭─ %s\n ╰──  %s\n\n",
                    w.class,
                    w.title
                )
            end

        end

    end

    hl.notification.create({
        text = text,
        duration = 5000,
        color = "rgb(226,226,226)",
        font_size = 18,
    })

end)

--------------------------------------------------------



