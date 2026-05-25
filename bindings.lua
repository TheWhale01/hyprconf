local vars = require "vars"

hl.bind(vars.mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(vars.mainMod .. " + T", hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.mainMod .. " + Q", hl.dsp.window.close())
hl.bind(vars.mainMod .. " + delete", hl.dsp.exit())
hl.bind(vars.mainMod .. " + W", hl.dsp.window.float())
hl.bind(vars.mainMod .. " + A", hl.dsp.exec_cmd(vars.menu))
hl.bind(vars.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(vars.mainMod .. " + L", hl.dsp.exec_cmd(vars.lock))
hl.bind(vars.mainMod .. " + B", hl.dsp.exec_cmd(vars.browser))
hl.bind(vars.mainMod .. " + C", hl.dsp.exec_cmd(vars.codeEditor))
hl.bind(vars.mainMod .. " + PRINT", hl.dsp.exec_cmd(vars.screenshot .. " -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd(vars.screenshot .. " -m output"))
hl.bind(vars.mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(vars.mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(vars.mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(vars.mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(vars.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(vars.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(vars.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1"}))
hl.bind(vars.mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1"}))
hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volumecontrol.sh -o i"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/hypr/scripts/volumecontrol.sh -o d"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("./scripts/volumecontrol.sh -o m"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightnesscontrol.sh i"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightnesscontrol.sh d"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("switch:on:Lid Switch", function ()
    hl.monitor({
        output = "eDP-1",
        disabled = true
    })
end, { locked = true })
hl.bind("switch:off:Lid Switch", function ()
    hl.monitor({
        output = "eDP-1",
        mode = "preferred",
        position = "auto",
        scale = 1.5
    })
end, { locked = true })

for i = 1, 10 do
    local key = i % 10
    hl.bind(vars.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(vars.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
