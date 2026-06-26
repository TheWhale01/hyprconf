require "scripts.common"

local notify_timer = nil

local function send_notification()
    local info = capture("brightnessctl info")
    local brightness = tonumber(info:match("%((%d+)%%%)")) or 0
    local brightinfo = info:match("Device '([^']+)'") or "Unknown"
    local bar_length = math.floor(brightness / 15)
    local bar = string.rep(".", bar_length)
    local cmd = string.format("notify-send -a 'pontos notify' -r 7 -t 800 '%s%s' '%s'", brightness, bar, brightinfo)

    hl.exec_cmd(cmd)
end

local function queue_notification()
    if notify_timer then
        notify_timer:set_enabled(false)
    end
    notify_timer = hl.timer(send_notification, { timeout = 150, type = "oneshot" })
end

return function (action)
    local step = 5

    if action == "i" or action == "-i" then
        hl.exec_cmd(string.format("brightnessctl set +%d%%", step))
    elseif action == "d" or action == "-d" then
        hl.exec_cmd(string.format("brightnessctl set %d%%-", step))
    end
    queue_notification()
end
