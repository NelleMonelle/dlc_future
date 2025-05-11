local DeadMap, super = Class(Map)

function DeadMap:onEnter()
    super.onEnter(self)
    if self:getEvent(7) then
		self:getEvent(7).sprite.color = {0,0,0}
	end
end

return DeadMap