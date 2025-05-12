--- The color-changing floor region usually found in front of a dark fountain (intended for use with [DarkFountain](lua://DarkFountain.init)). \
--- `FountainFloor` is an [`Event`](lua://Event.init) - naming an object `fountainfloor` on an `objects` layer in a map creates this object.
--- 
---@class FountainFloor : Event
---
---@field fountain DarkFountain?    The `DarkFountain` object present in this map, if it exists - prioritises using this for object color.
---@field siner number              Timer for the color-changing effect
---@field stage Stage
---
---@overload fun(...) : FountainFloor
local FountainFloor, super = Class(Event)

function FountainFloor:init(x, y, shape)
    super.init(self, x, y, shape)

    self:setColor(0.9, 0.9, 0.9)

    self.fountain = nil

    self.siner = 0
end

function FountainFloor:update()
    super.update(self)
end

function FountainFloor:draw()
    love.graphics.rectangle("fill", 0, 0, self.width, self.height)
end

return FountainFloor