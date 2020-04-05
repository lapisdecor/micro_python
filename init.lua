local config = import("micro/config")
local shell = import("micro/shell")

function init()
    -- true means overwrite any existing binding to CtrlR
    -- this will modify the bindings.json file
    config.TryBindKey("F5", "lua:initlua.pythonrun", true)
end

function pythonrun(bp)
    local buf = bp.Buf
    if buf:FileType() == "python" then
        -- the true means run in the foreground
        -- the false means send output to stdout (instead of returning it)
        shell.RunInteractiveShell("python3  " .. buf.Path, true, false)
    end
end
