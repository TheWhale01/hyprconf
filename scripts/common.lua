function capture(cmd)
    local f = io.popen(cmd, 'r')
    if not f then
        return ""
    end
    local s = f:read("*a")
    f:close()
    return s:gsub("^%s*(.-)%s*$", "%1")
end
