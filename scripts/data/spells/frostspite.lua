local spell, super = Class(Spell, "frostspite")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Frostspite"

    -- Battle description
    self.effect = "Last DMG To\nStrength"
    -- Menu description
    self.description = "A spell that converts damage taken last turn and strengthens next attack/spell."

    -- TP cost
    self.cost = 30

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "none"

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
