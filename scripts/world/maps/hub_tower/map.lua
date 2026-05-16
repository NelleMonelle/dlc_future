local DeadHubTower, super = Class(Map)

function DeadHubTower:onEnter()
    super.onEnter(self)
    
	self.world.camera:setBounds(0, 50, self.width * self.tile_width, 60 * self.tile_height)
	self.darkness = Game.stage:getObjects(DarknessOverlay)[1]
	for _, trans in ipairs(Game.world.map:getEvents("transition")) do
		trans.collider.collidable = false
	end
	self.world.player.forceclimb = true
	Game.world.timer:after(25/30, function()
		self.world.player.forceclimb = false
		for _, trans in ipairs(Game.world.map:getEvents("transition")) do
			trans.collider.collidable = true
		end
	end)
	if Game:getFlag("towerSpawnClimbParty", false) then
		Game.world.map:spawnClimbingParty(false)
	end
end

function DeadHubTower:onExit()
	if self.susie_climber then
		Game:setFlag("towerSusieX", self.susie_climber.x)
		Game:setFlag("towerSusieY", self.susie_climber.y)
		Game:setFlag("towerSusieDir", self.susie_climber.facing)
		Game:setFlag("towerSusieWaitEvent", self.susie_climber.waiteventid)
	end
	if self.variable_climber then
		Game:setFlag("towerVariableX", self.variable_climber.x)
		Game:setFlag("towerVariableY", self.variable_climber.y)
		Game:setFlag("towerVariableDir", self.variable_climber.facing)
		Game:setFlag("towerVariableWaitEvent", self.variable_climber.waiteventid)
	end
	self.world.camera:setBounds()
end

function DeadHubTower:spawnClimbingParty(first)
	local mx, my = self:getMarker("susie")
	if not first then
		mx = Game:getFlag("towerSusieX", mx)
		my = Game:getFlag("towerSusieY", my)
	end
	self.susie_climber = Game.world:spawnObject(ClimbPartyNPC("susie", mx, my, 1))
	self.susie_climber.layer = self.cyltower.layer + 0.1
	if not first then
		self.susie_climber.facing = Game:getFlag("towerSusieDir", "up")
		self.susie_climber.waiteventid = Game:getFlag("towerSusieWaitEvent", 0)
	end
	mx, my = self:getMarker("variable")
	if not first then
		mx = Game:getFlag("towerVariableX", mx)
		my = Game:getFlag("towerVariableY", my)
	end
	self.variable_climber = Game.world:spawnObject(ClimbPartyNPC(Game:getFlag("future_variable"), mx, my, 2))
	self.variable_climber.layer = self.cyltower.layer + 0.1
	if not first then
		self.variable_climber.facing = Game:getFlag("towerVariableDir", "up")
		self.variable_climber.waiteventid = Game:getFlag("towerVariableWaitEvent", 0)
	end
end

function DeadHubTower:update()
	if self.darkness then
		local py = Game.world.player.y - 50
		
		local dy = py / 2400
		
		self.darkness.alpha = math.max(dy, 0)
	end
end

return DeadHubTower