local Player, super = HookSystem.hookScript(Player)

function Player:init(chara, x, y)
    super.init(self, chara, x, y)
	self.state_manager:addState("CLIMBSLIP", {enter = self.beginClimbSlip, leave = self.endClimbSlip, update = self.updateClimbSlip})
	self.faceslip = nil
	self.slippery = nil
	self.loc_x = self.x
	self.ind_x = 1
    self.slip_dust_timer = 0
end

function Player:beginClimbSlip(last_state)
	if self.world.map.cyltower then
		self.onrotatingtower = true
		self.falseloop = true
		self.falseloopx = {}
		self.falseloopx[1] = 0
		self.falseloopx[2] = self.world.map.cyltower.tower_circumference
		self.world.camera:setState("STATIC")
	end
	self.slide_sound:setVolume(0.6)
    self.slide_sound:setPitch(1.5)
    self.slide_sound:play()
	self.faceslip = ((self.facing == "left") and -1) or 1
	self:setSprite("climb/climb")
	self.loc_x = self.x
	self.ind_x = 1
end

function Player:endClimbSlip(next_state)
    self.slide_sound:stop()
	self.slide_sound:setVolume(1)
    self.slide_sound:setPitch(1)
	local colliding = false
	for k,v in ipairs(Game.world:getEvents("climbarea")) do
		if self.collider:collidesWith(v.collider) then
			colliding = true
		end
	end
	
	if not colliding then
		Assets.playSound("motor_upper_2", 0.6, 1.2)
		self.falldir = "down"
		self.falling = 1
		self.fallingtimer = 8
		self.cancel = 1
	end
end

function Player:updateClimbSlip()
	self.x = self.x + (8 * self.faceslip) * DTMULT
	if self.falseloop then
		self.x = MathUtils.wrap(self.x, self.falseloopx[1], self.falseloopx[2])
	end
	
	if self.faceslip > 0 then
		if self.x >= self.loc_x + (self.ind_x * 40) then
			if not self.collider:collidesWith(self.slippery.collider) then
				self.x = self.loc_x + (self.ind_x * 40)
				self:setState("CLIMB")
			else
				self.ind_x = self.ind_x + 1
			end
		end
	else
		if self.x <= self.loc_x - (self.ind_x * 40) then
			if not self.collider:collidesWith(self.slippery.collider) then
				self.x = self.loc_x - (self.ind_x * 40)
				self:setState("CLIMB")
			else
				self.ind_x = self.ind_x + 1
			end
		end
	end
    self:updateClimbSlipDust()
end

function Player:updateClimbSlipDust()
    self.slip_dust_timer = MathUtils.approach(self.slip_dust_timer, 0, DTMULT)
    if self.slip_dust_timer == 0 then
        self.slip_dust_timer = 3

		local dust = Sprite("effects/climb_dust_small")
		dust:play(1 / 15, false, function() dust:remove() end)
		dust:setOrigin(0.5, 0)
		dust:setScale(2, 2)
		local dust_x = self.x
		local dust_y = self.y - 24 + MathUtils.random(-4, 4)
		if self.onrotatingtower then
			dust_x = self.world.map.cyltower.tower_x
			dust.physics.speed_x = -8 * self.faceslip
		end
		dust:setPosition(dust_x, dust_y)
		dust.layer = self.layer - 0.01
		dust.physics.speed_y = -1
		self.world:addChild(dust)
	end
end

function Player:getDebugInfo()
    local info = super.getDebugInfo(self)
    table.insert(info, "loc_x: " .. self.loc_x)
    table.insert(info, "ind_x: " .. self.ind_x)
    table.insert(info, "placement: " .. (self.loc_x * self.ind_x))
    return info
end

return Player