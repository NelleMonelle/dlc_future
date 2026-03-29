return {
	progress = function(cutscene, event)
		cutscene:showNametag("Marcy")
		cutscene:text("* We're so close to finishing our mission...", "neutral", "fmarcy")
		cutscene:hideNametag()
		cutscene:wait(cutscene:walkTo(Game.world.player, Game.world.player.x + 40, Game.world.player.y, 1))
    end,
	
	slitherer = function(cutscene, event)
		Game:setFlag("future_f_slitherer", true)
		cutscene:showNametag("Marcy")
		cutscene:text("* Another one of these things...", "neutral", "fmarcy")
		if Game:getFlag("future_variable") == "ceroba" then
			cutscene:showNametag("Kanako")
			cutscene:text("* We just can't catch a break, can we?", "unimpressed", "fkanako")
		end
		cutscene:hideNametag()
		local s = cutscene:getCharacter("slitherer")
		local w, e = cutscene:startEncounter("slitherer", true, {s}, {wait = false})
		s:remove()
		cutscene:wait(function() return w end)
    end,
	
	spawn = function(cutscene, event)
		Game:setFlag("future_f_spawn", true)
		local s1 = Game.world:addChild(TitanSpawnOverworld(Game.world.player.x + 220, Game.world.player.y - 20, nil, false))
		cutscene:wait(0.4)
		local s2 = Game.world:addChild(TitanSpawnOverworld(Game.world.player.x - 200, Game.world.player.y - 130, nil, true))
		cutscene:wait(0.4)
		local s3 = Game.world:addChild(TitanSpawnOverworld(Game.world.player.x - 260, Game.world.player.y + 110, nil, true))
		cutscene:wait(1)
		cutscene:showNametag("Marcy")
		cutscene:text("* Huh...[wait:5] That's new.", "closed", "fmarcy")
		cutscene:showNametag("Noelle")
		cutscene:text("* And yet somehow,[wait:5] familiar...", "tense/guilty_1", "fnoelle")
		cutscene:hideNametag()
		Game.world.timer:tween(0.8, s1, {alpha = 0})
		Game.world.timer:tween(0.8, s2, {alpha = 0})
		Game.world.timer:tween(0.8, s3, {alpha = 0})
		cutscene:wait(1)
		cutscene:startEncounter("spawn_solo")
		if Game:getFlag("future_variable") == "ceroba" then
			cutscene:showNametag("Kanako")
			cutscene:text("* That...[wait:5] was creepy...", "shock", "fkanako")
		end
		cutscene:showNametag("Marcy")
		cutscene:text("* Did you two feel that?[wait:10]\n* It somehow restricted us.", "closed", "fmarcy")
		cutscene:showNametag("Noelle")
		cutscene:text("* And how easy it was to...", "shaded/scared_shade_2", "fnoelle")
		cutscene:showNametag("Marcy")
		cutscene:text("* ...", "closed", "fmarcy")
		cutscene:text("* Let's keep going.", "neutral", "fmarcy")
    end,
	
	chase = function(cutscene, event)
		cutscene:wait(cutscene:mapTransition("flashback/field_4", "marcy_marker"))
		local fmarcy = cutscene:getCharacter("fmarcy")
		local fnoelle = cutscene:getCharacter("fnoelle")
		local fvariant = cutscene:getCharacter(Game.party[3].id)
		
		cutscene:detachFollowers()
		
		fnoelle.x = 160
		fnoelle.y = 3120
		
		fvariant.x = 480
		fvariant.y = 3120
		
		cutscene:walkToSpeed(fnoelle, fnoelle.x, fnoelle.y - 280, 6)
		cutscene:walkToSpeed(fvariant, fvariant.x, fvariant.y - 280, 6)
		cutscene:wait(cutscene:walkToSpeed(fmarcy, fmarcy.x, fmarcy.y - 280, 6))
		
		cutscene:showNametag("Marcy", {top=true})
		cutscene:text("* ...The Knight must be up ahead.", "closed", "fmarcy", {top=true})
		if Game:getFlag("future_variable") == "ceroba" then
			cutscene:showNametag("Kanako", {top=true})
			cutscene:text("* Great![wait:10]\n* We can just--", "shock", "fkanako", {auto=true,top=true})
		end
		cutscene:hideNametag()
		
		-- TODO: Knight wind
		
		Assets.playSound("knightroar")
		
		cutscene:wait(0.4)
		
		fmarcy:setSprite("heavy_walk_1")
		fmarcy.scarf = fmarcy:addChild(Sprite("party/future_marcy/dark/scarf_flap_1"))
		fmarcy.scarf:setAnimation({"party/future_marcy/dark/scarf_flap", 1/15, true})
		-- TODO: Heavy walk for F!Noelle and F!Variant
		
		cutscene:slideTo(fmarcy, fmarcy.x, fmarcy.y + 40, 0.6, "out-cubic")
		cutscene:slideTo(fnoelle, fnoelle.x, fnoelle.y + 40, 0.6, "out-cubic")
		cutscene:slideTo(fvariant, fvariant.x, fvariant.y + 40, 0.6, "out-cubic")
		
		cutscene:wait(3.4)
		
		cutscene:showNametag("Marcy", {top=true})
		cutscene:text("* The hell is this wind...!", "mad", "fmarcy", {top=true})
		cutscene:hideNametag()
		
		local sword = Sprite("bullets/world/knight_sword")
		sword:setOrigin(0.5, 0)
		sword.x = 480
		sword.y = 2520
		sword.alpha = 0
		sword:setScale(2)
		sword:setLayer(WORLD_LAYERS["above_events"])
		Game.world:addChild(sword)
		
		Assets.playSound("knight_jump_quick")
		
		Game.world.timer:tween(0.4, sword, {alpha = 1})
		cutscene:wait(0.5)
		
		Game.world.timer:tween(0.3, sword, {color = {1, 0, 0}})
		Game.world.timer:tween(0.3, sword, {y = 2480}, "out-quad")
		cutscene:wait(0.3)
		
		sword:remove()
		
		local swords = {}
		
		Assets.playSound("t_down")
		
		for i=1, 8 do
			local sword = Sprite("bullets/world/knight_sword")
			sword:setOrigin(0.5, 0)
			sword.x = 480
			sword.y = 2520 + ((i-1) * 60)
			sword.alpha = (1/9) * i
			sword:setScale(2)
			sword:setLayer(WORLD_LAYERS["above_events"])
			Game.world:addChild(sword)
			table.insert(swords, sword)
		end
		
		cutscene:wait(0.1)
		
		for i=8, 1, -1 do
			swords[i]:remove()
		end
		
		Game.world.music:play("creepychase")
		
		Game.world:addChild(DamageNumber("msg", "down", fvariant.x + 20, fvariant.y - 50))
		
		cutscene:slideTo(fvariant, fvariant.x, fvariant.y + 200, 0.1)
		
		cutscene:wait(1)
		
		cutscene:showNametag("Noelle", {top=true})
		cutscene:text("* " .. Game.party[3]:getName() .. "!!", "normal/shocked", "fnoelle", {top=true})

		if Game:getFlag("future_variable") == "ceroba" then
			cutscene:showNametag("Kanako", {top=true})
			cutscene:text("* I-I'm okay...!", nil, "fkanako", {top=true})
			cutscene:text("* Go on without me![wait:10]\n* I'll catch up!", nil, "fkanako", {top=true})
		end
		
		cutscene:showNametag("Marcy", {top=true})
		cutscene:text("* Now or never,[wait:5] Noelle!", "shaded_neutral", "fmarcy", {top=true})
		cutscene:hideNametag()
		
		Game.world:setBattle(true)
    end,
	
	wip = function(cutscene, event)
		cutscene:text("* flashback not finish :(")
		cutscene:gotoCutscene("hometown.end_flashback")
    end,
}
