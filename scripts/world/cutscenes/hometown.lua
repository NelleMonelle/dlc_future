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
				cutscene:text("* But you were missing for a decade!", "surprised", "fberdly", {top = true})
				cutscene:text("* What were you doing all this time!?", "surprised", "fberdly", {top = true})
				cutscene:text("* What,[wait:5] did she find you 15 minutes ago or something!?", "surprised", "fberdly", {top = true})
				cutscene:showNametag("Jamm", {top = true})
				cutscene:text("* Hey,[wait:5] 15 minutes ago,[wait:5] we were 10 years in the past.", "stern", "jamm", {top = true})
				cutscene:showNametag("Berdly", {top = true})
				cutscene:text("* That doesn't even make any sense!", "surprised", "fberdly", {top = true})
				
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
			cutscene:text("* Well put, my reaper-wielding rival![react:1]", "surprised", "fberdly", {top = true, reactions={
				{"We're not rivals.", 352, 61, "neutral", "fmarcy"},
			}})
			cutscene:look(fmarcy, "right")
			cutscene:look(fberdly, "right")
		end
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
