require "scripts.common"

local step = 5

local function get_sink()
    return capture("pamixer --get-default-sink")
        :match('"([^"]+)"[^"]*$') or "Unknown Sink"
end

local function get_volume()
    return capture("pamixer --get-volume")
end

local function notify_mute()
    local state = capture("pamixer --get-mute")
    local sink = get_sink()
    local state_str
    if state == "true" then
        state_str = "muted"
    else
        state_str = "unmuted"
    end
    os.execute(string.format("notify-send -a '%s', -r 8 -t 800 %s %s", "pontos notify", state_str, sink))
end

local function notify_vol(vol)
    local bar = string.rep(".", math.floor(vol / 15))
    local nsink = get_sink()
    local cmd = string.format("notify-send -a '%s' -r 8 -t 800 '%s%s' '%s'", "pontos notify", vol, bar, nsink)

    os.execute(cmd)
end

local function mute()
    os.execute("pamixer -t")
    notify_mute()
end

local function change_volume(action)
    local volume = get_volume()
    local cmd = string.format("pamixer -%s %s", action, step)
    if action == "i" and volume == 100 then
        return
    elseif action == "d" and volume == 0 then
        return
    end
    os.execute(cmd)
    volume = get_volume()
    notify_vol(volume)
end

return function (action)
    if action == "i" or action == "d" then
        change_volume(action)
    elseif action == "m" then
        mute()
    end
end
