local spell, super = Class(Spell, "whiteout")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Whiteout"

    -- Battle description
    self.effect = "Weaken\nEnemies"
    -- Menu description
    self.description = "An AOE ice spell that weakens enemies attacks (for 2-3 turns)."

    -- TP cost
    self.cost = 55

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemies"

    -- Tags that apply to this spell
    self.tags = {"ice"}
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
