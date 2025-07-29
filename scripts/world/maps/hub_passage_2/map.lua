local DeadHub, super = Class(Map)

function DeadHub:onEnter()
    super.onEnter(self)
    
	if self:getEvent(14) then
		local ls = LightSource(self:getEvent(14).width/2, self:getEvent(14).height/2, 100)
		ls.color = {1, 0.25, 0.25}
		self:getEvent(14):addChild(ls)
	end
end

return DeadHub