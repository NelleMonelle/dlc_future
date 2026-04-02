local KnightBlockVFX, super = Class(Object)

function KnightBlockVFX:init(x, y)
    super.init(self, x, y)
	
    self.sprite = Sprite("battle/effects/knight/block_vfx")
    self.sprite:setScale(1.3)
    self.sprite:setScaleOrigin(0.5)
    self:addChild(self.sprite)
    self.sprite:play(1/25, false, function() self:remove() end)

    self.x = x + (-6 + Utils.random(12))
    self.y = y + (-6 + Utils.random(12))
	
    self.debug_select = true

    self.anim_speed = 0
end

function KnightBlockVFX:update()
    super.update(self)
	
    if self.physics.speed_y < 0 then
        self.physics.speed_y = self.physics.speed_y + 0.4 * DTMULT
    end
    if self.physics.speed_y > 0 then
        self.physics.speed_y = self.physics.speed_y - 0.4 * DTMULT
    end
	
    if self.sprite.frame == 3 then
        self.sprite.layer = self.sprite.layer + 1
    end
    if self.sprite.frame == 2 then
        self.sprite:setScale(1)
    end
end

return KnightBlockVFX