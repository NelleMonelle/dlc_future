return {
    sign1 = function(cutscene, event)
        if not Mod:incoherent(cutscene) then
			cutscene:text("* You have reached the point of no return.")
			cutscene:text("* Pray to any gods you may have.")
		end
    end,
	
    walk1 = function(cutscene, event)
        Game:setFlag("walk1_active", true)
		Game.world:getEvent(13):walkToSpeed("fmarcy_walkto", 8)
    end,
	
    walk2 = function(cutscene, event)
        Game:setFlag("walk2_active", true)
		Game.world:getEvent(7):walkToSpeed("fnoelle_walkto", 8)
    end,
	
    bg_convo = function(cutscene, event)
		local texts = {}
        local function genText(text, x, y, actor, scale, main, wait_time)
            scale = scale or 1
            wait_time = wait_time or 0.2

            local text_o = Game.world:spawnObject(DialogueText(text, x, y, 300, 500))
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
            table.insert(texts, text_o)

            cutscene:wait(wait_time)
			Game.world.timer:tween(1, text_o, { x = x + 15, alpha = 1 }, "linear", function()
				Game.world.timer:after(2.5, function()
					
					Game.world.timer:tween(1, text_o, {alpha = 0 }, "linear", function()
					end)
				end)
			end)

            return text_o
        end
		
        Game:setFlag("bg_convo", true)
		cutscene:enableMovement()
		
		genText("So, you saw them too, right?", 50, 50, "fmarcy")	-- Marcy
		cutscene:wait(5)
		genText("The outsiders? Y-yeah, I saw them...", 300, 50, "fnoelle")	-- Noelle
		cutscene:wait(5)
		genText("But they seem... familiar, somehow.", 300, 50, "fnoelle")	-- Noelle
		cutscene:wait(5)
		genText("Agreed. So what do we do?", 50, 50, "fmarcy")	-- Marcy
		cutscene:wait(5)
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			genText("Can't we just leave them be?", 175, 50)	-- Kanako
			cutscene:wait(5)
			genText("Negative. Remember what happened last time.", 50, 50, "fmarcy")	-- Marcy
			cutscene:wait(5)
		end
		genText("Maybe we could wait to see what happens?", 300, 50)	-- Noelle
		cutscene:wait(5)
		genText("We don't know if they're malicious.", 300, 50, "fnoelle")	-- Noelle
		cutscene:wait(5)
		genText("...Probably for the best to do that.", 50, 50, "fmarcy")	-- Marcy
		cutscene:wait(5)
    end
}
