local Part, super = Class(Object)

function Part:init(x, y, distance)
    super.init(self, x, y)
	
	self.distance = distance or 10
	
    self.sprite = Sprite("enemies/roaring_eye", -distance, 0)
	self.sprite:setOrigin(0.5, 0.5)
	
	self.target = nil
	
	self:addChild(self.sprite)
end

function Part:update()
    super.update(self)
	
	self.sprite.rotation = self.sprite.rotation + (DTMULT/40)
	
	if self.target then
		local sx, sy = self:localToScreenPos(self.x, self.y)
		local angle = Utils.angle(sx,sy, self.target.x,self.target.y)
		self.sprite.x = math.cos(angle) * self.distance
		self.sprite.y = math.sin(angle) * self.distance
	end
end

return Part