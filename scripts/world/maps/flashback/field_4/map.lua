local DeadMap, super = Class(Map)

function DeadMap:init(world, data)
	super.init(self, world, data)
	
	self.knife_time = 0
	self.knife_state = "SINGLES"	-- SINGLES, ROWS
	self.knife_state_uses = 0
	
	self.knife_max = love.math.random(5, 8)
end

function DeadMap:update()
    super.update(self)
    
	if Game.world.player.state_manager.state == "WINDWALK" then
		self.knife_time = self.knife_time + DT
		
		if self.knife_state == "SINGLES" then
			if self.knife_time >= 0.3 then
				self.knife_time = self.knife_time - 0.3
				
				local x = love.math.random(90, 550)
				
				self.world:spawnBullet("KnightDagger", x, 90, "down", 1)
				
				self.knife_state_uses = self.knife_state_uses + 1
				
				if self.knife_state_uses == self.knife_max then
					self.knife_state = "ROWS"
					
					self.knife_max = love.math.random(2, 4)
					
					self.knife_state_uses = 0
				end
			end
		elseif self.knife_state == "ROWS" then
			if self.knife_time >= 0.9 then
				self.knife_time = self.knife_time - 0.9
				
				local knife_count = love.math.random(5, 7)
				
				local x = love.math.random(90, 590 - (40 * knife_count))
				
				for i=1, knife_count do
					self.world:spawnBullet("KnightDagger", x + (40 * (i-1)), 90, "down", 1.2)
				end
				
				self.knife_state_uses = self.knife_state_uses + 1
				
				if self.knife_state_uses == self.knife_max then
					self.knife_state = "SINGLES"
					
					self.knife_max = love.math.random(5, 8)
					
					self.knife_state_uses = 0
				end
			end
		end
	end
end

return DeadMap