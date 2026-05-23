local KnightParticleGeneric, super = Class(Sprite)

function KnightParticleGeneric:init(x, y)
    super.init(self, "effects/pixel_white", x, y)
	
	self.fade_rate = 0
	self.shrink_rate = 0
	self.timer = -1
end

function KnightParticleGeneric:update()
    super.update(self)

	if self.fade_rate ~= 0 then
		self.alpha = MathUtils.approach(self.alpha, 0, self.fade_rate * DTMULT)
	end
	if self.shrink_rate ~= 0 then
		self.scale_x = MathUtils.approach(self.scale_x, 0, self.shrink_rate * DTMULT)
		self.scale_y = MathUtils.approach(self.scale_y, 0, self.shrink_rate * DTMULT)
	end
	if self.scale_x == 0 or self.scale_y == 0 then
		self:remove()
	end
	if self.alpha == 0 then
		self:remove()
	end
	if self.timer ~= -1 then
		self.timer = self.timer - DTMULT
		if self.timer <= 0 then
			self:remove()
		end
	end
	local cx, cy = Game.world.camera.x - SCREEN_WIDTH / 2, Game.world.camera.y - SCREEN_HEIGHT / 2
	if self.x < cx - 4 * self.scale_x or self.y < cy - 4 * self.scale_y or self.x > cx + SCREEN_WIDTH + 4 * self.scale_x or self.y > cy + SCREEN_HEIGHT + 4 * self.scale_y then
        self:remove()
    end
end

return KnightParticleGeneric