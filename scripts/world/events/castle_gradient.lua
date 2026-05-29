local CastleGradient, super = Class(Event)

function CastleGradient:init(data)
    super.init(self, data)
    self:setSprite("world/events/castle_gradient")
    self.sprite:setScale(1, 17)
end

return CastleGradient