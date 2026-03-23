local spell, super = Class(Spell, "snow_veil")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Snow Veil"

    -- Battle description
    self.effect = "Raise INV\nFrames"
    -- Menu description
    self.description = "Raises INV frames for a few turns."

    -- TP cost
    self.cost = 40

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "party"

    -- Tags that apply to this spell
    self.tags = {}
end

function spell:getBattleDescription()
    if Game.battle.inv_bonus then
        return "Already\nActive"
    end
    return self.effect
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

function spell:isUsable(chara)
    if Game.battle.inv_bonus then
        return false
    end
    return self.usable
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." cast "..self:getCastName().."!\n* Invulnerability increased for 3 turns!"
end

function spell:onCast(user, target)
    Assets.playSound("spellcast", 0.5, 0.7)
	Game.battle.inv_bonus = true
    Game.battle.inv_bonus_turns_left = 3
    for _,battler in ipairs(target) do
        Game.battle:addChild(SnowVeilCloud(battler.x, battler.y - battler.height * 2 - 10))
    end
    Game.battle.timer:script(function(wait)
        wait(1/2)
        Assets.playSound("ghostappear", 1, 1.3)
        wait(1/5)
        Assets.playSound("ghostappear", 1, 1.3)
        wait(1/5)
        Assets.playSound("ghostappear", 1, 1.3)
    end)
end

return spell
