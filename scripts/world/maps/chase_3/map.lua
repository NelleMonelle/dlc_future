local DeadMap, super = Class(Map)

function DeadMap:onEnter()
    super.onEnter(self)
    if Game.world.followers[2] then
		Game.world.followers[2]:remove()
	end
    if Game.world.followers[1] then
		Game.world.followers[1]:remove()
	end
	
	if Game:getFlag("future_variable") == "ceroba_dw" then
		Game.world:spawnBullet("flower_big", 400, 260)
		
		self.timer:everyInstant(0.9, function()
			if self.world:inBattle() and not Game:getFlag("chase_checkpoint_3") then
				Assets.playSound("ceroba_bullet_shot")
				local ran = love.math.random(30)
				for i=1, 12 do
					self.world:spawnBullet("flower_small", 400, 260, math.rad((30 * i) + ran))
				end
			end
		end)
	end
	
	Game:setFlag("future_post_looney_toons", true)
	
	if self:getEvent(9) then	-- The existence of Jamm's event implies the existence of F!Noelle's.
		self:getEvent(10).sprite.color = {0,0,0}
		self:getEvent(9):walkToSpeed(840, 600, 12)
		self:getEvent(10):walkToSpeed(840, 600, 16)
	end
end

return DeadMap