require "scripts.common"

local step = 5
local notify_timer = nil

local function get_sink()
    return capture("pamixer --get-default-sink")
        :match('"([^"]+)"[^"]*$') or "Unknown Sink"
end

local function get_volume()
    return capture("pamixer --get-volume")
end

local function send_vol_notification()
    local vol = tonumber(get_volume()) or 0
    local bar = string.rep(".", math.floor(vol / 15))
    local nsink = get_sink()

    hl.exec_cmd(string.format("notify-send -a '%s' -r 8 -t 800 '%s%s' '%s'", "pontos notify", vol, bar, nsink))
end

local function send_mute_notification()
    local state = capture("pamixer --get-mute")
    local sink = get_sink()
    local state_str = (state == "true") and "muted" or "unmuted"

    hl.exec_cmd(string.format("notify-send -a '%s' -r 8 -t 800 '%s' '%s'", "pontos notify", state_str, sink))
end

local function queue_notification(type)
    if notify_timer then
        notify_timer:set_enabled(false)
    end
    local fn = (type == "mute") and send_mute_notification or send_vol_notification
    notify_timer = hl.timer(fn, { timeout = 150, type = "oneshot" })
end

return function (action)
    if action == "i" or action == "d" then
        hl.exec_cmd(string.format("pamixer -%s %s", action, step))
        queue_notification("vol")
    elseif action == "m" then
        hl.exec_cmd("pamixer -t")
        queue_notification("mute")
    end
end
