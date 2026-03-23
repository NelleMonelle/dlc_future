local spell, super = Class(Spell, "coldsnap")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Coldsnap"

    -- Battle description
    self.effect = "Temp-ture\nDamage"
    -- Menu description
    self.description = "Deals varying damage to an enemy the colder the temperature is."

    -- TP cost
    self.cost = 35

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {"ice", "damage"}
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
