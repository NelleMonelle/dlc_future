local hub = {
	wall = function(cutscene, event)
        -- Open textbox and wait for completion
        cutscene:text("* The wall seems cracked.")
		
		if not Game:getFlag("future_exhausted_all_options") then
			cutscene:showNametag("Susie")
			cutscene:text("* ...", "neutral", "susie")
			cutscene:text("* As much as I want to,[wait:5] this seems like a last resort.", "annoyed", "susie")
			cutscene:hideNametag()
			return
		end
		
		Game:setFlag("broke_wall_future", true)
    
        local susie = cutscene:getCharacter("susie")
        local jamm = cutscene:getCharacter("jamm")
        local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
        cutscene:detachCamera()
        cutscene:detachFollowers()
    
        cutscene:showNametag("Susie")
		cutscene:text("* ...", "neutral", "susie")
		
        cutscene:showNametag("Jamm")
		cutscene:text("* You've got this,[wait:5] Susie.[wait:10]\n* Take a deep breath.", "side_smile", "jamm")
    
        cutscene:showNametag("Susie")
		cutscene:text("* ...You're right, Jamm.", "smile", "susie")
		cutscene:text("* Let's do this.", "smile", "susie")
        cutscene:hideNametag()
    
        local x = event.x + event.width/2
        local y = event.y + event.height/2

        cutscene:walkTo(susie, x, y + 40, 0.75, "up")
        cutscene:walkTo(jamm, x - 60, y + 100, 0.75, "up")
        cutscene:walkTo(variant, x + 60, y + 100, 0.75, "up")
        
        cutscene:wait(1.5)
        
        cutscene:wait(cutscene:walkTo(susie, x, y + 60, 0.5, "up", true))
		
		cutscene:wait(1)
		cutscene:look(susie, "left")
		cutscene:wait(1)
		cutscene:look(susie, "right")
		cutscene:wait(1)
		cutscene:look(susie, "up")
		cutscene:wait(1)
		
        cutscene:wait(cutscene:walkTo(susie, x, susie.y + 20, 0.5, "up", true))
        cutscene:wait(cutscene:walkTo(susie, x, y + 20, 0.2))
        
        Assets.playSound("impact")
		local layer = Game.world.map:getTileLayer("tile_hidden")
		layer.visible = true
        susie:shake(4)
        susie:setSprite("shock_up")
        
        cutscene:slideTo(susie, x, y + 40, 0.1)
        cutscene:wait(1.5)
    
        cutscene:showNametag("Susie")
		cutscene:text("*", "surprise", "susie")
    
        cutscene:showNametag("Jamm")
		cutscene:text("* ...Remind me to never get on your bad side,[wait:5] Susie.", "nervous", "jamm")
		
		cutscene:resetSprite(susie)
		cutscene:look(susie, "down")
    
        cutscene:showNametag("Susie")
		cutscene:text("* I actually surprised myself there!", "surprise_smile", "susie")
        cutscene:hideNametag()
    end
}
return hub
