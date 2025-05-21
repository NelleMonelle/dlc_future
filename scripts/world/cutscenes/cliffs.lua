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
    end,
	
    monster	= function(cutscene, event)
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
		
        local jamm = cutscene:getCharacter("jamm")
		local susie = cutscene:getCharacter("susie")
		local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
		
		cutscene:detachFollowers()
		cutscene:detachCamera()
		
		cutscene:panTo(680, 960, 1)
		cutscene:walkTo(susie, "susie_walkto", 1)
        cutscene:walkTo(jamm, "jamm_walkto", 1)
        cutscene:wait(cutscene:walkTo(variant, "variant_walkto", 1))
		
		cutscene:showNametag("Jamm")
		cutscene:text("* Guys,[wait:5] I'm getting a very bad feeling about this place.", "nervous", "jamm")
		cutscene:look(susie, "down")
		cutscene:showNametag("Susie")
		cutscene:text("* Me too.[wait:10] Like,[wait:5] god damn it,[wait:5] Jamm,[wait:5] where the hell are we!?", "annoyed", "susie")
		cutscene:look(jamm, "up")
		cutscene:showNametag("Jamm")
		cutscene:text("* It's not my fault![wait:10]\n* That rift sucked me in too!", "determined", "jamm")
		cutscene:showNametag("Susie")
		cutscene:text("* You were the one who touched it in the first place!", "angry", "susie")
		cutscene:showNametag("Jamm")
		cutscene:text("* Oh,[wait:5] don't act like you wouldn't have--", "furious", "jamm", {auto=true, skip=false})
		cutscene:look(susie, "left")
		cutscene:look(jamm, "left")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* Is this really worth fighting over right now?", "default", "ceroba")
		end
		cutscene:showNametag("Susie")
		cutscene:text("* ...Yeah.[wait:5] You're right, " .. Game.party[3].name .. ".", "shy_down", "susie")
		cutscene:showNametag("Jamm")
		cutscene:text("* Yeah,[wait:5] sorry.[wait:10] I'm just...[wait:10] really stressed right now.", "shaded_frown", "jamm")
		cutscene:text("* Let's just keep going,[wait:5] alright?", "neutral", "jamm")
		cutscene:text("* If there was a way here,[wait:5] there should be a way home too.", "side_smile", "jamm")
		cutscene:look(susie, "down")
		cutscene:look(jamm, "up")
		cutscene:showNametag("Susie")
		cutscene:text("* ...Hey,[wait:5] yeah![wait:10] You're right![wait:10] There has to be one!", "surprise_smile", "susie")
		cutscene:hideNametag()
		cutscene:look(susie, "right")
		cutscene:look(jamm, "right")
        for i = 0,5 do
            cutscene:playSound("impact", (1 - (i/10)) ^ (4) )
            cutscene:wait(0.2)
        end
		cutscene:wait(1)
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* ...What was that?", "nervous", "ceroba")
		end
    end
}
