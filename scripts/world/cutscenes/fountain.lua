
-- WIP cutscene, polish later
---@param cutscene WorldCutscene
return function(cutscene)
    cutscene:text("* (It's been reduced to a glorified pillar of light.)")
	
	if not Game:getFlag("future_fountain_checked") then
		Game:setFlag("future_fountain_checked", true)
		cutscene:showNametag("Susie")
		cutscene:text("* What the hell happened to the fountain???", "surprise_frown", "susie")
		cutscene:showNametag("Noelle")
		cutscene:text("* Well,[wait:5] due to the light and dark worlds merging into one...", "neutral", "fnoelle")
		cutscene:text("* The fountains have crystalized and frozen.", "neutral", "fnoelle")
		cutscene:text("* We can't use it to travel to the \"light world\" anymore...", "neutral", "fnoelle")
		cutscene:showNametag("Susie")
		cutscene:text("* Damn...", "surprise_frown", "susie")
		if not Game:getFlag("future_bin_checked") then
			if Game:getFlag("future_variable") == "ceroba_dw" then
				cutscene:showNametag("Ceroba")
				cutscene:text("* Well,[wait:5] we haven't checked the bin yet, right?", "default", "ceroba")
			end
			if not Game:getFlag("future_elevator_checked") then
				cutscene:showNametag("Jamm")
				cutscene:text("* Yeah,[wait:5] and we need to check the elevator too.", "look_left", "jamm")
			end
		elseif not Game:getFlag("future_elevator_checked") then
			cutscene:showNametag("Jamm")
			cutscene:text("* Our only hope now is the elevator.", "neutral", "jamm")
		else
			Game:setFlag("future_exhausted_all_options", true)
			cutscene:showNametag("Jamm")
			cutscene:text("* So the Warp Bin,[wait:5] elevator,[wait:5] and fountain are all not working...", "neutral", "jamm")
			cutscene:text("* Well,[wait:5] I'm all out of ideas.", "nervous_left", "jamm")
			cutscene:showNametag("Susie")
			cutscene:text("* ...You know,[wait:5] there is always that one wall...", "neutral", "susie")
			cutscene:showNametag("Jamm")
			cutscene:text("* You sure?[wait:10]\n* You couldn't do it before...", "nervous", "jamm")
			cutscene:showNametag("Susie")
			cutscene:text("* I have a feeling about this time.", "smile", "susie")
		end
		cutscene:hideNametag()
	end
end