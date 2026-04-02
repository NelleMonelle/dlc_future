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
		
		Game.world.cw = Game.world:addChild(ChurchWind(0, 2480))
		Game.world.cw:setLayer(WORLD_LAYERS["above_events"])
		
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
		
		Game.world.music:play("creepychase", 1)
		
		Assets.playSound("t_down", 0.35)
		
		Game.world:addChild(DamageNumber("msg", "down", fvariant.x + 20, fvariant.y - 50))
		
		cutscene:slideTo(fvariant, fvariant.x, fvariant.y + 200, 0.2)
		
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
		Game.world.player:setState("WINDWALK")
		
		Game:setFlag("tempflag2", Game.party[3].id)
		
		Game:removePartyMember("fnoelle")
		Game:removePartyMember(Game.party[2].id)
    end,
	
	end_chase = function(cutscene, event)
		Game.world:setBattle(false)
		Game.world.player:setState("WALK")
		Game.world.player:resetSprite()
		Game.world.player:setSprite("heavy_walk_1")
		Game.world.cw:remove()
		Game:setPartyMembers("fmarcy", "fnoelle", Game:getFlag("tempflag2", "fkanako"))
		
		Game.world.music:fade(0, 1)
		
		cutscene:wait(1)
		
		cutscene:shakeCharacter(Game.world.player, 4)
		Game.world.player:resetSprite()
		cutscene:look(Game.world.player, "up")
		Assets.playSound("wing")
		Game.world.player.scarf:remove()
		
		cutscene:wait(1)
		
		cutscene:showNametag("Marcy")
		cutscene:text("* ...That was quite the onslaught...", "closed", "fmarcy")
		if Game.party[1].health == 1800 then
			-- TODO: Knight chase no-hit achievement
			cutscene:text("* Made it through unharmed,[wait:5] sure,[wait:5] but still...", "neutral", "fmarcy")
		end
		cutscene:text("* ...Hope that made the Knight more tired.", "closed", "fmarcy")
		cutscene:hideNametag()
		
		Game.world.player:walkTo(Game.world.player.x, 80, 3)
		
		cutscene:wait(cutscene:fadeOut(3))
		
		cutscene:loadMap("flashback/field_5", 320, 1200)
		
		local fmarcy = cutscene:getCharacter("fmarcy")
		local fnoelle = cutscene:getCharacter("fnoelle")
		local fvariant = cutscene:getCharacter(Game.party[3].id)
		
		cutscene:detachFollowers()
		
		fnoelle.x = 320
		fnoelle.y = 920
		
		fvariant.x = 320
		fvariant.y = 1280
		
		cutscene:wait(cutscene:fadeIn(0.75))
		cutscene:wait(cutscene:walkToSpeed(Game.world.player, 320, 1000, 4))
		
		cutscene:look(fnoelle, "down")
		cutscene:showNametag("Marcy")
		cutscene:text("* Glad that's over...", "closed", "fmarcy")
		cutscene:showNametag("Noelle")
		cutscene:text("* You could say that again.", "tense/guilty_1", "fnoelle")
		cutscene:look(fnoelle, "up")
		cutscene:text("* But we're not done for too long...", "normal/neutral", "fnoelle")
		cutscene:hideNametag()
		
		cutscene:detachCamera()
		
		cutscene:wait(cutscene:panTo(320, 160, 2))
		cutscene:wait(1)
		
		cutscene:showNametag("Marcy")
		cutscene:text("* We made it.[wait:10]\n* The Knight is within our reach.", "neutral", "fmarcy")
		cutscene:text("* Just what are they planning...?", "mad", "fmarcy")
		cutscene:showNametag("Noelle")
		cutscene:text("* Do they even know we're here...?", "normal/scared", "fnoelle")
		cutscene:hideNametag()
		
		fvariant.y = 1100
		
		cutscene:wait(cutscene:attachCamera(2))
		
		cutscene:showNametag("Marcy")
		cutscene:text("* Come on,[wait:10] you two.[wait:5]\n* Let's finish this.", "closed", "fmarcy")
		cutscene:hideNametag()
		
		cutscene:wait(cutscene:attachFollowers(4))
    end,
	
	ENGAGE = function(cutscene, event)	-- no I did not have caps lock on
		local fmarcy = cutscene:getCharacter("fmarcy")
		local fnoelle = cutscene:getCharacter("fnoelle")
		local fvariant = cutscene:getCharacter(Game.party[3].id)
		
		local knight = cutscene:getCharacter("knight")
		
		cutscene:detachFollowers()
		
		cutscene:showNametag("Marcy")
		cutscene:text("* Hold on...", "neutral", "fmarcy")
		cutscene:hideNametag()
		
		cutscene:walkToSpeed(fmarcy, 500, 600, 6, "up")
		cutscene:walkToSpeed(fnoelle, 120, 660, 6, "right")
		cutscene:wait(cutscene:walkToSpeed(fvariant, 180, 600, 6, "up"))
		
		cutscene:wait(cutscene:panTo(320, 160, 2))
		cutscene:wait(1)
		
		knight:setSprite("idle")
		
		Game.world.timer:tween(0.8, knight, {x = 390}, "in-out-back")
		cutscene:wait(1.2)
		
		Assets.playSound("knight_cut")
		knight:setAnimation("attack_nl")
		cutscene:wait(3/25)
		
		local rift = Sprite("world/cutscenes/great_tear")
		rift:setScale(0.03)
		rift:setOrigin(0.5)
		rift:setLayer(0.2)
		rift.x = 320
		rift.y = 160
		
		Game.world:addChild(rift)
		
		Game.world.timer:tween(0.6, rift, {scale_y = 2}, "out-cubic")
		cutscene:wait(0.6)
		
		Assets.playSound("battleenter")
		Game.world.timer:tween(0.6, rift, {scale_x = 2}, "in-quart")
		cutscene:wait(0.6)
		
		Assets.playSound("ominous_shine")
		
		local rift2 = Sprite("world/cutscenes/great_tear")
		rift2:setScale(0.2)
		rift2:setOrigin(0.5)
		rift2:setLayer(2)
		rift2.x = 320
		rift2.y = 160
		rift2.alpha = 0.5
		
		Game.world:addChild(rift2)
		Game.world.timer:tween(0.5, rift2, {scale_x = 2.5, scale_y = 2.5, alpha = 0}, "in-quart")
		cutscene:wait(1.3)
		
		knight:setSprite("idle")
		cutscene:wait(0.2)
		
		Game.world.timer:tween(0.8, knight, {x = 320}, "in-out-back")
		cutscene:wait(1.3)
		
		knight:setSprite("looking_up")
		
		Game.world.timer:tween(0.8, knight, {y = 360}, "out-cubic")
		cutscene:wait(1.3)
		
		cutscene:wait(cutscene:panTo(320, 560, 2))

		if Game:getFlag("future_variable") == "ceroba" then
			cutscene:showNametag("Kanako")
			cutscene:text("* That's the biggest rift I've ever seen...!", "shock", "fkanako")
		end
		
		cutscene:showNametag("Marcy")
		cutscene:text("* Unstable too...", "mad", "fmarcy")
		
		cutscene:showNametag("Noelle")
		cutscene:text("* Where do you think it leads?", "normal/neutral", "fnoelle")
		
		cutscene:look(fmarcy, "left")
		cutscene:look(fvariant, "right")
		
		cutscene:showNametag("Marcy")
		cutscene:text("* I don't know, but one thing's for sure...", "neutral", "fmarcy")
		cutscene:text("* We have to--", "neutral", "fmarcy", {auto = true})
		cutscene:hideNametag()
    end,
	
	wip = function(cutscene, event)
		cutscene:text("* flashback not finish :(")
		cutscene:gotoCutscene("hometown.end_flashback")
    end,
}
