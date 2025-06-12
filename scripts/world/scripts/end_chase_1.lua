return function(script, chara)
	Game:setFlag("chase_checkpoint_1", true)
	if Game.world:getEvent(16) then
		Game.world:getEvent(16):walkToSpeed(2300, 600, 12)
	end
end