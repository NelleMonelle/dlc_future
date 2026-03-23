local spell, super = Class(Spell, "frostcrypt")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Frostcrypt"

    -- Battle description
    self.effect = "ICE-FATAL\nDamage"
    -- Menu description
    self.description = "Devastating single target ice spell. Fatal."

    -- TP cost
    self.cost = 100

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {"ice", "fatal", "damage"}
end

function spell:getTPCost(chara)
    -- remove the line below when the spell is finished (and un-comment stuff below)
    return 500
    --[[local cost = super.getTPCost(self, chara)
    if chara and chara:checkWeapon("thornring") then
        cost = MathUtils.round(cost / 2)
    elseif chara and chara:checkWeapon("crimsonspire") then
        cost = MathUtils.round(cost / 4)
    end
    return cost]]
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." cast "..self:getCastName().."!"
end

function spell:onCast(user, target)
    -- WIP
end

return spell
