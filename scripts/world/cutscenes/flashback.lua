return {
	progress = function(cutscene, event)
		cutscene:showNametag("Marcy")
		cutscene:text("* We're so close to finishing our mission...", "neutral", "fmarcy")
		cutscene:hideNametag()
		cutscene:wait(cutscene:walkTo(Game.world.player, Game.world.player.x + 40, 1))
    end,
	
	slitherer = function(cutscene, event)
		Game:setFlag("future_f_slitherer", true)
		cutscene:showNametag("Marcy")
		cutscene:text("* Another one of these things...", "neutral", "fmarcy")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Kanako")
			cutscene:text("* We just can't catch a break, can we?", "neutral", "fkanako")
		end
		cutscene:hideNametag()
		local s = cutscene:getCharacter("slitherer")
		local w, e = cutscene:startEncounter("slitherer", true, {s}, {wait = false})
		s:remove()
		cutscene:wait(function() return w end)
    end,
	
	spawn = function(cutscene, event)
		Game:setFlag("future_f_spawn", true)
		cutscene:text("* (TODO: Figure out the SPAWN spawning.)")
		cutscene:showNametag("Marcy")
		cutscene:text("* Huh...[wait:5] That's new.", "closed", "fmarcy")
		cutscene:showNametag("Noelle")
		cutscene:text("* And yet somehow,[wait:5] familiar...", "neutral", "noelle")
		cutscene:hideNametag()
		local w, e = cutscene:startEncounter("spawn_solo", true, nil, {wait = false})
		cutscene:wait(function() return w end)
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Kanako")
			cutscene:text("* That...[wait:5] was creepy...", "neutral", "fkanako")
		end
		cutscene:showNametag("Marcy")
		cutscene:text("* Did you two feel that?[wait:10]\n* It somehow restricted us.", "closed", "fmarcy")
		cutscene:showNametag("Noelle")
		cutscene:text("* And how easy it was to...", "neutral", "noelle")
		cutscene:showNametag("Marcy")
		cutscene:text("* ...", "closed", "fmarcy")
		cutscene:text("* Let's keep going.", "neutral", "fmarcy")
    end,
}
