local DeadHub, super = Class(Map)

function DeadHub:onEnter()
    super.onEnter(self)
    
	self.darkness = Game.stage:getObjects(DarknessOverlay)[1]
end

function DeadHub:update()
	if self.darkness then
		local py = Game.world.player.y
		
		local dy = py / 2400
		
		self.darkness.alpha = math.max(dy, 0)
	end
end

return DeadHub