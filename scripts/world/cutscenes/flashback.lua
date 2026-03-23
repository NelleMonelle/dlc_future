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
	
	wip = function(cutscene, event)
		cutscene:text("* flashback not finish :(")
		cutscene:gotoCutscene("hometown.end_flashback")
    end,
}
