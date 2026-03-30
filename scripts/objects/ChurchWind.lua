local GMGraphics = modRequire('libraries.gmutils.src.utils.GMGraphics')

---@class ChurchWind : Object
local ChurchWind, super = Class(Object)

function ChurchWind:init(x, y)
    super.init(self)

    self:setParallax(0)
    self:setLayer(WORLD_LAYERS["below_ui"])

    self.timer = 0
    self.con = 1
    self.windspeed = 10
    self.wind_y = 0
    self.alpha = 0
end

function ChurchWind:draw()
    super.draw(self)

    if self.con == 0 then
        if self.alpha > 0 then
            self.alpha = self.alpha - 0.02 * DTMULT
        end
    end

    if self.con == 1 then
        if self.alpha < 0.45 then
            self.alpha = self.alpha + 0.05 * DTMULT
        end
    end

    for i = 1, self.windspeed do
        self.wind_y = self.wind_y + 2 * DTMULT
    
        if self.wind_y > -416 then
            self.wind_y = self.wind_y - 416
        end
    end

    love.graphics.push()
    Ch4Lib.setBlendState("add", "srcalpha", "one")
    GMGraphics.drawSpriteTiledExt(Assets.getFramesOrTexture("effects/church_wind"), 0, 0, self.wind_y, 4, 4, COLORS.red, self.alpha)
    Ch4Lib.setBlendState("add", "srcalpha", "oneminussrcalpha")
    love.graphics.setBlendMode("alpha", "alphamultiply")
    love.graphics.pop()
end

return ChurchWind