local lib = ACTIVE_LIB
local GMGraphics = modRequire('libraries.gmutils.src.utils.GMGraphics')

function lib:init()
    GMGraphics.init()
end

function lib:preDraw()
    GMGraphics.reset()
end

return lib
