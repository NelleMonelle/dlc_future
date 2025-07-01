return function(cutscene, event)
	if Game:isDessMode() then
		local realdess = Game.world.player
		local dess = cutscene:getCharacter("dess")
		realdess.x = 360
		realdess.y = 280
        local alpha = realdess:addFX(AlphaFX())
        Game.world.timer:tween(0, alpha, { alpha = 0 })
	
		cutscene:wait(1)

		cutscene:setSprite(dess, "beatbox")
		cutscene:wait(cutscene:slideTo(dess, "jamm_land", 0.5))
		cutscene:setSprite(dess, "battle/defeat_1")
		cutscene:shakeCharacter(dess, 4)
		Assets.playSound("impact")
		cutscene:wait(3)

        Assets.playSound("vaporized", 1.2)

        local sprite = dess.sprite

        sprite.visible = false

        local death_x, death_y = sprite:getRelativePos(0, 0, self)
        local death
        death = DustEffect(sprite:getTexture(), death_x, death_y, true, function() dess:remove() end)

        death:setColor(sprite:getDrawColor())
        death:setScale(sprite:getScale())
        dess:addChild(death)
        cutscene:wait(5)

        Game.world.timer:tween(1, alpha, { alpha = 1 })
        Assets.playSound("hypnosis")
        cutscene:wait(2)

		realdess:setFacing("left")
		cutscene:wait(1/5)
		realdess:setFacing("right")
		cutscene:wait(1/5)
		realdess:setFacing("up")
		cutscene:wait(1/5)
		realdess:setFacing("down")
		cutscene:wait(1)

		cutscene:showNametag("Dess")
		cutscene:text("* man where tf am i", "angy", "dess")
		cutscene:text("* thats the last time im touching weird vortex thingies", "annoyed", "dess")
		cutscene:hideNametag()
		return
	end
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
	elseif Game:getFlag("future_variable") == "brenda" then
		cutscene:showNametag("Brenda")
		cutscene:text("* Yeah,[wait:5] I really don't wanna live the rest of my days here.", "angry_b", "brenda")
	end
	
	cutscene:showNametag("Susie")
	cutscene:text("* Then what are we waiting for?", "sincere_smile", "susie")
	cutscene:look(susie, "down")
	cutscene:hideNametag()
	
	cutscene:interpolateFollowers()
	cutscene:attachFollowers()
end
