local DeadMap, super = Class(Map)

function DeadMap:onEnter()
    super.onEnter(self)
    if not Game.mapbackground then
		Game.mapbackground = GonerBackground()
		Game.stage:addChild(Game.mapbackground)
		Game.mapbackground:setLayer(Game.world.layer - 1)
	end
end

return DeadMap