local DeadHub, super = Class(Map)

function DeadHub:onEnter()
    super.onEnter(self)
    
	local layer = Game.world.map:getTileLayer("tile_hidden")
	
	if not Game:getFlag("broke_wall_future") then
		layer.visible = false
	else
		layer.visible = true
	end
	
    if Game.mapbackground then
		Game.mapbackground:remove()
	end
	
	self:getEvent(107):setActor(Mod:getVariableFuture(Game.party[3].id))
	
	if Game:getFlag("broke_wall_future") then
		self:getEvent(107):remove()
		self:getEvent(98):remove()
	end
end

return DeadHub