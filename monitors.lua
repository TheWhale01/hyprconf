-- Home usb-c monitors
hl.monitor({
    output = "desc:Iiyama North America PL2470H 0x00000AC0",
    mode = "1920x1080@144",
    position = "0x0",
    scale = 1
})

hl.monitor({
    output = "desc:Iiyama North America PL2470H 0x00000AC8",
    mode = "1920x1080@144",
    position = "1920x0",
    scale = 1
})

-- Laptop monitor
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1.5,
    disabled = false
})

-- Other unknown monitors
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1;
})

local function assign_workspaces()
    local plugged_monitors = hl.get_monitors()
    table.sort(plugged_monitors, function(a, b) return a.x < b.x end)
    for index, monitor in ipairs(plugged_monitors) do
        hl.workspace_rule({
            workspace = tostring(index),
            monitor = "desc:" .. monitor.description
        })
    end
end

assign_workspaces()

hl.on("monitor.added", function() assign_workspaces() end)
hl.on("monitor.removed", function() assign_workspaces() end)
