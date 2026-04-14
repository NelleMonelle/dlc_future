local FrostcryptContoller, super = Class(Object)

function FrostcryptContoller:init(x, y, callback)
    super.init(self, x, y)

	self.callback = callback
	self.rotation_adder = 3
	self.snowflakes_spawned = 0
	self.snowflake_timer = 0
	self.wait_timer = 0
	self.explosion_happened = false
	self.state = 1 -- 1 - snowflake summon, 2 - wait, 3 - boom

	self.snowflake_big = Sprite("effects/icespell/snowflake", 0, 0)
	self.snowflake_big:setOrigin(0.5)
	self.snowflake_big:setScale(0)
	self.snowflake_big.layer = self.snowflake_big.layer + 1
	self:addChild(self.snowflake_big)
	self.snowflake_big:fadeTo(1, 0.5)
	Game.battle.timer:tween(1.5, self.snowflake_big, {scale_x = 2.5, scale_y = 2.5})

	Assets.playSound("titan_absorb", 1.5, 0.8)
end

function FrostcryptContoller:boomSnowflake(dir)
	local snowflake = Sprite("effects/icespell/snowflake", 0, 0)
	snowflake:setOrigin(0.5)
	snowflake:setScale(1)
	self:addChild(snowflake)
	snowflake.physics.direction = math.rad(dir)
	snowflake.physics.speed = 30
	snowflake.physics.friction = 0.25
end

function FrostcryptContoller:snowflake(x, y)
	self.snowflakes_spawned = self.snowflakes_spawned + 1
	local snowflake = Sprite("effects/icespell/snowflake", x, y)
	snowflake:setOrigin(0.5)
	snowflake:setScale(0)
	snowflake.alpha = 0
	snowflake.rotation = math.rad(MathUtils.random(360))
	self:addChild(snowflake)
	Game.battle.timer:tween(1, snowflake, {scale_x = 1, scale_y = 1, alpha = 1, rotation = (snowflake.rotation + math.rad(180)), x = 0, y = 0})
	Game.battle.timer:after(1, function() snowflake:remove() end)
end

function FrostcryptContoller:onExplosion()
	self.explosion_happened = true
	self.snowflake_big:flash()
	Game.battle.timer:tween(0.5, self.snowflake_big, {scale_x = 0, scale_y = 0, alpha = 0, rotation = (self.snowflake_big.rotation + math.rad(180))})
	Assets.playSound("scytheburst")
	local snowflakes_total = 8
	for i = 1, snowflakes_total do
		self:boomSnowflake(360*(i/snowflakes_total))
	end
	if self.callback then
		self.callback()
	end
end

function FrostcryptContoller:update()
	self.snowflake_big.rotation = self.snowflake_big.rotation + math.rad(self.rotation_adder) * DTMULT

	if self.state == 1 then
		self.rotation_adder = MathUtils.approach(self.rotation_adder, 5, 0.25*DTMULT)
		self.snowflake_timer = self.snowflake_timer + DTMULT
	elseif self.state == 2 then
		self.rotation_adder = MathUtils.approach(self.rotation_adder, 0, 0.15*DTMULT)
		if self.rotation_adder == 0 then
			self.state = 3
		end
	elseif self.state == 3 then
		if not self.explosion_happened then
			self:onExplosion()
		end
		self.wait_timer = self.wait_timer + DTMULT
		if self.wait_timer >= 30 then
			self:remove()
		end
	end

	if self.snowflake_timer >= 2 then
		if self.snowflakes_spawned < 20 then
			self.snowflake_timer = 0
			local dir = MathUtils.random(360)
            local dist = 140 + MathUtils.randomInt(90 + 1)
			self:snowflake(MathUtils.lengthDirX(dist, dir), MathUtils.lengthDirY(dist, dir))
		else
			if self.state == 1 then
				self.state = 2
			end
		end
	end

	super.update(self)
end

return FrostcryptContoller