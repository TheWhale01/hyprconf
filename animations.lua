hl.curve("myBezier", {
    type = "bezier",
    points = {
        { 0.05, 0.9 },
        { 0.1, 1.05 },
    },
})

hl.animation({
    enabled = true,
    leaf = "windows",
    speed = 7,
    bezier = "myBezier"
})

hl.animation({
    enabled = true,
    leaf = "windowsOut",
    speed = 7,
    bezier = "default",
    style = "popin 80%"
})

hl.animation({
    enabled = true,
    leaf = "border",
    speed = 10,
    bezier = "default",
})

hl.animation({
    enabled = true,
    leaf = "borderangle",
    speed = 8,
    bezier = "default",
})

hl.animation({
    enabled = true,
    leaf = "fade",
    speed = 7,
    bezier = "default",
})

hl.animation({
    enabled = true,
    leaf = "workspaces",
    speed = 6,
    bezier = "default",
})
