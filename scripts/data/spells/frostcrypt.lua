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
    local cost = super.getTPCost(self, chara)
    if chara and chara:checkWeapon("thornring") then
        cost = MathUtils.round(cost / 2)
    elseif chara and chara:checkWeapon("crimsonspire") then
        cost = MathUtils.round(cost / 4)
    end
    return cost
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." cast "..self:getCastName().."!"
end

function spell:onCast(user, target)
    Game.battle.timer:after(1/3, function()
        Game.battle:addChild(FrostcryptController(target.x, target.y-target.height, function()
            local damage = math.floor(user.chara:getStat("magic") * 10)

            target:hurt(damage, user, function() target:freeze() end)
            if target.health > 0 then
                target:flash()
            end

            Game.battle:finishAction()
        end))
    end)
    return false
end

return spell
