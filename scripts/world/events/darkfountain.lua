--- Creates a Dark Fountain as it appears in the fountain sealing sequences. \
--- `DarkFountain` is an [`Event`](lua://Event.init) - naming an object `darkfountain` on an `objects` layer in a map creates this object. \
--- The Dark Fountain is 6 tiles in width - to position it correctly in a map, use a Point object and place it where the bottom-center of the fountain should be. \
--- For the full fountain effect, the Dark Fountain should be accompanied by [`FountainShadowController`](lua://FountainShadowController.init) and [`FountainFloor`](lua://FountainFloor.init)
---
---@class DarkFountain : Event
---
---@field width             integer
---@field height            integer
---
---@field bg_texture        love.Image
---@field edge_texture      love.Image
---@field bottom_texture    love.Image
---
---@field mask_fx           MaskFX
---@
---@field siner             number      Timer for fountain's color change effects
---@field bg_siner          number
---@field hscroll           number
---@field eyebody           number
---@field adjust            integer     (Probably set in fountain cutscenes to change the effect of the fountain)
---@field slowdown          number
---@field bg_color          [number, number, number]    Second color in the fountain, also used by [`FountainFloor`](lua://FountainFloor.init) if present
---
---@overload fun(...) : DarkFountain
local DarkFountain, super = Class(Event)

function DarkFountain:init(x, y)
    super.init(self, x, y)

    self:setOrigin(0.5, 1)

    self.width = 120 * 2
    self.height = 280 * 2

    self.bg_texture = Assets.getTexture("world/events/darkfountain/bg")
    self.edge_texture = Assets.getTexture("world/events/darkfountain/edge")
    self.bottom_texture = Assets.getTexture("world/events/darkfountain/bottom")

    -- Use the DarkFountain:drawMask() function to mask the fountain
    self.mask_fx = self:addFX(MaskFX(self))

    self.siner = 0
    self.bg_siner = 0
    self.hscroll = 0
    self.eyebody = 1 -- And this ??
    self.adjust = 0 -- Idk where this gets set
    self.slowdown = 0
    self.bg_color = {0.9, 0.9, 0.9}
end

function DarkFountain:update()
    super.update(self)
end

function DarkFountain:draw()
    local color = {0.9, 0.9, 0.9, 1}

    Draw.setColor(self.bg_color)
    love.graphics.rectangle("fill", 1, 1, self.width-2, self.height-2)
    Draw.setColor(color, 0.7 * self.eyebody)
    Draw.drawWrapped(self.bg_texture, true, true, -self.siner, -self.siner, 0, 2, 2)
    Draw.setColor(color, 0.3 * self.eyebody)
    Draw.drawWrapped(self.bg_texture, true, true, self.hscroll - 240, self.siner, 0, 2, 2)
    Draw.setColor(0, 0, 0)
    love.graphics.rectangle("fill", -100, 0, 120, self.height)
    love.graphics.rectangle("fill", self.width - 20, 0, 120, self.height)
    Draw.setColor(color, 1)
    Draw.drawWrapped(self.edge_texture, false, true, 20, self.height - (self.bg_siner * 280) / 7, 0, 2, 2)
    Draw.setColor(color, 0.5)
    Draw.drawWrapped(self.edge_texture, false, true, 20 + math.sin(self.siner / 16) * 12, self.height - (self.bg_siner * 280) / 7, 0, 2, 2)
    Draw.drawWrapped(self.edge_texture, false, true, 20 - math.sin(self.siner / 16) * 12, self.height - (self.bg_siner * 280) / 7, 0, 2, 2)
    Draw.setColor(color, 0.3)
    Draw.draw(self.bottom_texture, 0, self.height - 280 - 8 + (math.sin(self.siner / 16) * 8), 0, 2, 2)
    Draw.setColor(color, 0.5)
    Draw.draw(self.bottom_texture, 0, self.height - 280 - 4 + (math.sin(self.siner / 16) * 4), 0, 2, 2)
    Draw.setColor(color, 1)
    Draw.draw(self.bottom_texture, 0, self.height - 280, 0, 2, 2)

    super.draw(self)
end

function DarkFountain:drawMask()
    Draw.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 0, 0, self.width, self.height)
end

return DarkFountain