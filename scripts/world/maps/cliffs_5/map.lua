local DeadMap, super = Class(Map)

function DeadMap:update()
    super.update(self)
    if Game.world.cutscene then
		if Game.world.player.x < 640 then
			self.world:detachFollowers()
			Game.world.player.x = Game.world.player.x + 640
			for _, follower in ipairs(Game.world.followers) do
				follower.x = follower.x + 640
			end
			self.world.player:interpolateFollowers()
			self.world:attachFollowers()
		end
		if Game.world.player.x > 1920 then
			self.world:detachFollowers()
			Game.world.player.x = Game.world.player.x - 640
			for _, follower in ipairs(Game.world.followers) do
				follower.x = follower.x - 640
			end
			self.world.player:interpolateFollowers()
			self.world:attachFollowers()
		end
	end
end

return DeadMap