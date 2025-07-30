local function genText(text, scale)
            scale = scale or 1

            local text_o = Game.world:spawnObject(DialogueText(text, 50, 50, 540, 500))
            text_o.skippable = false
            text_o:setScale(scale)
            text_o.parallax_x = 0
            text_o.parallax_y = 0
			text_o.alpha = 0
			text_o:setLayer(9999)
			text_o:addFX(OutlineFX(COLORS.black, {
				thickness = 2,
				amount = 4
			}))

			Game.world.timer:tween(1, text_o, { alpha = 1 }, "linear", function()
				Game.world.timer:after(2, function()
					Game.world.timer:tween(1, text_o, {alpha = 0 }, "linear", function()
						text_o:remove()
					end)
				end)
			end)

            return text_o
        end

return {
	talk_1 = function(script, chara)
		genText("[voice:susie]Jamm,[wait:5] seriously.[wait:10] Are you okay?", 1)
	end,
	
	talk_2 = function(script, chara)
		genText("[voice:jamm]I just feel...[wait:10] responsible for all this,[wait:5] you know?", 1)
	end,
	
	talk_3 = function(script, chara)
		if Game:getFlag("future_variable") == "ceroba_dw" then
			genText("[voice:ceroba]We're all responsible for this,[wait:5] you know.", 1)
		end
	end,
	
	talk_4 = function(script, chara)
		genText("[voice:susie]Yeah,[wait:5] and we're not going to get through this by crying about it.", 1)
	end,
	
	talk_5 = function(script, chara)
		genText("[voice:susie]We will go back in time and prevent this from happening.", 1)
	end,
	
	talk_6 = function(script, chara)
		genText("[voice:jamm]That's...[wait:10] that'll be nice.", 1)
	end,
	
	talk_7 = function(script, chara)
		genText("[voice:jamm]Thanks for having my back, you two.", 1)
	end,
	
	talk_8 = function(script, chara)
		if Game:getFlag("future_variable") == "ceroba_dw" then
			genText("[voice:ceroba]Is it just me,[wait:5] or is it starting to look bright?", 1)
		end
	end,
	
	talk_9 = function(script, chara)
		genText("[voice:jamm]No,[wait:5] " .. Game.party[3]:getName() .. ",[wait:5] I see it too!", 1)
	end,
}