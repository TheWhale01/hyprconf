require "vars"

hl.bind(MainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(MainMod .. " + T", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + Q", hl.dsp.window.close())
hl.bind(MainMod .. " + delete", hl.dsp.exit())
hl.bind(MainMod .. " + W", hl.dsp.window.float())
hl.bind(MainMod .. " + A", hl.dsp.exec_cmd(Menu))
hl.bind(MainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(MainMod .. " + L", hl.dsp.exec_cmd(Lock))
hl.bind(MainMod .. " + B", hl.dsp.exec_cmd(Browser))
hl.bind(MainMod .. " + C", hl.dsp.exec_cmd(CodeEditor))
hl.bind(MainMod .. " + PRINT", hl.dsp.exec_cmd(Screenshot .. " -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd(Screenshot .. " -m output"))
hl.bind(MainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(MainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(MainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1"}))
hl.bind(MainMod .. " + mouse_up ", hl.dsp.focus({ workspace = "e-1"}))
hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("./scripts/volumecontrol.sh -o i"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("./scripts/volumecontrol.sh -o d"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("./scripts/volumecontrol.sh -o m"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("./scripts/brightnesscontrol.sh i"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("./scripts/brightnesscontrol.sh d"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("switch:on:Lid Switch", function ()
    hl.monitor({
        output = "eDP-1",
        mode = "disabled"
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
    hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
