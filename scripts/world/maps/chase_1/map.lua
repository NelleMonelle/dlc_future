local DeadMap, super = Class(Map)

function DeadMap:onEnter()
    super.onEnter(self)
    if Game.world.followers[2] then
		Game.world.followers[2]:remove()
	end
    if Game.world.followers[1] then
		Game.world.followers[1]:remove()
	end
	if self:getEvent(16) then
		self:getEvent(16).sprite.color = {0,0,0}
	end
	self.timer:every(0.9, function()
        if self.world:inBattle() and not Game:getFlag("chase_checkpoint_1") then
            self.world:spawnBullet("scythe_fmarcy", Game.world.soul.x + 290, Game.world.soul.y)
        end
    end)
end

return DeadMap