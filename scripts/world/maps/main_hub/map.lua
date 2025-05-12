local DeadHub, super = Class(Map)

function DeadHub:onEnter()
    super.onEnter(self)
    
	local layer = Game.world.map:getTileLayer("tile_hidden")
	
	if not Game:getFlag("broke_wall_future") then
		layer.visible = false
	else
		layer.visible = true
	end
end

return DeadHub