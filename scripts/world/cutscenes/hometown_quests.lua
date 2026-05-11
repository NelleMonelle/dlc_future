return {
	fkanako = function(cutscene, event)
		local fkanako = Game.world:getCharacter("fkanako")
		fkanako:facePlayer()
		cutscene:showNametag("Kanako")
		if Game:getFlag("fkanako_quest_completed") then
			cutscene:text("* This place is quite peaceful.", "neutral", "fkanako")
			cutscene:text("* When I have some free time,[wait:5] I usually spend it here.", "eyes_left", "fkanako")
			cutscene:text("* Here,[wait:5] or in the camp.", "neutral", "fkanako")
			cutscene:text("* Honestly,[wait:5] I would like to see Star,[wait:5] or the rest of the Feisty Five...", "sad", "fkanako")
			cutscene:text("* But,[wait:5] there are people that rely on me here.", "neutral", "fkanako")
			cutscene:text("* I can't just abandon them.", "sad", "fkanako")
		else
			cutscene:text("* Martlet should arrive here soon,[wait:5] with a daily report.", "neutral", "fkanako")
			cutscene:text("* While I don't really need you three...", "eyes_right", "fkanako")
			cutscene:text("* Marcy and Noelle ARE usually present here for this.", "neutral", "fkanako")
			cutscene:text("* ...[wait:5] or,[wait:5] well,[wait:5] at least one of them.", "unimpressed", "fkanako")
			local choice = cutscene:textChoicer("* Should we wait for her?", {"Yes", "No"}, "neutral", "fkanako")
			if choice == 1 then
				fkanako.quest_hint:remove()
				-- start the quest here
			else
				cutscene:text("* We should still have some time before she arrives.", "closed", "fmarcy")
				cutscene:text("* Alright.[wait:5] Just tell me if you change your mind.", "neutral", "fkanako")
			end
		end
		cutscene:hideNametag()
		fkanako:setFacing("down")
    end,
}
