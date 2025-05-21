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
		
		event:remove()
		
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
		cutscene:text("* ...You're right,[wait:5] Jamm.", "smile", "susie")
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
		
        local fmarcy = cutscene:getCharacter("fmarcy")
		fmarcy.x = 620
		fmarcy.y = 240
		
		cutscene:wait(cutscene:walkToSpeed(fmarcy, "fmarcy_walkto", 8, "left"))
		
		cutscene:look(jamm, "right")
		cutscene:look(susie, "right")
		cutscene:look(variant, "right")
		
        cutscene:showNametag("Marcy")
		cutscene:text("* What was that?", "neutral", "fmarcy")
        cutscene:hideNametag()
		
		cutscene:alert(fmarcy)
		cutscene:wait(1)
		
        cutscene:walkTo(susie, susie.x - 120, susie.y, 0.75, "right", true)
        cutscene:walkTo(jamm, jamm.x - 110, jamm.y, 0.75, "right", true)
        cutscene:walkTo(variant, variant.x - 130, variant.y, 0.75, "right", true)
		cutscene:wait(cutscene:walkTo(fmarcy, fmarcy.x - 160, fmarcy.y, 0.75, "up"))
		
		cutscene:wait(0.25)
		
        cutscene:showNametag("Marcy")
		cutscene:text("* Huh...[wait:10]\n* How interesting...", "closed", "fmarcy")
		cutscene:look(fmarcy, "left")
		cutscene:text("* You three seem to have uncovered a secret passage.", "neutral", "fmarcy")
		cutscene:text("* And it's even in the direction of Hometown...", "untrusting", "fmarcy")
        cutscene:hideNametag()
    end,
	
	warp_bin_note = function(cutscene, event)
        cutscene:text("* To whoever keeps stealing the Warp Bin,[wait:5] please stop it.")
        cutscene:text("* We only have so many of these things left.")
        cutscene:text("* (...Attached is a note cussing out the person who wrote the first note.)")
    end,
	
	fmarcy = function(cutscene, event)
        cutscene:showNametag("Marcy")
		cutscene:text("* Well,[wait:5] welcome back to the hub where it all started.", "neutral", "fmarcy")
		cutscene:text("* Or at least,[wait:5] what's left of it,[wait:5] anyways...", "closed", "fmarcy")
		cutscene:text("* Too bad our training didn't finish when it mattered...", "lookright", "fmarcy")
        cutscene:hideNametag()
    end,
	
	fnoelle = function(cutscene, event)
        cutscene:showNametag("Noelle")
		cutscene:text("* It all happened so fast,[wait:5] and we...", "neutral", "noelle")
		cutscene:text("* We were completely unprepared for it.", "neutral", "noelle")
        cutscene:hideNametag()
    end
}
return hub
