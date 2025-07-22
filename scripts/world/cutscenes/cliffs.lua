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
						text_o:remove()
					end)
				end)
			end)

            return text_o
        end
		
        Game:setFlag("bg_convo", true)
		cutscene:enableMovement()
		
		genText("So, you saw them too, right?", 50, 50, "fmarcy")	-- Marcy
		cutscene:wait(5)
		if Game:isDessMode() then
			genText("The outsider? Y-yeah, I saw them...", 300, 50, "fnoelle")	-- Noelle
		else
			genText("The outsiders? Y-yeah, I saw them...", 300, 50, "fnoelle")	-- Noelle
		end
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
		elseif Game:getFlag("future_variable") == "brenda" then
			genText("Worst comes to worse, we can just kill them, right?", 175, 50)	-- Celestial
			cutscene:wait(5)
			genText("True, but I'd rather we know who they are first.", 50, 50, "fmarcy")	-- Marcy
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

            -- cutscene:wait(wait_time)
			Game.world.timer:tween(1, text_o, { x = x + 15, alpha = 1 }, "linear", function()
				Game.world.timer:after(2.5, function()
					
					Game.world.timer:tween(1, text_o, {alpha = 0 }, "linear", function()
						text_o:remove()
					end)
				end)
			end)

            return text_o
        end

		if Game:isDessMode() then
			local dess = cutscene:getCharacter("dess")

			cutscene:detachCamera()
			
			cutscene:panTo(680, 960, 1)
			cutscene:wait(cutscene:walkTo(dess, "jamm_walkto", 1))
			
			cutscene:showNametag("Dess")
			cutscene:text("* it's quiet...", "neutral_c", "dess")
			cutscene:text("* too quiet...", "annoyed", "dess")
			cutscene:hideNametag()
        	for i = 0,5 do
            	cutscene:playSound("impact", (1 - (i/10)) ^ (4) )
            	cutscene:wait(0.2)
        	end
			cutscene:wait(1)
			cutscene:showNametag("Dess")
			cutscene:text("* uh oh", "wtf", "dess")
			cutscene:hideNametag()
			local alpha = cutscene:spawnNPC("slitherer", 1050, 960)
        	for i = 0,4 do
            	cutscene:wait(cutscene:slideTo(alpha, alpha.x - 30, alpha.y, 1, "in-out-cubic"))
        	end
			cutscene:showNametag("Dess")
			cutscene:text("* hi yes what the actual FUCK is that thing", "annoyed", "dess")
			cutscene:text("* whelp,[wait:5] guess i better kill it", "challenging", "dess")
			cutscene:hideNametag()
			cutscene:startEncounter("slitherer_intro", true, alpha)
			cutscene:wait(0.2)
			Assets.playSound("hurt")
			dess:setSprite("battle/hurt")
			cutscene:shakeCharacter(dess, 2)
			genText("Are they already down...?", 50, 50, "fmarcy")	-- Marcy
			cutscene:wait(0.3)
			cutscene:showNametag("Dess")
			cutscene:text("* what the hell did i just fight", "annoyed", "dess")
			cutscene:hideNametag()
			cutscene:wait(0.7)
			genText("They're not very strong, are they?", 300, 50, "fnoelle")	-- Noelle
			cutscene:showNametag("Dess")
			cutscene:text("* is this the end of the line for me...?", "annoyed", "dess")
			cutscene:hideNametag()
			genText("Wait, don't interfere w--", 50, 50, "fmarcy")	-- Marcy
			cutscene:wait(0.8)
			cutscene:healEffect(dess)
			cutscene:wait(1)
			cutscene:resetSprite(dess)
			Assets.playSound("noise")
			cutscene:wait(0.5)
			cutscene:showNametag("Dess")
			cutscene:text("* what", "mspaint", "dess")
			genText("We don't need them to die!", 300, 50, "fnoelle")	-- Noelle
			cutscene:text("* uhhhhhhhh", "neutral_c", "dess")
			cutscene:text("* im just gonna assume that was God saving my ass and move on", "neutral", "dess")
			genText("We're lucky the deer bailed us out.", 50, 50, "fmarcy")	-- Marcy
			cutscene:text("* okay where tf was i going again?", "angry", "dess")
			cutscene:hideNametag()
			cutscene:attachCamera(1)
			cutscene:showNametag("Dess")
			cutscene:text("* maybe i should avoid those guys...", "neutral_c", "dess")
			cutscene:text("* OR i could kill them all and get a bajillion exp", "smug", "dess")
			cutscene:hideNametag()
			return
		end
		
        local jamm = cutscene:getCharacter("jamm")
		local susie = cutscene:getCharacter("susie")
		local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
		
		cutscene:detachFollowers()
		cutscene:detachCamera()
		
		cutscene:panTo(680, 960, 1)
		cutscene:walkTo(susie, "susie_walkto", 1)
        cutscene:walkTo(jamm, "jamm_walkto", 1)
		cutscene:resetSprite(variant)
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
		if Game:getFlag("future_variable") == "ceroba_dw" then -- just in Ceroba's case specifically
			cutscene:look(variant, "up")
			Game.world.music:fade(0, 1)
		end
		cutscene:showNametag("Jamm")
		cutscene:text("* Oh,[wait:5] don't act like you wouldn't have--", "furious", "jamm", {auto=true, skip=false})
		cutscene:look(susie, "left")
		cutscene:look(jamm, "left")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:look(variant, "right")
			Assets.playSound("ceroba_yell")
			Game.world.camera:shake(6, 2)
			cutscene:showNametag("Ceroba")
			cutscene:text("* WOULD YOU TWO JUST STOP THAT!?", "furious", "ceroba")
			--genText("She's got the guts.", 50, 50, "fmarcy")	-- Marcy (probably) (wasn't sure if it's okay for that dialogue to appear that early in the cutscene)
			cutscene:text("* We've got enough problems as it is.", "angry", "ceroba")
			cutscene:text("* We don't know where we are,[wait:5] nor how do we get back.", "angry_alt", "ceroba")
			cutscene:text("* The LAST thing we need right now is a conflict.", "irked", "ceroba")
			Game.world.music:fade(1, 1)
		elseif Game:getFlag("future_variable") == "brenda" then
			cutscene:showNametag("Brenda")
			cutscene:text("* Oh for the love of...", "suspicious", "brenda")
			cutscene:text("* Can you two stop bickering like school children?", "angry", "brenda")
			cutscene:text("* We need to stick together.", "dissapointed", "brenda")
		end
		cutscene:showNametag("Susie")
		cutscene:text("* ...Yeah.[wait:5] You're right,[wait:5] " .. Game.party[3].name .. ".", "shy_down", "susie")
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
			cutscene:text("* Oh,[wait:5] for the love of...", "unamused", "ceroba")
			cutscene:text("* What is it now?", "closed_eyes", "ceroba")
		elseif Game:getFlag("future_variable") == "brenda" then
			cutscene:showNametag("Brenda")
			cutscene:text("* Uhhh you guys heard that too,[wait:5] right?", "shocked_b", "brenda")
		end
		cutscene:hideNametag()
		local alpha = cutscene:spawnNPC("slitherer", 1050, 960)
        for i = 0,4 do
			if i == 2 then
				susie:setSprite("shock_right")
				cutscene:shakeCharacter(susie, 2)
				Assets.playSound("sussurprise")
				cutscene:walkToSpeed(jamm, jamm.x - 40, jamm.y, 4, "right", true)
			end
            cutscene:wait(cutscene:slideTo(alpha, alpha.x - 30, alpha.y, 1, "in-out-cubic"))
        end
		cutscene:showNametag("Susie")
		cutscene:text("* The hell is THAT thing!?", "surprise_frown", "susie")
		cutscene:showNametag("Jamm")
		cutscene:text("* I don't know,[wait:5] but I don't think we can reason with it.", "determined", "jamm")
		cutscene:setAnimation(jamm, "battle/idle")
		cutscene:text("* Let's show it hell,[wait:5] guys!", "sling_ready", "jamm")
		cutscene:hideNametag()
		cutscene:setAnimation(susie, "battle/attack")
		Assets.playSound("laz_c")
		cutscene:wait(0.6)
		cutscene:setAnimation(susie, "battle/idle")
		cutscene:setAnimation(variant, "battle/idle")
		cutscene:showNametag("Susie")
		cutscene:text("* That,[wait:5] I can get behind!", "teeth_smile", "susie")
		cutscene:hideNametag()
		cutscene:startEncounter("slitherer_intro", true, alpha)
		cutscene:wait(0.2)
		Assets.playSound("hurt")
		susie:setSprite("battle/idle_serious_1")
		cutscene:shakeCharacter(susie, 2)
		cutscene:wait(0.2)
		jamm:setSprite("landed_2")
		cutscene:shakeCharacter(jamm, 1)
		Assets.playSound("noise")
		genText("Are they already down...?", 50, 50, "fmarcy")	-- Marcy
		cutscene:wait(0.3)
		variant:setSprite("battle/defeat")
		cutscene:shakeCharacter(variant, 1)
		Assets.playSound("noise")
		cutscene:wait(0.2)
		susie:setSprite("battle/defeat")
		cutscene:shakeCharacter(susie, 1)
		Assets.playSound("noise")
		cutscene:wait(0.7)
		cutscene:showNametag("Susie")
		cutscene:text("* What did we just fight...?", "surprise_frown", "susie")
		cutscene:showNametag("Jamm")
		cutscene:text("* I know,[wait:5] right!?[wait:10]\n* Talk about a welcome party...", "nervous", "jamm")
		genText("They're not very strong, are they?", 300, 50, "fnoelle")	-- Noelle
		cutscene:showNametag("Susie")
		cutscene:text("* ...", "shy_down", "susie")
		cutscene:hideNametag()
		genText("Wait, don't interfere w--", 50, 50, "fmarcy")	-- Marcy
		cutscene:wait(0.8)
		cutscene:healEffect(susie)
		cutscene:healEffect(jamm)
		cutscene:healEffect(variant)
		cutscene:wait(1)
		cutscene:resetSprite(variant)
		Assets.playSound("noise")
		cutscene:wait(0.5)
		cutscene:resetSprite(jamm)
		Assets.playSound("noise")
		cutscene:wait(0.5)
		cutscene:resetSprite(susie)
		Assets.playSound("noise")
		cutscene:wait(0.5)
		cutscene:showNametag("Susie")
		cutscene:text("* Uh...", "nervous", "susie")
		genText("Why did you do that!?", 50, 50, "fmarcy")	-- Marcy
		cutscene:look(jamm, "left")
		cutscene:look(susie, "left")
		cutscene:showNametag("Jamm")
		cutscene:text("* What just healed us...?", "nervous_left", "jamm")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* I'm...[wait:5] Not sure,[wait:5] honestly.", "dissapproving", "ceroba")
		elseif Game:getFlag("future_variable") == "brenda" then
			cutscene:showNametag("Brenda")
			cutscene:text("* I dunno but I don't wanna question it.", "neutral", "brenda")
			cutscene:text("* Y'know,[wait:5] don't look a gift horse in the mouth and all.", "suspicious", "brenda")
		end
		genText("We don't need them to die!", 300, 50, "fnoelle")	-- Noelle
		cutscene:look(jamm, "up")
		cutscene:showNametag("Jamm")
		cutscene:text("* ...I guess it's not that important,[wait:5] right?", "nervous_left", "jamm")
		cutscene:text("* Whatever it is helped us in the end.", "nervous_left", "jamm")
		genText("We're lucky the dumbfaced one bailed us out.", 50, 50, "fmarcy")	-- Marcy
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* I don't feel confident about this,[wait:5] Jamm...", "unsure_alt", "ceroba")
			cutscene:text("* What if it's trying to lure us in?", "suspicious", "ceroba")
		elseif Game:getFlag("future_variable") == "brenda" then
			cutscene:showNametag("Brenda")
			cutscene:text("* I guess,[wait:5] but like...", "neutral", "brenda")
			cutscene:text("* This is all just so bizarre.", "suspicious_b", "brenda")
		end
		cutscene:showNametag("Susie")
		cutscene:text("* Well,[wait:5] so what if it feels wrong?", "smile", "susie")
		cutscene:setSprite(susie, "pose")
		cutscene:text("* If it attacks,[wait:5] we know what to do.", "closed_grin", "susie")
		genText("...How cocky.", 50, 50, "fmarcy")	-- Marcy
		cutscene:setSprite(jamm, "bt")
		cutscene:showNametag("Jamm")
		cutscene:text("* Yeah,[wait:5] we do!", "smug", "jamm")
		cutscene:hideNametag()
		cutscene:look(susie, "right")
		cutscene:resetSprites()
		cutscene:interpolateFollowers()
		cutscene:attachFollowersImmediate()
		cutscene:attachCamera(1)
		cutscene:showNametag("Jamm")
		cutscene:text("* You know...[wait:10] That's just a regular enemy,[wait:5] right?", "neutral", "jamm")
		cutscene:text("* If we absolutely HAD to fight...[wait:10] DarkSling would take effect.", "look_left", "jamm")
		genText("DarkSling...? That's familiar...", 50, 50, "fmarcy")	-- Marcy
		cutscene:showNametag("Susie")
		cutscene:text("* Maybe we should try to [color:yellow]avoid these enemies[color:white]...", "neutral", "susie")
		cutscene:hideNametag()
		Game:setFlag("first_collapse_creature", true)
    end,
	
    sign2 = function(cutscene, event)
		cutscene:text("* Inside this chest contains [color:yellow]ARMOR[color:white].")
		cutscene:text("* It can help you withstand the daily horrors.")
		cutscene:text("* (Signed, The Resistance)")
		if Game:isDessMode() then
			cutscene:showNametag("Dess")
			cutscene:text("* am i in some king of [color:red]Half-Life 2[color:reset] right now", "neutral", "dess")
			cutscene:hideNametag()
			return
		end
		cutscene:showNametag("Jamm")
		cutscene:text("* Guys, I have a feeling we'll be needing this armor.", "nervous", "jamm")
		cutscene:text("* Maybe we should equip it on one of us?", "nervous_left", "jamm")
		cutscene:showNametag("Susie")
		cutscene:text("* Let's see...", "nervous", "susie")
		cutscene:hideNametag()
    end,
	
    chase_start	= function(cutscene, event)
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

            -- cutscene:wait(wait_time)
			Game.world.timer:tween(1, text_o, { x = x + 15, alpha = 1 }, "linear", function()
				Game.world.timer:after(2.5, function()
					
					Game.world.timer:tween(1, text_o, {alpha = 0 }, "linear", function()
						text_o:remove()
					end)
				end)
			end)

            return text_o
        end
		
		local function createParticle(x, y)
			local sprite = Sprite("effects/icespell/snowflake", x, y)
			sprite:setOrigin(0.5, 0.5)
			sprite:setScale(1.5)
			sprite.layer = WORLD_LAYERS["above_events"]
			Game.world:addChild(sprite)
			return sprite
		end
		
        local jamm = cutscene:getCharacter("jamm")
		local susie = cutscene:getCharacter("susie")
		local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
		
		cutscene:detachFollowers()
		cutscene:detachCamera()
		
		cutscene:panTo(780, 500, 1)
		cutscene:walkTo(susie, "susie_walkto", 1)
        cutscene:walkTo(jamm, "jamm_walkto", 1)
        cutscene:wait(cutscene:walkTo(variant, "variant_walkto", 1))
		
		cutscene:showNametag("Susie")
		cutscene:text("* I think I might have some idea about where we are...", "neutral", "susie")
		cutscene:look(susie, "down")
		cutscene:look(jamm, "up")
		cutscene:showNametag("Jamm")
		cutscene:text("* ...Go on.", "neutral", "jamm")
		genText("...This is taking too long.", 50, 50, "fmarcy")	-- Marcy
		cutscene:showNametag("Susie")
		cutscene:text("* With the different language on the signs and the cliffs...", "neutral_side", "susie")
		cutscene:text("* We might be in some kind of a different universe.", "neutral", "susie")
		genText("I think we should take them prisoner.", 50, 50, "fmarcy")	-- Marcy
		cutscene:showNametag("Jamm")
		cutscene:text("* Like an AU or something?", "neutral", "jamm")
		cutscene:showNametag("Susie")
		cutscene:text("* The hell is an AU?", "neutral", "susie")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			genText("And interrogate them at the base or something?", 175, 50)	-- Kanako
		elseif Game:getFlag("future_variable") == "brenda" then
			genText("Agreed, perhaps we can interrogate them as well.", 175, 50)	-- Celestial
		end
		cutscene:showNametag("Jamm")
		cutscene:text("* It means \"Alternate Universe\".", "look_left", "jamm")
		cutscene:text("* It's an alternate version of a world,[wait:5] with some change.", "neutral", "jamm")
		cutscene:text("* Swapped roles,[wait:5] everyone is evil,[wait:5] extra people...", "neutral", "jamm")
		genText("Yeah, that's what I'm thinking now.", 50, 50, "fmarcy")	-- Marcy
		cutscene:text("* There might even be one where the Roaring is real.[react:1]", "side_smile", "jamm", {reactions={
			{"Or one where\nAnia is alive...", 352, 61, "worried", "jamm"}
		}})
		cutscene:showNametag("Susie")
		cutscene:text("* Dude,[wait:5] really???[wait:10]\n* I'd want to go to that one!", "surprise_smile", "susie")
		genText("...If you think it's best, then...", 300, 50, "fnoelle")	-- Noelle
		cutscene:text("* But,[wait:5] uh...[wait:10]\n* Something like that.", "nervous", "susie")
		cutscene:look(susie, "left")
		cutscene:look(jamm, "left")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* ...It's the best we've got.", "default", "ceroba")
			cutscene:text("* So then how would we get home?", "default", "ceroba")
		elseif Game:getFlag("future_variable") == "brenda" then
			cutscene:showNametag("Brenda")
			cutscene:text("* That's cool and all,[wait:5] but uh...", "dissapointed", "brenda")
			cutscene:text("* How the hell are we supposed to get home?", "suspicious", "brenda")
		end
		cutscene:setAnimation(susie, {"away_scratch", 1/3, true})
		cutscene:showNametag("Susie")
		cutscene:text("* Yeah,[wait:5] I'm still working on--", "nervous_side", "susie", {auto=true})
		cutscene:hideNametag()
		local particles = {}
		Game.world.music:stop()
		cutscene:wait(1/30)
		Assets.playSound("icespell")
        particles[1] = createParticle(755, 480)
        cutscene:wait(3/30)
		cutscene:setSprite(susie, "shock_left")
		cutscene:setSprite(jamm, "trip")
		jamm.flip_x = true
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:setSprite(variant, "fall")
			variant.flip_x = true
		elseif Game:getFlag("future_variable") == "brenda" then
			cutscene:setSprite(variant, "battle/defend_6")
		end
		cutscene:slideTo(susie, susie.x + 40, susie.y, 0.2)
		cutscene:slideTo(jamm, jamm.x + 40, jamm.y, 0.2)
		cutscene:slideTo(variant, variant.x - 40, variant.y, 0.2)
        particles[2] = createParticle(805, 480)
        cutscene:wait(3/30)
        particles[3] = createParticle(780, 520)
        cutscene:wait(3/30)
        Game.world:addChild(IceSpellBurst(780, 500))
        for _,particle in ipairs(particles) do
            for i = 0, 5 do
                local effect = IceSpellEffect(particle.x, particle.y)
                effect:setScale(0.75)
                effect.physics.direction = math.rad(60 * i)
                effect.physics.speed = 8
                effect.physics.friction = 0.2
                effect.layer = WORLD_LAYERS["above_events"] - 1
                Game.world:addChild(effect)
            end
        end
        cutscene:wait(1/30)
        for _,particle in ipairs(particles) do
            particle:remove()
        end
        cutscene:wait(1)
		cutscene:showNametag("Jamm")
		cutscene:text("* Wh-what was that!?", "speechless", "jamm")
		cutscene:hideNametag()
		cutscene:look(susie, "up")
		cutscene:resetSprite(susie)
		susie:alert()
		cutscene:wait(1)
		cutscene:setAnimation(susie, {"point_up", 1/3, true})
		Game.world.music:play("creepychase")
		cutscene:showNametag("Susie")
		cutscene:text("* HEY!", "angry", "susie")
		jamm.flip_x = false
		cutscene:look(jamm, "up")
		cutscene:resetSprite(jamm)
		variant.flip_x = false
		cutscene:look(variant, "up")
		cutscene:resetSprite(variant)
		cutscene:hideNametag()
		cutscene:panTo(780, 140, 1)
		cutscene:wait(1)
		cutscene:showNametag("???", {top=false})
		cutscene:text("* Shit,[wait:5] they spotted us!", nil, "fmarcy", {top=false})
		local fmarcy = cutscene:getCharacter("fmarcy")
		cutscene:walkToSpeed(fmarcy, 1160, fmarcy.y, 12)
		cutscene:text("* Hey,[wait:5] don't run off without me!", nil, "fmarcy", {top=false})
		cutscene:resetSprite(susie)
		cutscene:hideNametag()
		cutscene:panTo(780, 500, 1)
		cutscene:wait(1)
		cutscene:look(susie, "down")
		cutscene:showNametag("Jamm")
		cutscene:text("* C'mon,[wait:5] after them!", "determined", "jamm")
		jamm:walkToSpeed(1160, jamm.y, 12)
		variant:walkToSpeed(1160, variant.y, 12)
		cutscene:hideNametag()
		Game.world.future_chase_started = true
    end,
	
    no_return_1	= function(cutscene, event)
		cutscene:showNametag("Susie")
		cutscene:text("* I can't go back now.", "nervous", "susie")
		cutscene:hideNametag()
		local susie = cutscene:getCharacter("susie")
		cutscene:wait(cutscene:walkToSpeed(susie, susie.x + 40, susie.y, 8))
    end,
	
	jamm_jump = function(cutscene)
		local jamm = cutscene:getCharacter("jamm")
		Assets.playSound("jump")
		Game:setFlag("future_jamm_jump", true)
		jamm:jumpTo(580, 380, 20, 0.5, "ball", "landed_2")
		Game.world.timer:after(0.5, function()
			jamm:shake(2)
		end)
		Game.world.timer:after(0.7, function()
			jamm:walkToSpeed(580, 600, 8)
		end)
	end,
	
	chase_end = function(cutscene)
        local jamm = cutscene:getCharacter("jamm")
		local susie = cutscene:getCharacter("susie")
		local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
		local fmarcy = cutscene:getCharacter("fmarcy")
		local fnoelle = cutscene:getCharacter("fnoelle")
		local fvariant = cutscene:getCharacter(Mod:getVariableFuture(Game.party[3].id))
		
		cutscene:wait(cutscene:walkToSpeed(susie, "susie_meetup", 8, "down"))
		
		cutscene:showNametag("Jamm", {top=true})
		cutscene:text("* C'mon,[wait:5] we're almost there!", "determined", "jamm", {top=true})
		cutscene:hideNametag()
		
		local susie_available = false
		
		susie:walkToSpeed("susie_walkto", 8, nil, false, function()
			Assets.playSound("jump")
			susie:jumpTo(840, 260, 20, 0.5, "ball", "landed_2")
			Game.world.timer:after(0.5, function()
				susie_available = true
			end)
		end)
		cutscene:walkToSpeed(variant, "variant_walkto", 8)
		cutscene:wait(cutscene:walkToSpeed(jamm, "jamm_walkto", 8))
		
		local attack_fx = Sprite("effects/attack/cut_ceroba_1", jamm.x, jamm.y - 20)
		attack_fx:setScale(2)
		attack_fx:setOrigin(0.5)
		attack_fx:setLayer(jamm.layer+0.1)
		Game.world:addChild(attack_fx)
		attack_fx:setAnimation({"effects/attack/cut_ceroba", 1/10, false})
		Assets.playSound("laz_c")
		
		cutscene:wait(3/10)
		
		attack_fx:remove()
		cutscene:setSprite(jamm, "landed_1")
		Assets.playSound("damage", 1)
		jamm:statusMessage("msg", "critical")
		cutscene:shakeCharacter(jamm, 4)
		Game.world.timer:after(0.4, function()
			Assets.playSound("damage", (1 - (1/10)) ^ (4) )
			Game.world.timer:after(0.4, function()
				Assets.playSound("damage", (1 - (2/10)) ^ (4) )
				Game.world.timer:after(0.4, function()
					Assets.playSound("damage", (1 - (3/10)) ^ (4) )
					Game.world.timer:after(0.4, function()
						Assets.playSound("damage", (1 - (4/10)) ^ (4) )
					end)
				end)
			end)
		end)
		
		cutscene:wait(function() return susie_available end)
		
		cutscene:look(susie, "down")
		cutscene:look(variant, "down")
		
		cutscene:alert(susie)
		
		cutscene:wait(1)
		
		cutscene:wait(cutscene:walkToSpeed(susie, jamm.x, jamm.y - 40, 8))
		
		cutscene:setSprite(susie, "landed_2")
		
		cutscene:showNametag("Susie", {top=true})
		cutscene:text("* H-hey![wait:10]\n* Get up!", "sad", "susie", {top=true})
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(variant, susie.x, susie.y - 40, 8))
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba", {top=true})
			cutscene:text("* ...[wait:5] I don't think he can,[wait:5] Susie.", "sorrowful", "ceroba", {top=true})
		end
		cutscene:showNametag("Susie", {top=true})
		cutscene:text("* ...", "bangs/down", "susie", {top=true})
		cutscene:hideNametag()
		
		Game.world.music:fade(0, 1)
		cutscene:wait(1)
		
		Game.world.player.actor.default = "walk_bangs_unhappy"
		
		cutscene:setAnimation(susie, {"landed", 1/10, false})
		cutscene:wait(0.5)
		cutscene:resetSprite(susie)
		
		cutscene:showNametag("Susie", {top=true})
		
		cutscene:showNametag("Susie", {top=true})
		cutscene:text("* ...", "bangs/down", "susie", {top=true})
		local thirdpartyname = Game.party[3]:getName()
		cutscene:text("* "..thirdpartyname..".", "bangs/down", "susie", {top=true})
		cutscene:text("* Protect Jamm.", "bangs/down", "susie", {top=true})
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba", {top=true})
			cutscene:text("* On it.", "neutral", "ceroba", {top=true})
		end
		local robashield
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:walkToSpeed(variant, jamm.x + 100, jamm.y, 4, "right", nil, function()
				variant:setAnimation("guard")
				Game.world.timer:after(0.4, function()
					local shield = Sprite("world/cutscenes/ceroba_guard_shield", jamm.x+20, jamm.y-jamm.height/2)
					shield:setScale(2)
					shield:setOrigin(0.5, 0.5)
					shield.layer = jamm.layer + 0.1
					Game.world:addChild(shield)
					shield:play(1/10, false)
					robashield = shield
				end)
			end)
		else
			cutscene:walkToSpeed(variant, jamm.x + 100, jamm.y, 4, "right")
		end
		cutscene:showNametag("Susie", {top=true})
		cutscene:look(susie, "right")
		cutscene:text("* You.", "bangs/neutral", "susie", {top=true})
		cutscene:hideNametag()
		
		Game.world.music:play("susie", 1, 1)
		
		cutscene:wait(cutscene:panTo("camera_to"))
		
		cutscene:wait(cutscene:walkToSpeed(susie, susie.x, fmarcy.y, 4, "right"))
		
		cutscene:look(variant, "right")
		cutscene:showNametag("Susie")
		cutscene:text("* I don't know who the hell you think you are...", "bangs/neutral", "susie")
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(susie, susie.x + 80, susie.y, 4, "right"))
		
		cutscene:showNametag("Susie")
		cutscene:text("* But you messed with the wrong heroes,[wait:5] you hear me?", "bangs/neutral", "susie")
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(susie, susie.x + 40, susie.y, 4, "right"))
		cutscene:panTo("camera_to_2")
		cutscene:walkToSpeed(fmarcy, fmarcy.x + 80, fmarcy.y, 2, "left", true)
		cutscene:wait(cutscene:walkToSpeed(susie, susie.x + 160, susie.y, 4, "right"))
		
		cutscene:showNametag("Susie")
		cutscene:text("* Did you not hear me?", "bangs/teeth", "susie")
		cutscene:text("* You are going to pay for making Jamm hurt like that.[react:1]", "bangs/teeth", "susie", {reactions={
			{"Hold on, did\nyou say...", 352, 61, "neutral", "fmarcy"}
		}})
		cutscene:hideNametag()
		
		cutscene:setAnimation(susie, "battle/attack")
		Assets.playSound("laz_c")
		cutscene:wait(0.5)
		
		cutscene:showNametag("Susie")
		cutscene:text("* You do NOT mess with my friends.", "bangs/teeth_eye", "susie")
		cutscene:hideNametag()
		
		cutscene:setAnimation(susie, {"laugh_right", 1/4, true})
		cutscene:wait(cutscene:playSound("suslaugh"))
		
		cutscene:resetSprite(susie)
		
		Game.party[1].health = Game.party[1]:getStat("health")
		
		local party_id = Game.party[3].id
		Game:removePartyMember(party_id)
		Game:removePartyMember("jamm")
		
		cutscene:startEncounter("fmarcy_enrage", true, fmarcy)
		
		Game:addPartyMember("jamm")
		Game:addPartyMember(party_id)

		if robashield then robashield:remove() end
		variant:resetSprite()
		
		cutscene:showNametag("Jamm")
		cutscene:text("* Susie![wait:10] Snap out of it!", "speechless", "jamm")
		
		cutscene:showNametag("Susie")
		cutscene:text("* ...Jamm?", "bangs/neutral", "susie")
		cutscene:hideNametag()
		
		Game.world.player.actor.default = "walk"
		
		cutscene:wait(cutscene:setAnimation(susie, "battle/victory"))
		
		cutscene:look(susie, "left")
		cutscene:resetSprite(susie)
		
		cutscene:showNametag("Susie")
		cutscene:text("* Dude![wait:10]\n* You're okay!", "surprise_smile", "susie")
		
		cutscene:showNametag("Jamm")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:text("* Thank the Angel I had my secret ReviveMint...[react:1]", "smirk", "jamm", {reactions={
				{"I helped him with it\nwhile you were occupied.", "mid", "bottom", "neutral_1", "ceroba"}
			}})
		else
			cutscene:text("* Thank the Angel I had my secret ReviveMint...", "smirk", "jamm")
		end
		cutscene:text("* But Susie,[wait:5] what was that!?", "determined", "jamm")
		cutscene:text("* We were trying to get your attention for a while now!", "determined", "jamm")
		
		cutscene:showNametag("Susie")
		cutscene:text("* I...[wait:5] lost control.", "shy_down", "susie")
		cutscene:text("* But now that I know the feeling of rage...", "neutral", "susie")
		cutscene:text("* I'll be able to [color:yellow]use it to my advantage[color:white].", "smile", "susie")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* At least something good came out of it,[wait:5] right?", "smirk", "jamm")
		cutscene:text("* But that begs the question...", "neutral", "jamm")
		cutscene:hideNametag()
		
		cutscene:walkToSpeed(susie, susie.x, susie.y + 40, 4, "up", true)
		cutscene:wait(cutscene:walkToSpeed(jamm, jamm.x + 120, jamm.y, 4, "right"))
		
		cutscene:look(susie, "right")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* Who exactly is this?", "suspicious", "jamm")
		
		cutscene:showNametag("???")
		cutscene:text("* Have I really changed so much that you don't recognize me?", "neutral", "fmarcy")
		cutscene:text("* Seeing you again,[wait:5] you haven't changed a bit...", "closed", "fmarcy")
		cutscene:text("* Have you,[wait:5] [color:yellow]dad[color:white]?", "neutral", "fmarcy")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* ...!", "speechless", "jamm")
		cutscene:text("* W-wait...[wait:5]\n* Did you just call me...", "speechless_smile", "jamm")
		
		cutscene:showNametag("???")
		cutscene:text("* It's me,[wait:5] dad.[wait:10]\n* Your only daughter.", "neutral", "fmarcy")
		
		cutscene:showNametag("Marcy")
		cutscene:text("* Marcy.", "closed", "fmarcy")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* I-is it really...???", "speechless", "jamm")
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(jamm, jamm.x + 60, jamm.y, 4, "right"))
		
		cutscene:showNametag("Marcy")
		cutscene:text("* I'd advise against hugging me,[wait:5] father.", "neutral", "fmarcy")
		
		cutscene:walkToSpeed(susie, variant.x, susie.y, 8, "up")
		cutscene:walkToSpeed(variant, variant.x, variant.y - 40, 4, "down")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* S-sorry,[wait:5] I just...", "nervous", "jamm")
		cutscene:text("* I need to be really sure that you're my daughter.", "suspicious", "jamm")
		
		cutscene:showNametag("Marcy")
		cutscene:text("* Proving myself to you is inconsequential,[wait:5] but if you must...", "closed", "fmarcy")
		cutscene:text("* Ask me anything.", "untrusting", "fmarcy")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* (Alright,[wait:5] where to start...)", "neutral", "jamm")
		cutscene:hideNametag()
		
		local choice = cutscene:choicer({"Favorite\ncolor", "Favorite\nfood"})
		
		if choice == 1 then
			cutscene:showNametag("Jamm")
			cutscene:text("* The Marcy I know had a favorite color back in preschool.", "neutral", "jamm")
		
			cutscene:showNametag("Marcy")
			cutscene:text("* Yellow.[wait:10]\n* Specifically, \"New Yeller.\"", "closed", "fmarcy")
		else
			cutscene:showNametag("Jamm")
			cutscene:text("* The Marcy I know had a favorite food.", "neutral", "jamm")
		
			cutscene:showNametag("Marcy")
			cutscene:text("* Mom's chicken terriyaki recipe.", "closed", "fmarcy")
		end
		cutscene:hideNametag()
		
		local choice = cutscene:choicer({"Outfit", "Hobby"})
		
		if choice == 1 then
			cutscene:showNametag("Jamm")
			cutscene:text("* Okay,[wait:5] but what was your favorite outfit?", "neutral", "jamm")
		
			cutscene:showNametag("Marcy")
			cutscene:text("* Sleeveless green shirt,[wait:5] gray pants.", "closed", "fmarcy")
		else
			cutscene:showNametag("Jamm")
			cutscene:text("* Okay,[wait:5] but what was your favorite hobby?", "neutral", "jamm")
		
			cutscene:showNametag("Marcy")
			cutscene:text("* Drawing with crayons.", "closed", "fmarcy")
		end
		cutscene:text("* Everyone knows that one,[wait:5] dad.", "neutral", "fmarcy")
		cutscene:hideNametag()
		
		local choice = cutscene:choicer({"The\nincident", "Characters"})
		
		if choice == 1 then
			cutscene:showNametag("Jamm")
			cutscene:text("* What was [color:yellow]the incident[color:white] back in 3rd grade?", "neutral", "jamm")
		
			cutscene:showNametag("Marcy")
			cutscene:text("* We agreed never to discuss it.", "closed", "fmarcy")
		else
			cutscene:showNametag("Jamm")
			cutscene:text("* Which Deoxynn character did you make?", "neutral", "jamm")
		
			cutscene:showNametag("Marcy")
			cutscene:text("* Trick question.[wait:10]\n* I made Pravetz in Soulsweeper.", "closed", "fmarcy")
		end
		
		cutscene:showNametag("Jamm")
		cutscene:text("* I-I...[wait:10]\n* I can't believe it...", "speechless", "jamm")
		
		cutscene:showNametag("Marcy")
		cutscene:text("* And I'm not alone.", "neutral", "fmarcy")
		cutscene:look(fmarcy, "down")
		local fparty_id = Mod:getVariableFuture(Game.party[3].id)
		cutscene:text("* Noelle.[func:reveal][wait:10] " .. Game:getPartyMember(fparty_id):getName() .. ".[wait:10]\n* You might want to see this.", "neutral", "fmarcy", {functions = {
			reveal = function()
				susie:setFacing("right")
				variant:setFacing("right")
				susie:alert()
			end
		}})
		cutscene:hideNametag()
		cutscene:look(jamm, "down")
		
		cutscene:walkToSpeed(fnoelle, fnoelle.x - 400, fnoelle.y, 6)
		cutscene:wait(cutscene:walkToSpeed(fvariant, fvariant.x - 400, fvariant.y, 6))
		
		cutscene:showNametag("Susie")
		cutscene:text("* Noelle???", "surprise", "susie")
		cutscene:hideNametag()
		
		cutscene:walkToSpeed(susie, susie.x, fnoelle.y, 6)
		cutscene:wait(cutscene:walkToSpeed(variant, variant.x, fvariant.y, 6))
		
		cutscene:walkToSpeed(susie, fnoelle.x - 120, fnoelle.y, 6)
		cutscene:wait(cutscene:walkToSpeed(variant, fvariant.x - 80, fvariant.y, 6))
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Kanako", {left=true})
			cutscene:text("* Wait... Are you...", "neutral", "fkanako")
			cutscene:text("* My mother...?", "neutral", "fkanako")
			cutscene:showNametag("Ceroba", {left=true})
			cutscene:text("* K... Kanako?", "surprised", "ceroba")
			cutscene:showNametag("Kanako", {left=true})
			cutscene:text("* I thought you...", "neutral", "fkanako")
		end
		
		cutscene:showNametag("Susie", {left=true})
		cutscene:text("* Noelle, hey![wait:10]\n* It's cool to...", "surprise_smile", "susie")
		cutscene:text("* ...Wait a minute...", "neutral", "susie")
		cutscene:text("* Where did you get that jacket...?", "neutral", "susie")
		cutscene:text("* And your antlers and hair...", "nervous", "susie")
		
        cutscene:showNametag("Noelle", {left=true})
		cutscene:text("* It's been...", "neutral", "noelle")
		cutscene:text("* It's been so long...", "neutral", "noelle")
		
		cutscene:showNametag("Susie", {left=true})
		cutscene:text("* ...What?", "nervous", "susie")
		
		cutscene:showNametag("Marcy", {left=true})
		cutscene:text("* You three have been missing for a decade,[wait:5] Susie.", "closed", "fmarcy")
		
		cutscene:showNametag("Susie", {left=true})
		cutscene:text("* A decade!?[wait:10]\n* That's like...[wait:10] A hundred years!", "surprise_frown", "susie")
		
		cutscene:showNametag("Jamm", {left=true})
		cutscene:text("* ...Ten years,[wait:5] Susie.[wait:10]\n* We've been missing for ten y--", "stern", "jamm", {auto=true})
		cutscene:look(jamm, "right")
		cutscene:text("* Wait a minute,[wait:5] what do you mean we've been missing for a decade?", "nervous", "jamm")
		
		cutscene:look(fmarcy, "left")
		cutscene:showNametag("Marcy", {left=true})
		cutscene:text("* We did all we could to look for you after you disappeared...", "neutral", "fmarcy")
		cutscene:look(fmarcy, "down")
		cutscene:look(jamm, "down")
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			variant:setSprite("fall")
			variant.flip_x = true
			cutscene:showNametag("Ceroba", {left=true})
			cutscene:text("* What?![wait:10] I disappeared?!", "surprised", "ceroba")
			variant:resetSprite()
			variant.flip_x = false
			cutscene:showNametag("Kanako", {left=true})
			cutscene:text("* Well,[wait:5] one day you just...[wait:10] Didn't come back home.", "neutral", "fkanako")
			cutscene:text("* Uncle Star and the rest searched for you,[wait:5] but nobody could find you.", "neutral", "fkanako")
			cutscene:text("* Then I heard Marcy and Noelle lost Jamm and Susie,[wait:5] and...", "neutral", "fkanako")
			cutscene:text("* We decided to look for you three together.", "neutral", "fkanako")
		end
		
		cutscene:showNametag("Susie", {left=true})
		cutscene:text("* Damn...", "shy_down", "susie")
		cutscene:text("* Can't believe we went missing.", "neutral", "susie")
		
		cutscene:showNametag("Marcy", {left=true})
		cutscene:text("* If I may ask...", "closed", "fmarcy")
		cutscene:look(fmarcy, "left")
		cutscene:look(jamm, "right")
		cutscene:text("* Why did you three choose to return here?[wait:10]\n* Why now?", "neutral", "fmarcy")
		cutscene:text("* And where the hell were you when we needed you most?", "neutral", "fmarcy")
		cutscene:look(jamm, "right")
		cutscene:showNametag("Jamm", {left=true})
		cutscene:text("* Well,[wait:5] it wasn't exactly by choice...", "nervous", "jamm")
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:fadeOut())
		
		cutscene:text("* The three of you explain what happened.")
		
		-- 1160, 240
		local lore_board = Registry.createEvent("lore_board", {x = 1160, y = 240, properties = {}})
		Game.world:spawnObject(lore_board)
		
		jamm.x = 1240
		jamm.y = 240
		variant.x = 1080
		variant.y = 240
		susie.x = 1160
		susie.y = 280
		jamm:setFacing("down")
		variant:setFacing("down")
		susie:setFacing("left")
		
		fvariant.x = 1240
		fvariant.y = 400
		fnoelle.x = 1080
		fnoelle.y = 400
		fmarcy.x = 1160
		fmarcy.y = 400
		fvariant:setFacing("up")
		fnoelle:setFacing("up")
		fmarcy:setFacing("up")
		
		cutscene:wait(cutscene:fadeIn())
		
		cutscene:showNametag("Susie")
		cutscene:text("* ...And,[wait:5] uh,[wait:5] I think that covers it.", "nervous", "susie")
		susie:setFacing("down")
		
		cutscene:showNametag("Marcy", {top=true})
		cutscene:text("* I hate how much sense that makes...", "closed", "fmarcy", {top=true})
		cutscene:text("* There have been so many rifts opening up in our world.", "neutral", "fmarcy", {top=true})
		cutscene:text("* If they started opening up a decade ago...", "neutral", "fmarcy", {top=true})
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Kanako", {top=true})
			cutscene:text("* And we're just supposed to forgive that?", "neutral", "fkanako", {top=true})
			cutscene:text("* This is all your fault,[wait:5] you know!", "neutral", "fkanako", {top=true})
			cutscene:text("* If you hadn't touched that rift,[wait:5] you'd be in your own time!", "neutral", "fkanako", {top=true})
		end
		fmarcy:setFacing("right")
		
		cutscene:showNametag("Marcy", {top=true})
		cutscene:text("* Stand down,[wait:5] " .. Game:getPartyMember(fparty_id):getName() .. ".[wait:10] That's an order.", "upset", "fmarcy", {top=true})
		cutscene:text("* I get you're upset right now.[wait:10] We all are.", "upset", "fmarcy", {top=true})
		cutscene:text("* But yelling at them won't help matters at all.", "closed", "fmarcy", {top=true})
		fmarcy:setFacing("up")
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba", {top=true})
			cutscene:text("* What happened here,[wait:5] anyways?", "question", "ceroba", {top=true})
		end
		
		cutscene:showNametag("Marcy", {top=true})
		cutscene:text("* ...The Knight happened.", "neutral", "fmarcy", {top=true})
		cutscene:text("* They kept opening fountains one by one,[wait:5] until the rifts...", "neutral", "fmarcy", {top=true})
		cutscene:text("* They became too many to handle and the fountains started freezing.", "neutral", "fmarcy", {top=true})
		cutscene:text("* Before we knew it,[wait:5] the darkners were stone and the war had begun.", "closed", "fmarcy", {top=true})
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(susie, jamm.x, susie.y, 4))
		cutscene:walkToSpeed(jamm, jamm.x, jamm.y - 40, 4, "down", true)
		cutscene:wait(cutscene:walkToSpeed(susie, jamm.x, susie.y - 40, 4))
		
		cutscene:setSprite(susie, "serious_kick_ready")
		
		local ready_to_proceed = false
		cutscene:showNametag("Susie")
		cutscene:text("* That damn...", "angry", "susie")
		susie:setAnimation({"serious_kick", 1/10, false}, function()
			lore_board:explode()
			Game.world.timer:after(1, function()
				ready_to_proceed = true
			end)
		end)
		cutscene:text("* KNIGHT!", "teeth", "susie")
		cutscene:hideNametag()
		
		cutscene:wait(function() return ready_to_proceed end)
		
		susie:setFacing("down")
		cutscene:resetSprite(susie)
		cutscene:showNametag("Susie")
		cutscene:text("* If only I had been able to stop them before all this happened...", "bangs_neutral", "susie")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* You did the best you could...", "worried", "jamm")
		
		cutscene:showNametag("Marcy")
		cutscene:text("* ...And now,[wait:5] there's nothing you can do.", "neutral", "fmarcy")
		cutscene:text("* Let us bring you to Hometown.", "neutral", "fmarcy")
		cutscene:text("* You three will be safe there,[wait:5] I promise.", "neutral", "fmarcy")
		cutscene:hideNametag()
		
		cutscene:walkToSpeed(fmarcy, 1640, fmarcy.y, 6)
		cutscene:walkToSpeed(fnoelle, 1640, fnoelle.y, 6)
		cutscene:wait(cutscene:walkToSpeed(fvariant, 1640, fvariant.y, 6))
		
		cutscene:detachFollowers()
		jamm:convertToFollower(1)
		variant:convertToFollower(2)
		
		cutscene:attachCamera(1)
		cutscene:attachFollowers(8)
		cutscene:wait(1)
		
		Game.party[1]:addSpell("rage")
		
		Game.world.music:play("deltarune/wind_highplace", 1, 1)
	end,
	
	exit_cliffs = function(cutscene)
        local jamm = cutscene:getCharacter("jamm")
		local susie = cutscene:getCharacter("susie")
		local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
		local fmarcy = cutscene:getCharacter("fmarcy")
		
		Game:setFlag("future_met_fp", true)
		
		cutscene:wait(cutscene:fadeOut())
		
		cutscene:detachFollowers()
		
		susie.x = fmarcy.x - 80
		jamm.x = susie.x - 80
		variant.x = jamm.x
		
		susie.y = fmarcy.y
		jamm.y = susie.y
		variant.y = jamm.y + 80
		
		susie:setFacing("right")
		jamm:setFacing("right")
		variant:setFacing("right")
		
		Game.world.map:getTileLayer("Tile Layer 3").visible = true
		Game.world.map:getTileLayer("Tile Layer 4").visible = true
		
		cutscene:wait(cutscene:fadeIn())
		
		cutscene:showNametag("Marcy")
		cutscene:text("* The other two already went down.", "neutral", "fmarcy")
		cutscene:text("* Follow me once you built up the courage.", "neutral", "fmarcy")
		cutscene:text("* Be warned:[wait:10] The wall ends pretty quickly.", "neutral", "fmarcy")
		cutscene:hideNametag()
		
		local sound = Assets.newSound("paper_surf")
		sound:setLooping(true)
		
		cutscene:during(function()
			sound:setVolume(math.max(sound:getVolume() - DT/2, 0))
		end)
		
		cutscene:wait(cutscene:walkToSpeed(fmarcy, fmarcy.x, fmarcy.y + 80, 4))
		cutscene:setSprite(fmarcy, "slide")
		Assets.playSound("noise")
		sound:play()
		sound:setVolume(1)
		cutscene:wait(cutscene:slideTo(fmarcy, fmarcy.x, fmarcy.y + 280, 0.5))
		
		cutscene:walkTo(susie, "susie_walkto", 1, "down")
        cutscene:walkTo(jamm, "jamm_walkto", 1, "down")
        cutscene:wait(cutscene:walkTo(variant, "variant_walkto", 1, "down"))
		
		cutscene:showNametag("Jamm")
		cutscene:text("* Hole's kinda deep...", "nervous", "jamm")
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* It's our only way forward.", "default", "ceroba")
		end
		
		cutscene:showNametag("Susie")
		cutscene:text("* What,[wait:5] you got a fear of heights or something?", "smile", "susie")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* Wh-what!?[wait:10]\n* I do not!", "nervous_left", "jamm")
		cutscene:text("* Here,[wait:5] I'll go in first,[wait:5] then!", "nervous", "jamm")
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(jamm, jamm.x + 40, jamm.y, 4))
		cutscene:wait(cutscene:walkToSpeed(jamm, jamm.x, jamm.y + 40, 4))
		cutscene:setSprite(jamm, "slide")
		Assets.playSound("noise")
		sound:setVolume(1)
		cutscene:wait(cutscene:slideTo(jamm, jamm.x, jamm.y + 280, 0.5))
		
		cutscene:showNametag("Susie")
		cutscene:text("* Huh.[wait:10]\n* He actually did it.", "shock", "susie")
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* I'll see you down there.", "default", "ceroba")
		end
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(variant, variant.x - 40, variant.y, 4))
		cutscene:wait(cutscene:walkToSpeed(variant, variant.x, variant.y + 40, 4))
		cutscene:setSprite(variant, "slide")
		Assets.playSound("noise")
		sound:setVolume(1)
		cutscene:wait(cutscene:slideTo(variant, variant.x, variant.y + 280, 0.5))
		cutscene:wait(0.5)
		
		cutscene:wait(cutscene:walkToSpeed(susie, susie.x, susie.y + 40, 4))
		cutscene:setSprite(susie, "slide")
		Assets.playSound("noise")
		sound:setVolume(1)
		cutscene:wait(cutscene:slideTo(susie, susie.x, susie.y + 280, 0.5))
		
		cutscene:wait(cutscene:fadeOut())
		cutscene:loadMap("main_hub", "landing")
		Game.world.music:stop()
		
        local jamm = cutscene:getCharacter("jamm")
		local susie = cutscene:getCharacter("susie")
		local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
		local fmarcy = cutscene:getCharacter("fmarcy")
		
		cutscene:detachFollowers()
		
		local rect = Rectangle(0, 0, 9999, 9999)
		rect.color = {0, 0, 0}
		rect:setLayer(WORLD_LAYERS["above_events"])
		Game.world:addChild(rect)
		
		susie:setLayer(rect.layer + 1)
		
		jamm.x = susie.x - 80
		jamm:setFacing("up")
		
		variant.x = susie.x + 60
		variant.y = susie.y + 40
		
		susie:setAnimation({"fall", 1/15, true})
		
		cutscene:wait(cutscene:fadeIn(1.5))
		
		cutscene:wait(1)
		
		susie:setSprite("landed_1")
		Assets.playSound("dtrans_flip")
		susie:shake(2)
		
		cutscene:wait(1)
		
		Assets.playSound("him_quick")
		Game.world.timer:tween(0.65, rect, {alpha = 0})
		
		cutscene:wait(1)
		
		Game.world.music:play()
		
		cutscene:setSprite(susie, "landed_2")
		cutscene:wait(1/10)
		cutscene:resetSprite(susie)
		
		susie:setLayer(Game.world.followers[1].layer)
		
		cutscene:look(susie, "left")
		cutscene:wait(0.25)
		cutscene:look(susie, "right")
		cutscene:wait(0.25)
		cutscene:look(susie, "up")
		cutscene:wait(0.25)
		
		cutscene:showNametag("Susie")
		cutscene:text("* Jeez...[wait:10]\n* The hell is this place?", "nervous", "susie")
		cutscene:text("* It seems pretty...[wait:10]\n* Dead.", "nervous_side", "susie")
		
		cutscene:look(susie, "left")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* Susie,[wait:5] I...[wait:10]\n* I think this is the hub.", "nervous_left", "jamm")
		
		cutscene:showNametag("Marcy")
		cutscene:text("* Or what's left of it,[wait:5] that is.", "closed", "fmarcy")
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:panTo(fmarcy.x, fmarcy.y))
		
		cutscene:look(susie, "up")
		cutscene:look(jamm, "up")
		cutscene:look(variant, "up")
		
		cutscene:showNametag("Marcy", {top=false})
		cutscene:text("* The Endless War...[wait:10]\n* It ruined this place real bad.", "closed", "fmarcy", {top=false})
		cutscene:text("* I don't remember how to leave this place.", "neutral", "fmarcy", {top=false})
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:attachCamera())
		
		cutscene:look(jamm, "right")
		cutscene:look(variant, "left")
		
		cutscene:showNametag("Susie")
		cutscene:text("* ...Right.", "nervous", "susie")
		cutscene:hideNametag()
		
		cutscene:look(susie, "down")
		
		cutscene:wait(cutscene:walkToSpeed(jamm, susie.x - 60, susie.y + 40, 4, "right"))
		
		cutscene:showNametag("Susie")
		cutscene:text("* Let's think...[wait:10]\n* How do we leave this place again?", "nervous", "susie")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* Well,[wait:5] we could probably use the elevator...", "side_smile", "jamm")
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* Or maybe the warp bin.", "default", "ceroba")
		end
		
		cutscene:showNametag("Susie")
		cutscene:text("* The Great Door might be helpful,[wait:5] too.", "small_smile", "susie")
		cutscene:look(susie, "up")
		cutscene:text("* And if none of those work,[wait:5] there's always this wall.", "smile", "susie")
		
		cutscene:showNametag("Jamm")
		cutscene:text("* Let's try what we came up with first...", "nervous", "jamm")
		cutscene:hideNametag()
		cutscene:interpolateFollowers()
		cutscene:attachFollowers(8)
		cutscene:wait(1)
	end
}
