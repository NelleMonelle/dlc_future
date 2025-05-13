return function(cutscene)
    cutscene:text("* The warp bin is so damaged, it doesn't even seem to open anymore.")
	
	if not Game:getFlag("future_bin_checked") then
		Game:setFlag("future_bin_checked", true)
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* This thing is really dented...", "default", "ceroba")
			cutscene:text("* I can only imagine something heavy did this.", "default", "ceroba")
			-- F!Kanako: Either that,[wait:5] or something really strong...
			-- F!Kanako: Those Roaring creatures are tough to take down sometimes...
		end
		
		if not Game:getFlag("future_elevator_checked") then
			cutscene:showNametag("Jamm")
			cutscene:text("* Hey,[wait:5] chin up![wait:10]\n* We still gotta check the elevator!", "side_smile", "jamm")
			if not Game:getFlag("future_fountain_checked") then
				cutscene:showNametag("Susie")
				cutscene:text("* And we haven't checked the fountain either...", "nervous", "susie")
			end
		elseif not Game:getFlag("future_fountain_checked") then
			cutscene:showNametag("Susie")
			cutscene:text("* I'm sure we can leave using the fountain,[wait:5] right?", "sincere_smile", "susie")
		else
			
		end
		cutscene:hideNametag()
	end
end