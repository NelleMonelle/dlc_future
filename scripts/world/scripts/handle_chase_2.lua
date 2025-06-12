return function(script, chara)
	Game:setFlag("future_chase_spikes", true)
	Game.world:setBattle(true)
	local jamm = Game.world:getEvent(21)
	Game.world.timer:after(10, function()
		jamm:walkToSpeed("jamm_runto_1", 8, nil, nil, function()
			jamm:walkToSpeed("jamm_runto_2", 8, nil, nil, function()
				Game.world:getEvent(13):setLayer(Game.world:getEvent(21).layer - 0.01)
				Assets.playSound("mario_jump")
				Assets.playSound("mario_jump")
				jamm:jumpTo(140, 460, 20, 0.5, "mjump_down", "mjump_prep")
				Game.world.timer:after(0.6, function()
					Game.world:setBattle(false)
					Assets.playSound("mario_bounce")
					Assets.playSound("mario_bounce")
					local ml_sprite
					if Game:getFlag("FUN") == 17 then
						ml_sprite = Sprite("effects/lucky")
					else
						ml_sprite = Sprite("effects/good")
					end
					ml_sprite:setOrigin(0.5, 0.5)
					ml_sprite:setScale(2, 2)
					ml_sprite.x = jamm.x + 60
					ml_sprite.y = jamm.y - 60
					ml_sprite:setLayer(jamm.layer + 0.01)
					Game.world:addChild(ml_sprite)
					Game:setFlag("chase_checkpoint_2", true)
					jamm:jumpTo(140, 620, 20, 0.5, "mjump_down", "mjump_prep")
					Game.world.timer:after(0.6, function()
						if jamm then
							jamm:walkToSpeed("jamm_runto_3", 12, nil, nil, function()
								if jamm then
									Game.world.timer:tween(1, ml_sprite, {alpha = 0})
									jamm:walkToSpeed("jamm_runto_4", 12)
								end
							end)
						end
					end)
				end)
			end)
		end)
	end)
end