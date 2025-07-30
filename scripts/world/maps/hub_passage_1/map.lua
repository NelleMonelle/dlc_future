local DeadHub, super = Class(Map)

function DeadHub:onEnter()
    super.onEnter(self)
    
	self.darkness = Game.stage:getObjects(DarknessOverlay)[1]
	
	if Game:getFlag("future_jamm_light") then
		for k,v in ipairs(Game.party) do
			if v.id == "jamm" then
				if k == 1 then
					Game.world.player.actor.default = "walk_thunder"
					Game.world.player:resetSprite()
				else
					Game.world.followers[k-1].actor.default = "walk_thunder"
					Game.world.followers[k-1]:resetSprite()
				end
			end
		end
	end
end

function DeadHub:update()
	if self.darkness and not self.darkness_override then
		local py = Game.world.player.y - 1300
		
		local dy = py / 700
		
		self.darkness.alpha = math.max(1 - dy, 0)
	elseif self.darkness_override then
		self.darkness.alpha = self.darkness_override
	end
end

return DeadHub