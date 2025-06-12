local DeadMap, super = Class(Map)

function DeadMap:onEnter()
    super.onEnter(self)
    if not Game.mapbackground then
		Game.mapbackground = GonerBackground()
		Game.stage:addChild(Game.mapbackground)
		Game.mapbackground:setLayer(Game.world.layer - 1)
	end
	if self:getEvent(19) then
		self:getEvent(19).sprite.color = {0,0,0}
	end
end

return DeadMap