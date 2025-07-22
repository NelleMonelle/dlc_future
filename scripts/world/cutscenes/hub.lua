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
		cutscene:panTo(460, 604)
        
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
		cutscene:look(fmarcy, "up")
		cutscene:text("* Seeing as we have no other way of exiting this hub...", "neutral", "fmarcy")
		cutscene:text("* I'll go get my team.", "neutral", "fmarcy")
        cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(fmarcy, fmarcy.x + 160, fmarcy.y, 4))
		cutscene:wait(cutscene:walkToSpeed(fmarcy, fmarcy.x, fmarcy.y - 360, 4))
    
		cutscene:look(variant, "left")
        cutscene:showNametag("Jamm")
		cutscene:text("* Wow, she's uh...[wait:10]\n* Really grown up...", "nervous", "jamm")
    
		cutscene:look(susie, "down")
        cutscene:showNametag("Susie")
		cutscene:text("* You seem upset,[wait:5] Jamm...", "surprise", "susie")
    
		cutscene:look(jamm, "up")
        cutscene:showNametag("Jamm")
		cutscene:text("* Well,[wait:5] don't get me wrong.[wait:10] I'm proud of her.", "nervous", "jamm")
		cutscene:text("* It's just...[wait:10]\n* How do I say this...", "nervous_left", "jamm")
		cutscene:text("* Being a soldier isn't the life I hoped she'd have.", "worried", "jamm")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:look(variant, "down")
		end
		cutscene:text("* I wanted her to be able to live her life happily,[wait:5] but...", "worried", "jamm")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			variant:setSprite("shadowed_down")
		end
		cutscene:text("* I just...[wait:10]\n* Couldn't bring that to her...", "worried_down", "jamm")
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Ceroba")
			cutscene:text("* ...", "sorrowful", "ceroba")
			
			cutscene:look(jamm, "right")
			cutscene:showNametag("Jamm")
			cutscene:text("* I-I'm sorry,[wait:5] Ceroba,[wait:5] I didn't mean to--", "speechless", "jamm", {auto=true})
			
			cutscene:showNametag("Ceroba")
			cutscene:text("* No,[wait:5] don't worry.[wait:10]\n* I'm okay.", "sorrowful", "ceroba")
			cutscene:resetSprite(variant)
			cutscene:text("* Kanako turned out fine,[wait:5] after all.", "mourning", "ceroba")
		end
        cutscene:hideNametag()
		
        local fvariant = Game.world:getEvent(107)
		fvariant.x = fmarcy.x - 20
		fvariant.y = fmarcy.y - 50
		local fnoelle = Game.world:spawnNPC("fnoelle", fmarcy.x + 20, fmarcy.y - 70)
		cutscene:walkToSpeed(fmarcy, fmarcy.x, fmarcy.y + 360, 4)
		cutscene:walkToSpeed(fnoelle, fnoelle.x, fnoelle.y + 360, 4)
		cutscene:wait(cutscene:walkToSpeed(fvariant, fvariant.x, fvariant.y + 360, 4))
		cutscene:look(fmarcy, "left")
		cutscene:look(fnoelle, "left")
		cutscene:look(fvariant, "left")
		cutscene:look(jamm, "right")
		cutscene:look(susie, "right")
		cutscene:look(variant, "right")
		
		cutscene:showNametag("Marcy")
		cutscene:text("* It's over here.", "neutral", "fmarcy")
        cutscene:showNametag("Noelle")
		cutscene:text("* I see...", "neutral", "noelle")
        cutscene:hideNametag()
		
		cutscene:walkToSpeed(fvariant, fvariant.x - 140, fvariant.y + 60, 4, "up")
		cutscene:wait(cutscene:walkToSpeed(fnoelle, fnoelle.x - 180, fnoelle.y + 40, 4, "up"))
		
        cutscene:showNametag("Noelle")
		cutscene:text("* I wonder where it leads...", "neutral", "noelle")
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Kanako")
			cutscene:text("* Only one way to find out,[wait:5] right?", "neutral", "fkanako")
		end
        cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(fnoelle, fnoelle.x, fnoelle.y - 40, 4, "up"))
		
		Game.world.timer:tween(0.8, fnoelle, {alpha = 0})
		cutscene:wait(0.8)
		fnoelle:remove()
		
		cutscene:wait(cutscene:walkToSpeed(fvariant, fvariant.x, fvariant.y - 80, 4, "up"))
		
		Game.world.timer:tween(0.8, fvariant, {alpha = 0})
		cutscene:wait(0.8)
		fvariant:remove()
		
		cutscene:wait(cutscene:walkToSpeed(fmarcy, fmarcy.x - 160, fmarcy.y, 4, "up"))
		
		cutscene:showNametag("Marcy")
		cutscene:text("* (...No wonder why Susie wanted to break this thing.)", "closed", "fmarcy")
        cutscene:hideNametag()
		
		cutscene:wait(cutscene:walkToSpeed(fmarcy, fmarcy.x, fmarcy.y - 80, 4, "up"))
		
		Game.world.timer:tween(0.8, fmarcy, {alpha = 0})
		cutscene:wait(0.8)
		fmarcy:remove()
		
		cutscene:interpolateFollowers()
		cutscene:attachFollowers(8)
		cutscene:wait(cutscene:attachCamera())
    end,
	
	warp_bin_note = function(cutscene, event)
        cutscene:text("* To whoever keeps stealing the Warp Bin,[wait:5] please stop it.")
        cutscene:text("* We only have so many of these things left.")
        cutscene:text("* (...Attached is a note cussing out the person who wrote the first note.)")
    end,
	
	fmarcy = function(cutscene, event)
		if not event.talked_to_once_lol then
			cutscene:showNametag("Marcy")
			cutscene:text("* Well,[wait:5] welcome back to the hub where it all started.", "neutral", "fmarcy")
			cutscene:text("* Or at least,[wait:5] what's left of it,[wait:5] anyways...", "closed", "fmarcy")
			cutscene:text("* Too bad our training didn't finish when it mattered...", "lookright", "fmarcy")
			event.talked_to_once_lol = true
		elseif not event.talked_to_twice_lol then
			cutscene:showNametag("Jamm")
			cutscene:text("* So do you guys have a version of \"We Didn't Start the Fire\"?", "neutral", "jamm")
			cutscene:showNametag("Marcy")
			cutscene:text("* What's the point in making something like that,[wait:5] dad?", "neutral", "fmarcy")
			cutscene:text("* Not like we'd be singing it for long...", "closed", "fmarcy")
			cutscene:text("* ...But yes,[wait:5] we do.", "neutral", "fmarcy")
			event.talked_to_twice_lol = true
		else
			cutscene:showNametag("Jamm")
			cutscene:text("* ...Are you gonna sing it later?", "nervous", "jamm")
			cutscene:showNametag("Marcy")
			cutscene:text("* My singing voice isn't as good as yours,[wait:5] dad.", "neutral", "fmarcy")
			cutscene:text("* I don't think you want to hear it.", "neutral", "fmarcy")
		end
        cutscene:hideNametag()
    end,
	
	fnoelle = function(cutscene, event)
        cutscene:showNametag("Noelle")
		cutscene:text("* It all happened so fast,[wait:5] and we...", "neutral", "noelle")
		cutscene:text("* We were completely unprepared for it.", "neutral", "noelle")
        cutscene:hideNametag()
    end,
	
	variant = function(cutscene, event)
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Kanako")
			cutscene:text("* You three might be the only ones to remember how this worked...", "neutral", "fkanako")
			cutscene:text("* It's rare to see one that isn't destroyed.", "neutral", "fkanako")
		end
        cutscene:hideNametag()
	end,
	
	light = function(cutscene, event)
		local jamm = cutscene:getCharacter("jamm")
		local susie = cutscene:getCharacter("susie")
		cutscene:detachFollowers()
		cutscene:detachCamera()
		cutscene:showNametag("Susie")
		cutscene:text("* I can't even see anything...", "neutral", "susie")
		cutscene:showNametag("Jamm")
		cutscene:text("* Leave that to me,[wait:5] Susie.", "smug", "jamm")
        cutscene:hideNametag()
		Game:setFlag("future_jamm_light", true)
		Game:setFlag("future_jamm_thunderbolt", Game:getPartyMember("jamm"):checkArmor("flowerbrace"))
		if Game:getPartyMember("jamm"):checkArmor("flowerbrace") then
			local shock = Sprite("party/jamm/dark/special/shock")
			shock:setOrigin(0.5, 1)
			shock:setLayer(Game.world.followers[1].layer - 0.1)
			shock:setScale(2, 2)
			shock.x = jamm.x + 6
			shock.y = jamm.y - 12
			Game.world:spawnObject(shock)
			Game.world.map.darkness_override = 0
			Assets.playSound("shock", 0.5)
			jamm.actor.default = "walk_thunder"
			cutscene:resetSprite(jamm)
			Game.world.player:setFacing("down")
			local ls = LightSource(jamm.width/2, jamm.height/2, 80)
			jamm:addChild(ls)
			Game.world.timer:tween(0.65, shock, {alpha = 0})
			Game.world.timer:tween(0.65, Game.world.map, {darkness_override = 1})
			cutscene:wait(0.2)
			cutscene:setSprite(susie, "shock_down")
			cutscene:slideTo(susie, susie.x, susie.y - 30, 0.3, "out-cubic")
			Assets.playSound("sussurprise")
			cutscene:wait(0.8)
			cutscene:showNametag("Susie")
			cutscene:text("* D-don't do that,[wait:5] dumbass!!!", "teeth", "susie")
			cutscene:resetSprite(susie)
			cutscene:showNametag("Jamm")
			cutscene:text("* ...Haha,[wait:5] whoops![wait:10]\n* Sorry!", "nervous", "jamm")
			cutscene:text("* Guess the FlowerBrace summoned too much lightning.", "nervous_left", "jamm")
			cutscene:text("* But at least we got some light now.", "smile", "jamm")
			cutscene:hideNametag()
		else
			Assets.playSound("noise")
			cutscene:wait(0.65)
			Assets.playSound("noise")
			cutscene:wait(1)
			cutscene:showNametag("Jamm")
			cutscene:text("* Hold on a second...", "stern", "jamm")
			jamm.actor.default = "walk_thunder"
			cutscene:hideNametag()
			cutscene:wait(0.2)
			Assets.playSound("noise")
			cutscene:wait(0.65)
			Assets.playSound("noise")
			cutscene:wait(0.65)
			Assets.playSound("noise")
			cutscene:resetSprite(jamm)
			Game.world.player:setFacing("down")
			local ls = LightSource(jamm.width/2, jamm.height/2, 80)
			jamm:addChild(ls)
			cutscene:wait(0.65)
			cutscene:showNametag("Jamm")
			cutscene:text("* There we go!", "happy", "jamm")
			cutscene:showNametag("Susie")
			cutscene:text("* Dude,[wait:5] hell yeah!", "smile", "susie")
			cutscene:hideNametag()
		end
		local sx = susie.x
		local sy = susie.y
		
		jamm = jamm:convertToPlayer()
		local ls = LightSource(jamm.width/2, jamm.height/2, 80)
		jamm:addChild(ls)
        susie = susie:convertToFollower(1)
        Game:movePartyMember("jamm", 1)
		cutscene:alignFollowers("up")
		cutscene:attachFollowers(8)
		cutscene:wait(cutscene:attachCamera(1))
	end
}
return hub
