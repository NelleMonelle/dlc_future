local hospital_room, super = Class(Map)

function hospital_room:onEnter()
    super.onEnter(self)

	while #Game.world.followers > 2 do
		Game.world.followers[3]:remove()
		table.remove(Game.world.followers, 3)
	end
end

function hospital_room:onExit()
    super.onExit(self)
end

return hospital_room