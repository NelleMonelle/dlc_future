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
end

function DeadHubTower:onExit()
	self.world.camera:setBounds()
end

function DeadHubTower:update()
	if self.darkness then
		local py = Game.world.player.y - 50
		
		local dy = py / 2400
		
		self.darkness.alpha = math.max(dy, 0)
	end
end

return DeadHubTower