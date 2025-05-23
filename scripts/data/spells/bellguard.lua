local spell, super = Class(Spell, "bellguard")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "BellGuard"

    -- Battle description
    self.effect = "Raise\nShield"
    -- Menu description
    self.description = "Raises three temporary bell shields to\nprotect the SOUL."
    -- Check description
    self.check = "Raises three temporary bell shields to protect the SOUL."

    -- TP cost
    self.cost = 85

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "none"

    -- Tags that apply to this spell
    self.tags = {}
end

function spell:getCastMessage(user, target)
    if self:getBellCount() > 0 then
        return "* But the SOUL was already protected."
    else
        return "* "..user.chara:getName().." protected the SOUL!"
    end
end

function spell:onCast(user, target)
	if self:getBellCount() > 0 then
        Game:giveTension(self.cost)
    else
        Game.battle.party[1].bells = {2, 2, 2}
    end
end

function spell:getBellCount()
	if Game.battle.party[1].bells then
		local returnval = 0
		for k,v in ipairs(Game.battle.party[1].bells) do
			if v ~= 0 then
				returnval = returnval + 1
			end
		end
		return returnval
	else
		Game.battle.party[1].bells = {0, 0, 0}
		return 0
	end
end

return spell
