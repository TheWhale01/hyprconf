require "monitors"
require "animations"
require "bindings"

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("dex -a -s ~/.config/autostart/")
end)

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,
        layout = "dwindle",
        resize_on_border = true,
        col = {
            active_border = {
                colors = {
                    "rgba(ca9ee6ff)",
                    "rgba(f2d5cfff)",
                },
                angle = 45
            },
            inactive_border = {
                colors = {
                    "rgba(b4befecc)",
                    "rgba(6c7086cc)",
                },
                angle = 45
            }
        }
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true
    },
    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false
        }
    }
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        mouse_refocus = 0,
        touchpad = {
          natural_scroll = true
        }
    }
})
