local Lib = {}

function Lib:cleanup()
    ETB_PALETTE = nil
end

function Lib:preInit()
    ETB_PALETTE = {
        ["tension_maxtext"] = {0.5, 0, 1, 1},
        ["tension_back"] = {150 / 255, 82 / 255, 206 / 255, 1},
        ["tension_decrease"] = {1, 0, 0, 1},
        ["tension_fill"] = {236 / 255, 201 / 255, 255 / 255, 1},
        ["tension_max"] = {208 / 255, 0 / 255, 255 / 255, 1},
    }
end

return Lib