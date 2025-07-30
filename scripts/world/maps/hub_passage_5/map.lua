local DeadHub, super = Class(Map)

function DeadHub:onEnter()
    super.onEnter(self)
	
	for k,v in ipairs(Game.party) do
		if v.id == "jamm" then
			if k == 1 then
				Game.world.player.actor.default = "walk_thunder"
				Game.world.player:resetSprite()
			else
				Game.world.followers[k-1].actor.default = "walk_thunder"
				Game.world.followers[k-1]:resetSprite()
			end
		end
	end
end

return DeadHub