function Mod:init()
    print("Loaded "..self.info.name.."!")
end

function Mod:postInit(new_file)
    if new_file then
        Game:setFlag("library_love", 1)
        Game:setFlag("library_experience", 0)
        Game:setFlag("library_kills", 0)
    end
end

function Mod:addGlobalEXP(exp)
    Game:setFlag("library_experience", Utils.clamp(Game:getFlag("library_experience", 0) + exp, 0, 99999))

    local max_love = #Kristal.getLibConfig("library_main", "global_xp_requirements")
    local leveled_up = false
    while
        Game:getFlag("library_experience") >= Kristal.callEvent("getGlobalNextLvRequiredEXP")
        and Game:getFlag("library_love", 1) < max_love
    do
        leveled_up = true
        Game:addFlag("library_love", 1)
        for _,party in ipairs(Game.party) do
            party:onLevelUpLVLib(Game:getFlag("library_love"))
        end
    end

    return leveled_up
end

function Mod:getGlobalNextLvRequiredEXP()
    return Kristal.getLibConfig("library_main", "global_xp_requirements")[Game:getFlag("library_love") + 1] or 0
end

function Mod:getGlobalNextLv()
    return Utils.clamp(Kristal.callEvent("getGlobalNextLvRequiredEXP") - Game:getFlag("library_experience"), 0, 99999)
end

function Mod:getVariablePartyMember()	-- Assuming Jamm and Susie are the only other ones in the party
	for _, value in ipairs(Game.party) do
		if value.id ~= "jamm" and value.id ~= "susie" then
			return value:getActor().id
		end
	end
end

function Mod:getVariableFuture(chara)
	local list = {
		ceroba = "fkanako",
		brenda = "fcelestial",
		celestial = "fbrenda",
	}
	return list[chara]
end

function Mod:incoherent(cutscene)
	if not (
		Game:hasPartyMember("fmarcy")
		or Game:hasPartyMember("fnoelle")
		or Game:hasPartyMember("fkanako")
		or Game:hasPartyMember("fbrenda")
	) then	-- Add the other future characters when they get made
		cutscene:text("* (It's written in a language you don't understand.)")
		return true
	end
	return false
end