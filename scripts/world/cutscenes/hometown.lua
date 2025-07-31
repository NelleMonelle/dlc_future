return {
	town_hall_chair = function(cutscene, event)
		cutscene:text("* (You could've sworn there was a chair here...)")
		if cutscene:getCharacter("susie") and cutscene:getCharacter("jamm") and not Game:getFlag("future_jamm_susie_bet") then
			cutscene:showNametag("Jamm")
			cutscene:text("* 50 D$ says it's being used to barricade that door over there.", "smirk", "jamm")
			cutscene:showNametag("Susie")
			cutscene:text("* You're on,[wait:5] Jamm.", "smile", "susie")
			cutscene:hideNametag()
			Game:setFlag("future_jamm_susie_bet", true)
		end
    end,
	
	town_hall_door = function(cutscene, event)
		cutscene:text("* It's a door to the rest of town hall.")
		if cutscene:getCharacter("susie") and cutscene:getCharacter("jamm") and Game:getFlag("future_jamm_susie_bet") and not Game:getFlag("future_jamm_susie_door") then
			cutscene:text("* You check to see how it's being blocked...")
			cutscene:text("* The door seems to be barricaded using a chair.[react:1][react:2]", nil, nil, {reactions={
				{"Pay up, Susie.", 160, 61, "smirk", "jamm"},
				{"DAMN IT!!", 352, 61, "teeth", "susie"},
			}})
			Game:setFlag("future_jamm_susie_door", true)
		end
    end,

    hospitalroom2bed = function(cutscene, event)
        if Game:getFlag("POST_SNOWGRAVE") then
            cutscene:text("* (He's no longer breathing...)")
        else
            cutscene:text("* (It's an empty bed.)")
        end
    end,
}
