return function(cutscene, event)
	Game:movePartyMember("susie", 1)
	Game:movePartyMember("jamm", 2)
	
	local jamm = cutscene:getCharacter("jamm")
	local susie = cutscene:getCharacter("susie")
	
	Game:setFlag("future_variable", Mod:getVariablePartyMember())
	
	local variable = cutscene:getCharacter(Game:getFlag("future_variable"))
	
	susie = susie:convertToPlayer()
	jamm = jamm:convertToFollower(1)
	variable = variable:convertToFollower(2)
	
	cutscene:detachFollowers()
	jamm.x = 440
	jamm.y = -80
	variable.x = 300
	variable.y = -120
	
	Game.world.music:play("deltarune/wind_highplace")
	
	cutscene:wait(1)
	
	cutscene:setSprite(jamm, "trip")
	cutscene:wait(cutscene:slideTo(jamm, "jamm_land", 0.5))
	cutscene:setSprite(jamm, "landed_1")
	cutscene:shakeCharacter(jamm, 4)
	Assets.playSound("impact")
	cutscene:wait(1)
	
	cutscene:showNametag("Jamm")
	cutscene:text("* O-[wait:4]ow...", "shaded_pissed", "jamm")
	cutscene:hideNametag()
	
	cutscene:wait(0.25)
	
	cutscene:setAnimation(susie, {"fall", 1/15, true})
	cutscene:wait(cutscene:slideTo(susie, "susie_land", 0.5))
	cutscene:setSprite(susie, "landed_1")
	cutscene:shakeCharacter(susie, 4)
	Assets.playSound("impact")
	cutscene:wait(1)
	cutscene:setSprite(susie, "landed_2")
	cutscene:wait(1/10)
	cutscene:resetSprite(susie)
	
	-- this entire next block will have to be figured out but idc for now
	cutscene:setAnimation(variable, {"fall", 1/15, true})
	cutscene:wait(cutscene:slideTo(variable, "v_land", 0.5))
	cutscene:setSprite(variable, "landed_1")
	cutscene:shakeCharacter(variable, 4)
	Assets.playSound("impact")
	cutscene:wait(1)
	cutscene:setSprite(variable, "landed_2")
	cutscene:wait(1/10)
	cutscene:resetSprite(variable)
	
	cutscene:look(susie, "up")
	cutscene:wait(0.25)
	cutscene:look(susie, "left")
	cutscene:wait(0.25)
	cutscene:look(susie, "right")
	cutscene:wait(0.25)
	cutscene:alert(susie)
	
	cutscene:look(variable, "right")
	cutscene:showNametag("Susie")
	cutscene:text("* Jamm!", "shock_down", "susie")
	cutscene:hideNametag()
	
	cutscene:wait(cutscene:walkToSpeed(susie, jamm.x - 40, jamm.y, 8))
	
	cutscene:showNametag("Susie")
	cutscene:text("* You okay,[wait:5] dude?", "shock_down", "susie")
	cutscene:hideNametag()
	
	cutscene:setSprite(jamm, "landed_2")
	cutscene:wait(1/10)
	cutscene:resetSprite(jamm)
	
	cutscene:showNametag("Jamm")
	cutscene:text("* Y-yeah,[wait:5] thanks...", "ouch", "jamm")
	cutscene:hideNametag()
	
	cutscene:look(jamm, "up")
	cutscene:wait(cutscene:walkToSpeed(jamm, jamm.x, jamm.y - 40, 4))
	cutscene:look(susie, "up")
	
	cutscene:showNametag("Jamm")
	cutscene:text("* What is this place,[wait:5] though...?", "neutral", "jamm")
	cutscene:text("* I swear I've seen something like this before...", "nervous", "jamm")
	cutscene:showNametag("Susie")
	cutscene:text("* You...[wait:5] have...?", "nervous", "susie")
	cutscene:look(jamm, "down")
	cutscene:showNametag("Jamm")
	cutscene:text("* It felt like some kind of dream,[wait:5] but...", "neutral", "jamm")
	cutscene:text("* Wait,[wait:5] is that really what's important right now?", "stern", "jamm")
	cutscene:text("* We need to figure out how we're going to get home.", "stern", "jamm")
	
	cutscene:look(jamm, "left")
	cutscene:look(susie, "left")
	
	if Game:getFlag("future_variable") == "ceroba_dw" then	-- Add more cases
		cutscene:showNametag("Ceroba")
		cutscene:text("* Jamm is right.[wait:5]\n* I need to get back home to Kanako.", "closed_eyes", "ceroba")
	end
	
	cutscene:showNametag("Susie")
	cutscene:text("* Then what are we waiting for?", "sincere_smile", "susie")
	cutscene:look(susie, "down")
	cutscene:hideNametag()
	
	cutscene:interpolateFollowers()
	cutscene:attachFollowers()
end
