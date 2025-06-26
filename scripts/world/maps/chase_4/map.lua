local DeadMap, super = Class(Map)

function DeadMap:init(world, data)
	super.init(self, world, data)
	
	if not Game:getFlag("future_chase_one") then
		self.music = "creepychase"
	end
end

function DeadMap:onEnter()
    super.onEnter(self)
	
	if not Game:getFlag("future_chase_one") then
		if Game.world.followers[2] then
			Game.world.followers[2]:remove()
		end
		if Game.world.followers[1] then
			Game.world.followers[1]:remove()
		end
		self:getEvent(13):setActor(Game:getFlag("future_variable"))
		self:getEvent(16):setActor(Mod:getVariableFuture(Game.party[3].id))
		
		self.music = "creepychase"
	end
end

return DeadMap