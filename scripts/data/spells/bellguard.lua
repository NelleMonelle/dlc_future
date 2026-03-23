local spell, super = Class(Spell, "bellguard")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "BellGuard"
    -- Name displayed when cast (optional)
    self.cast_name = "BELL GUARD"

    -- Battle description
    self.effect = "Bullet\nShields"
    -- Menu description
    self.description = "Raises three temporary bell shields to\nprotect the SOUL from incoming attacks."

    -- TP cost
    self.cost = 85

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "none"

    -- Tags that apply to this spell
    self.tags = {}
end

function spell:getBattleDescription()
    if self:getBellCount() > 0 then
        return "Already\nActive"
    end
    return self.effect
end

function spell:isUsable(chara)
    if self:getBellCount() > 0 then
        return false
    end
    return self.usable
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." cast "..self:getCastName().."!\n* The SOUL is now protected!"
end

function spell:onCast(user, target)
    Assets.playSound("undertale_flash")
	Game.battle.bells = {2, 2, 2}
end

function spell:getBellCount()
	local returnval = 0
	for k,v in ipairs(Game.battle.bells) do
		if v ~= 0 then
			returnval = returnval + 1
		end
	end
	return returnval
end

return spell
