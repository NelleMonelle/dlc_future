local Player, super = HookSystem.hookScript(Player)

function Player:init(chara, x, y)
    super.init(self, chara, x, y)
	self.state_manager:addState("CLIMBSLIP", {enter = self.beginClimbSlip, leave = self.endClimbSlip, update = self.updateClimbSlip})
	self.faceslip = nil
	self.slippery = nil
	self.loc_x = self.x
	self.ind_x = 1
end

function Player:beginClimbSlip(last_state)
	self.faceslip = ((self.facing == "left") and -1) or 1
	self:setSprite("climb/climb")
	self.loc_x = self.x
	self.ind_x = 1
end

function Player:endClimbSlip(next_state)
	local colliding = false
	for k,v in ipairs(Game.world:getEvents("climbarea")) do
		if self.collider:collidesWith(v.collider) then
			colliding = true
		end
	end
	
	if not colliding then
		self.falldir = "down"
		self.falling = 1
		self.fallingtimer = 8
		self.cancel = 1
	end
end

function Player:updateClimbSlip()
	self.x = self.x + (DT * 80 * self.faceslip)
	
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
end

function Player:getDebugInfo()
    local info = super.getDebugInfo(self)
    table.insert(info, "loc_x: " .. self.loc_x)
    table.insert(info, "ind_x: " .. self.ind_x)
    table.insert(info, "placement: " .. (self.loc_x * self.ind_x))
    return info
end

return Player