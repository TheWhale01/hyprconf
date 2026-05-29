local function capture(cmd)
    local f = io.popen(cmd, 'r')
    if not f then
        return ""
    end
    local s = f:read("*a")
    f:close()
    return s:gsub("^%s*(.-)%s*$", "%1")
end

local function send_notification()
    local info = capture("brightnessctl info")
    local brightness = tonumber(info:match("%((%d+)%%%)")) or 0
    local brightinfo = info:match("Device '([^']+)'") or "Unknown"
    local bar_length = math.floor(brightness / 15)
    local bar = string.rep(".", bar_length)
    local cmd = string.format("notify-send -a 'pontos notify' -r 7 -t 800 '%s%s' '%s'", brightness, bar, brightinfo)

    os.execute(cmd)
end

local function get_brightness()
    local out = capture("brightnessctl -m")
    local b = out:match("(%d+)%%")
    return tonumber(b) or 0
end

return function (action)
    local step = 5
    local current = get_brightness()

    if current == 0 then
        return
    elseif current < 10 then
        step = 1
    end
    if action == "i" or action == "-i" then
        os.execute(string.format("brightnessctl set +%d%%", step))
        send_notification()
    elseif action == "d" or action == "-d" then
        os.execute(string.format("brightnessctl set %d%%-", step))
        send_notification()
    end
end
