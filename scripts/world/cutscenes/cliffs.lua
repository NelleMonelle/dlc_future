return {
    sign1 = function(cutscene, event)
        if not Mod:incoherent(cutscene) then
			cutscene:text("* You have reached the point of no return.")
			cutscene:text("* Pray to any gods you may have.")
		end
    end,
	
    walk1 = function(cutscene, event)
        Game:setFlag("walk1_active", true)
		Game.world:getEvent(13):walkToSpeed("fmarcy_walkto", 8)
    end,
	
    walk2 = function(cutscene, event)
        Game:setFlag("walk2_active", true)
		Game.world:getEvent(7):walkToSpeed("fnoelle_walkto", 8)
    end
}
