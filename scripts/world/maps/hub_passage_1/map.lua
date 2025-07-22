local DeadHub, super = Class(Map)

function DeadHub:onEnter()
    super.onEnter(self)
    
	self.darkness = Game.stage:getObjects(DarknessOverlay)[1]
end

function DeadHub:update()
	if self.darkness and not self.darkness_override then
		local py = Game.world.player.y - 1300
		
		local dy = py / 700
		
		Kristal.Console:log(py)
		Kristal.Console:log(dy)
		
		self.darkness.alpha = math.max(1 - dy, 0)
	elseif self.darkness_override then
		self.darkness.alpha = self.darkness_override
	end
end

return DeadHub