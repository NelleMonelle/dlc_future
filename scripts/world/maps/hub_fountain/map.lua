local DeadHub, super = Class(Map)

function DeadHub:onEnter()
    super.onEnter(self)
    
	if Game:getFlag("broke_wall_future") then
		self:getEvent(19):remove()
	end
end

return DeadHub