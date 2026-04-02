local KnightSpark, super = Class(Object)

function KnightSpark:init(x, y)
    super.init(self, x, y)
	
    self.sprite = Sprite("battle/effects/knight/spark")
    self.sprite:setFrame(love.math.random(1, 3))
    self.sprite:setScale(Utils.pick{-1, 1})
    self.sprite:setColor(COLORS.white)
    self.sprite.rotation = math.rad(Utils.random(360))
    self:addChild(self.sprite)

    self.life = 2
end

function KnightSpark:update()
    super.update(self)

    self.life = self.life - DTMULT
	
    if self.life == 0 then
        self:remove()
    end
end

return KnightSpark