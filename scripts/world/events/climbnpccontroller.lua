local ClimbNPCController, super = Class(Event)

function ClimbNPCController:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
    self.dir = properties["dir"] or "up"
    self.waitevent = properties["waitevent"] or 0
    self.forcejump = properties["forcejump"] or 0
    self.reach = properties["reach"] or 0
    self.climbid = properties["climbid"] or -99
    self.deactivate = properties["deactivate"] or false
    self.activate_type = properties["type"] or nil
end

function ClimbNPCController:onEnter(chara)
	if self.activate_type == "npc" then return end
    if chara.is_player and Game.world.player.state == "CLIMB" then
		for _, climbnpccon in ipairs(Game.world.map:getEvents("climbnpccontroller")) do
			if climbnpccon.waitevent == self.waitevent and climbnpccon.deactivate then
				climbnpccon:remove()
			end
		end
		for _, climbnpc in ipairs(Game.stage:getObjects(ClimbPartyNPC)) do
			if climbnpc.waiteventid == self.waitevent and (climbnpc.climb_id == self.climbid or self.climbid == -99) then
				climbnpc.waiteventid = 0
			end
		end
	end
end

function ClimbNPCController:update()
	super.update(self)
	if self.activate_type == "player" then return end
	Object.startCache()
	for _, climbnpc in ipairs(Game.stage:getObjects(ClimbPartyNPC)) do
        if self:collidesWith(climbnpc) then
			if climbnpc.climb_id == self.climbid or self.climbid == -99 then
				if self.waitevent > 0 then
					climbnpc.waiteventid = self.waitevent
				end
				if self.forcejump > 0 then
					climbnpc.forcejump = self.forcejump
				end
				if self.reach then
					climbnpc.reachcon = self.reach
				end
				climbnpc.facing = self.dir
				if self.waitevent == -99 then
					Assets.playSound("wing")
					self:remove()
				end
				if self.deactivate then
					self:remove()
				end
				break
			end
        end
	end
	Object.endCache()
end

function ClimbNPCController:getDebugRectangle()
    return {-5, -5, 10, 10}
end

return ClimbNPCController