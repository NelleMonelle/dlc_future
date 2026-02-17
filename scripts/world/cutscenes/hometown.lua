return {
	not_yet = function(cutscene, event)
		cutscene:showNametag("Jamm")
		cutscene:text("* Wait,[wait:5] didn't Noelle say to go to the graveyard?", "nervous", "jamm")
		cutscene:showNametag("Susie")
		cutscene:text("* Yeah.[wait:10]\n* Where the hell are you going,[wait:5] Jamm?", "nervous", "susie")
		cutscene:hideNametag()
		cutscene:wait(cutscene:walkTo(Game.world.player, Game.world.player.x - 40, Game.world.player.y + 40, 1))
    end,
	
	not_yet_church = function(cutscene, event)
		if not Game:getFlag("future_hometown_graveyard_cutscene") then
			cutscene:showNametag("Jamm")
			cutscene:text("* Wait,[wait:5] didn't Noelle say to go to the graveyard?", "nervous", "jamm")
			cutscene:showNametag("Susie")
			cutscene:text("* Yeah.[wait:10]\n* Where the hell are you going,[wait:5] Jamm?", "nervous", "susie")
			cutscene:hideNametag()
			cutscene:wait(cutscene:walkTo(Game.world.player, Game.world.player.x, Game.world.player.y + 40, 1))
		else
			Assets.playSound("dooropen")
			cutscene:mapTransition("hometown/church/entrance", "south", "up")
			cutscene:wait(0.5)
			Assets.playSound("doorclose")
			cutscene:wait(0.5)
		end
    end,
	
	berdly_graveyard = function(cutscene, event)
		if not Game:getFlag("future_berdly_graveyard") then
			Game:setFlag("future_berdly_graveyard", true)
			cutscene:showNametag("Susie")
			cutscene:text("* Wait,[wait:5] is that...", "nervous_side", "susie")
			cutscene:hideNametag()
			
			local jamm = cutscene:getCharacter("jamm")
			local susie = cutscene:getCharacter("susie")
			local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
			
			local fmarcy = cutscene:getCharacter("fmarcy")
			local fberdly = cutscene:getCharacter("fberdly")
			
			Game.world.music:fade(0, 0.8)
			
			cutscene:wait(cutscene:panTo(440, 320, 1))
			
			cutscene:detachFollowers()
			
			jamm.x = 854.5
			jamm.y = 320
			susie.x = 902.5
			susie.y = 320
			variant.x = 950.5
			variant.y = 320
			
			cutscene:interpolateFollowers()
			cutscene:attachFollowers()
			
			Game.world.music:play("berdly_theme", 1, 1)
			
			cutscene:showNametag("Berdly")
			cutscene:text("* Ah,[wait:5] the Light Reaper has returned.", "neutral", "fberdly")
			cutscene:text("* Tell me,[wait:5] what did you find in that little mission of yours?", "questioning", "fberdly")
			cutscene:showNametag("Marcy")
			cutscene:text("* All reports must be made in writing first,[wait:5] Berdly.", "neutral", "fmarcy")
			cutscene:showNametag("Berdly")
			cutscene:text("* Strict on the rules as always,[wait:5] are you,[wait:5] Marcy?", "doubtful", "fberdly")
			cutscene:text("* I suppose after years of experiencing hackers,[wait:5] I sort of understand.", "smirk", "fberdly")
			cutscene:showNametag("Marcy")
			cutscene:text("* I do what I must to ensure the safety of everyone.", "closed", "fmarcy")
			cutscene:text("* Rules are put in place for a reason,[wait:5] and we must follow them.", "neutral", "fmarcy")
			cutscene:showNametag("Berdly")
			cutscene:text("* But that is why you should tell me!", "surprised", "fberdly")
			cutscene:look(fberdly, "up")
			cutscene:text("* Surely if there's any danger,[wait:5] it's our responsibility to...", "worried_smile", "fberdly")
			cutscene:look(fberdly, "right")
			cutscene:showNametag("Marcy")
			cutscene:text("* You will be briefed on my findings later.", "neutral", "fmarcy")
			cutscene:text("* As a leader,[wait:5] you do deserve to know,[wait:5] but I am following protocol.", "neutral", "fmarcy")
			cutscene:text("* A threat is not imminent,[wait:5] so stand down.", "neutral", "fmarcy")
			cutscene:showNametag("Berdly")
			cutscene:text("* I-I see...[wait:5]\n* That's all I needed to know,[wait:5] then.", "worried_smile", "fberdly")
			cutscene:text("* If that's the case,[wait:5] then I'll be on my...", "look_up", "fberdly")
			cutscene:text("* ...Hold on a moment...", "neutral", "fberdly")
			cutscene:hideNametag()
			
			susie:setSprite("fail_avoid_gaze")
			if Game:hasUnlockedPartyMember("berdly") then
				jamm:setSprite("fail_avoid_gaze")
			end
			
			cutscene:wait(cutscene:panTo(720, 320, 1))
			
			cutscene:wait(cutscene:walkToSpeed(fberdly, fberdly.x, fberdly.y + 40, 5))
			cutscene:wait(cutscene:walkToSpeed(fberdly, fberdly.x + 200, fberdly.y, 5))
			cutscene:look(fmarcy, "right")
			
			cutscene:alert(fberdly)
			fberdly:setSprite("shocked")
			cutscene:shakeCharacter(fberdly, 3)
			
			cutscene:wait(0.5)
			
			cutscene:showNametag("Berdly", {top = true})
			if Game:hasUnlockedPartyMember("berdly") then
				cutscene:text("* S-Susan!?[wait:10] Luthane!?[react:1][react:2]", "surprised", "fberdly", {top = true, reactions={
					{"Crud...", 352, 61, "sus_nervous", "susie"},
					{"", 472, 61, "worried", "jamm"},
				}})
			else
				cutscene:text("* S-Susan!?[react:1]", "surprised", "fberdly", {top = true, reactions={
					{"Crud...", 352, 61, "sus_nervous", "susie"},
				}})
			end
			
			susie:resetSprite()
			jamm:resetSprite()
			fberdly:resetSprite()
			cutscene:text("* What the...[wait:10] How th...", "surprised", "fberdly", {top = true})
			cutscene:text("* How are you here right now!?", "scared", "fberdly", {top = true})
			if Game:hasUnlockedPartyMember("berdly") then
				cutscene:showNametag("Jamm", {top = true})
				cutscene:text("* ...My daughter brought us here.", "nervous", "jamm", {top = true})
				cutscene:showNametag("Berdly", {top = true})
				cutscene:text("* But you were missing for a decade!", "angry_b", "fberdly", {top = true})
				cutscene:text("* What were you doing all this time!?", "angry", "fberdly", {top = true})
				cutscene:text("* What,[wait:5] did she find you 15 minutes ago or something!?", "angry", "fberdly", {top = true})
				cutscene:showNametag("Jamm", {top = true})
				cutscene:text("* Hey,[wait:5] 15 minutes ago,[wait:5] we were 10 years in the past.", "stern", "jamm", {top = true})
				cutscene:showNametag("Berdly", {top = true})
				cutscene:text("* That doesn't even make any sense!", "angry_sweat", "fberdly", {top = true})
				
				if Game:getFlag("future_variable") == "ceroba_dw" then
					cutscene:showNametag("Ceroba", {top = true})
					cutscene:text("* We traveled in time against our wills.", "neutral", "ceroba", {top = true})
				end
				
				cutscene:showNametag("Susie", {top = true})
				cutscene:text("* And we can't get back,[wait:5] so...", "annoyed", "susie", {top = true})
			else
				cutscene:showNametag("Susie", {top = true})
				cutscene:text("* ...We...[wait:10] walked here???", "nervous", "susie", {top = true})
				cutscene:showNametag("Berdly", {top = true})
				cutscene:text("* But you were missing for a decade!", "surprised", "fberdly", {top = true})
				cutscene:showNametag("Jamm", {top = true})
				cutscene:text("* You weren't exactly here when we weren't missing.", "nervous", "jamm", {top = true})
				cutscene:showNametag("Susie", {top = true})
				cutscene:text("* Yeah,[wait:5] so where were you,[wait:5] then?", "annoyed", "susie", {top = true})
				cutscene:look(fberdly, "down")
				cutscene:showNametag("Berdly", {top = true})
				cutscene:text("* I was trapped...", "sad_b", "fberdly", {top = true})
				cutscene:text("* I was trapped in a poorly-designed video game.", "sad_c", "fberdly", {top = true})
				cutscene:text("* All the terrible enemy designs and bad collision...", "sad", "fberdly", {top = true})
				cutscene:look(fberdly, "right")
				
				if Game:getFlag("future_variable") == "ceroba_dw" then
					cutscene:showNametag("Ceroba", {top = true})
					cutscene:text("* I mean,[wait:5] I don't know a lot about electronics,[wait:5] but...", "neutral", "ceroba", {top = true})
					cutscene:text("* ...How did you get out?", "question", "ceroba", {top = true})
				end
				
				cutscene:showNametag("Berdly", {top = true})
				cutscene:text("* A poorly-designed game like that couldn't be free of glitches...", "doubtful", "fberdly", {top = true})
				cutscene:text("* So I spent years studying the game's terrible physics.", "laugh", "fberdly", {top = true})
				cutscene:text("* I eventually found an exploit that gave me infinite strength...", "smirk", "fberdly", {top = true})
				cutscene:text("* And used that strength to defeat the final boss!", "glorious", "fberdly", {top = true})
				cutscene:showNametag("Susie", {top = true})
				cutscene:text("* Right...", "nervous_side", "susie", {top = true})
				cutscene:showNametag("Berdly", {top = true})
				cutscene:text("* Marcy's group was waiting for me when I got out.[react:1]", "surprised", "fberdly", {top = true, reactions={
					{"We just got\nthere...", 352, 61, "neutral", "fmarcy"},
				}})
				cutscene:text("* They thought I could be a valuable asset to the Resistance...[react:1]", "surprised", "fberdly", {top = true, reactions={
					{"We never said\nthat...", 352, 61, "neutral", "fmarcy"},
				}})
				cutscene:text("* And so,[wait:5] I've been putting my brilliant stupidity to good use!", "surprised", "fberdly", {top = true})
				cutscene:look(jamm, "right")
				cutscene:showNametag("Jamm", {top = true})
				cutscene:text("* (...His what now?)", "nervous", "jamm", {top = true})
				cutscene:showNametag("Susie", {top = true})
				cutscene:text("* (Long story.)", "annoyed", "susie", {top = true})
				cutscene:look(jamm, "left")
			end
			cutscene:look(fmarcy, "down")
			cutscene:look(fberdly, "up")
			cutscene:showNametag("Marcy", {top = true})
			cutscene:text("* Berdly,[wait:5] if you don't mind,[wait:5] I have business with them.", "closed", "fmarcy", {top = true})
			cutscene:text("* And don't you have your own assignments to get done?", "neutral", "fmarcy", {top = true})
			cutscene:showNametag("Berdly", {top = true})
			cutscene:text("* Well put,[wait:5] my reaper-wielding rival![react:1]", "laugh", "fberdly", {top = true, reactions={
				{"We're not rivals.", 352, 61, "neutral", "fmarcy"},
			}})
			cutscene:look(fmarcy, "right")
			cutscene:look(fberdly, "right")
			cutscene:text("* It was nice running into you,[wait:5] Susan,[wait:5] but I must be off.", "laugh", "fberdly", {top = true})
			cutscene:text("* I've got a game to complete.[react:1][wait:5][react:2]", "look_up", "fberdly", {top = true, reactions={
				{"...What?", 120, 61, "nervous", "susie"},
				{"Don't ask.", 302, 61, "closed", "fmarcy"},
			}})
			cutscene:hideNametag()
			Game.world.music:fade(0, 1)
			cutscene:wait(cutscene:walkToSpeed(fberdly, 1240, fberdly.y, 10))
			fberdly:remove()
			Game.world.music:play("future_world", 1)
			cutscene:showNametag("Susie", {top = true})
			cutscene:text("* ...Hey,[wait:5] uh...", "neutral", "susie", {top = true})
			cutscene:text("* Did anyone else notice that he looked like he did ten years ago?", "nervous", "susie", {top = true})
			cutscene:showNametag("Marcy", {top = true})
			cutscene:text("* Right...[wait:5] the Collapse affects everyone differently.", "closed", "fmarcy", {top = true})
			cutscene:text("* Some attune to the dark,[wait:5] some start to forget stuff...", "neutral", "fmarcy", {top = true})
			cutscene:text("* In Berdly's case,[wait:5] it halted his aging completely.", "closed", "fmarcy", {top = true})
			cutscene:text("* I guess that helps him out a bit...", "lookright", "fmarcy", {top = true})
			cutscene:look(fmarcy, "left")
			cutscene:text("* Now come.[wait:10]\n* There's something we need to talk about.", "closed", "fmarcy", {top = true})
			cutscene:hideNametag()
			cutscene:walkToSpeed(fmarcy, fmarcy.x - 60, fmarcy.y, 4)
			cutscene:attachFollowers(4)
			cutscene:wait(cutscene:attachCamera(1))
			fmarcy:remove()
		end
    end,
	
	our_graves = function(cutscene, event)
		local jamm = cutscene:getCharacter("jamm")
		local susie = cutscene:getCharacter("susie")
		local variant = cutscene:getCharacter(Game:getFlag("future_variable"))
		
		local fmarcy = cutscene:getCharacter("fmarcy")
		local fnoelle = cutscene:getCharacter("fnoelle")
		local fv = Mod:getVariableFuture(Game.party[3].id)
		local fvariant = cutscene:getCharacter(fv)
		
		cutscene:look(susie, "up")
		
		cutscene:showNametag("Susie")
		cutscene:text("* There they are...", "neutral", "susie")
		cutscene:hideNametag()
			
		cutscene:wait(cutscene:panTo("camto", 1))
		
		cutscene:detachFollowers()
		
		jamm.x = fmarcy.x
		jamm.y = 920
		susie.x = fnoelle.x
		susie.y = 920
		variant.x = fvariant.x
		variant.y = 920
		
		cutscene:look(fmarcy, "down")
		cutscene:look(fnoelle, "down")
		cutscene:look(fvariant, "down")
		
		cutscene:walkToSpeed(jamm, jamm.x, jamm.y - 200, 6)
		cutscene:walkToSpeed(susie, susie.x, susie.y - 200, 6)
		cutscene:wait(cutscene:walkToSpeed(variant, variant.x, variant.y - 200, 6))
		
		cutscene:showNametag("Susie")
		cutscene:text("* Arright,[wait:5] so what did you guys want to talk about?", "neutral", "susie")
        cutscene:showNametag("Noelle")
		cutscene:text("* Well...", "neutral", "noelle")
		cutscene:hideNametag()
		cutscene:wait(cutscene:walkToSpeed(fnoelle, fnoelle.x - 60, fnoelle.y, 2, "down"))
        cutscene:showNametag("Noelle")
		cutscene:text("* We needed you to be aware of this.", "neutral", "noelle")
		cutscene:walkToSpeed(jamm, jamm.x, fmarcy.y + 60, 4)
		cutscene:showNametag("Susie")
		cutscene:text("* ...A gravestone?", "neutral", "susie")
		susie:setAnimation("away_scratch")
		cutscene:text("* Why would we care about somethin' like that?", "neutral", "susie")
		cutscene:hideNametag()
		cutscene:wait(function() return jamm.y == fmarcy.y + 60 end)
		cutscene:walkToSpeed(jamm, jamm.x, fmarcy.y, 4)
		cutscene:walkToSpeed(fmarcy, fmarcy.x - 60, fmarcy.y, 4, "right")
        cutscene:showNametag("Noelle")
		cutscene:text("* You see...", "neutral", "noelle")
		cutscene:hideNametag()
		cutscene:wait(function() return jamm.y == fmarcy.y end)
		cutscene:resetSprite(susie)
		cutscene:showNametag("Jamm", {top = true})
		cutscene:text("* Guys...?", "speechless", "jamm", {top = true})
		cutscene:look(jamm, "right")
		cutscene:text("* You may want to take a look at the graves...", "speechless_smile", "jamm", {top = true})
		cutscene:look(jamm, "up")
		cutscene:hideNametag()
		cutscene:walkToSpeed(variant, variant.x, fvariant.y, 4)
		cutscene:walkToSpeed(fvariant, fvariant.x - 60, fvariant.y, 4, "right")
		cutscene:look(susie, "right")
		cutscene:wait(0.837)
		cutscene:wait(cutscene:walkToSpeed(susie, susie.x, fnoelle.y, 6))
		cutscene:look(fnoelle, "right")
		cutscene:showNametag("Susie", {top = true})
		cutscene:text("* ...Wait a minute...", "neutral_side", "susie", {top = true})
		cutscene:hideNametag()
		susie:setSprite("exasperated_left")
		susie:shake(3)
		Assets.playSound("whip_crack_only")
		cutscene:wait(0.4)
		cutscene:showNametag("Susie", {top = true})
		cutscene:text("* The hell!?[wait:10]\n* These are our names!", "teeth", "susie", {top = true})
		cutscene:look(susie, "left")
		cutscene:resetSprite(susie)
		cutscene:look(fvariant, "left")
		cutscene:look(fnoelle, "left")
		cutscene:look(variant, "left")
		cutscene:look(jamm, "left")
		cutscene:showNametag("Marcy", {top = true})
		cutscene:text("* We knew you three were strong,[wait:5] but...", "neutral", "fmarcy", {top = true})
		cutscene:text("* Thinking you'd win against those creatures was unrealistic.", "neutral", "fmarcy", {top = true})
		cutscene:text("* It was better to accept we'd never see you again.", "closed", "fmarcy", {top = true})
		cutscene:showNametag("Susie", {top = true})
		cutscene:look(susie, "down")
		cutscene:text("* ...", "annoyed_down", "susie", {top = true})
		cutscene:look(fnoelle, "right")
		cutscene:look(jamm, "right")
		cutscene:text("* How'd you do it?", "annoyed_down_smile", "susie", {top = true})
		cutscene:showNametag("Marcy", {top = true})
		cutscene:text("* Well...", "neutral", "fmarcy", {top = true})
		cutscene:hideNametag()
		Game.world.music:fade(0, 1)
		cutscene:wait(cutscene:fadeOut(1))
		Game.sepia_shader = Game.stage:addFX(ShaderFX("sepia", {intensity = 1}))
		Game:setFlag("tempflag", Game.inventory:save())
		Game.inventory:clear()
		cutscene:wait(1)
		cutscene:showNametag("Marcy")
		cutscene:text("* We're almost there!", "neutral", "fmarcy")
		Game:setPartyMembers("fmarcy", "fnoelle", fv)
		
		cutscene:loadMap("flashback/field_1", -40, 800)
		cutscene:wait(cutscene:fadeIn(0.75))
		cutscene:wait(cutscene:walkToSpeed(Game.world.player, 280, 800, 4))
		local fmarcy = cutscene:getCharacter("fmarcy")
		local fnoelle = cutscene:getCharacter("fnoelle")
		local fvariant = cutscene:getCharacter(fv)
		
		if Game:getFlag("future_variable") == "ceroba_dw" then
			cutscene:showNametag("Kanako")
			cutscene:text("* I'm not liking how quiet it is...", "neutral", "fkanako")
		end
        cutscene:showNametag("Noelle")
		cutscene:text("* The place seems pretty untouched too...", "neutral", "noelle")
		cutscene:showNametag("Marcy")
		cutscene:text("* The reports show that the Knight keeps a clean footprint.", "neutral", "fmarcy")
		cutscene:text("* Keep your guards up,[wait:5] you two.", "neutral", "fmarcy")
		Game.party[1]:setArmor(1, "resistance_band")
		Game.party[2]:setArmor(1, "resistance_band")
		Game.party[2]:setArmor(2, "silver_watch")
		Game.party[3]:setArmor(1, "resistance_band")
    end,
	
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
