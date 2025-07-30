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
	
	if Game:getFlag("future_jamm_light") then
		for k,v in ipairs(Game.party) do
			if v.id == "jamm" then
				if k == 1 then
					Game.world.player.actor.default = "walk_serious"
					Game.world.player:resetSprite()
				else
					Game.world.followers[k-1].actor.default = "walk_serious"
					Game.world.followers[k-1]:resetSprite()
				end
			end
		end
	end
end

return DeadHub