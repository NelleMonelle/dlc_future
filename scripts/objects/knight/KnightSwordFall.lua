local KnightSwordFall, super = Class(Object)

function KnightSwordFall:init(x, y)
    super.init(self, x, y)
end

function KnightSwordFall:setTurnType(type)
end

function KnightSwordFall:update()
    super.update(self)
end

function KnightSwordFall:draw()
    super.draw(self)
end

return KnightSwordFall