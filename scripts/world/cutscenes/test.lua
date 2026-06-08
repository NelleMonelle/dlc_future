return {
	forge_test = function(cutscene, event)
		if not Game.inventory:hasItem("blackshard") then
			cutscene:text("* Blackshard not found.")
			return
		end
		cutscene:text("* Choose a weapon to forge.")
		
		Input.clear("confirm")
		
		local forge = Game.stage:addChild(DarkForgeMenu())
		
		cutscene:wait(function() return forge.done end)
		
		local answer = forge.current_selecting
		local list = forge.to_items
		local selected = forge.selected
		
		forge:remove()
		
		if not selected then
			cutscene:text("* Forge cancelled.")
		else
			Game.inventory:removeItem("blackshard")
			Game.party[answer]:setWeapon(list[answer])
			cutscene:text("* Check " .. Game.party[answer]:getName() .. "'s weapon and if the BlackShard disappeared.")
		end
    end
}
