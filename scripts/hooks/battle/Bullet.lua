---@class Bullet : Bullet
local Bullet, super = HookSystem.hookScript(Bullet)

function Bullet:getInvulnTime()
    -- Snow Veil
    if Game.battle.inv_bonus then
        return super.getInvulnTime(self) + 1
    end
    return super.getInvulnTime(self)
end

function Bullet:onDamage(soul)
	if not (self.attacker and self.attacker.holding_back) then return super.onDamage(self, soul) end
    local target = Game.battle:randomTargetOld()
    local a  = (target.chara.health) / 250
    if a < 0 then a = 0 end
    local damage = MathUtils.lerp(12, 90, a)
    local battlers = Game.battle:hurt(damage, false, target, self:shouldSwoon(damage, target, soul))
    soul.inv_timer = self:getInvulnTime()
    soul:onDamage(self, damage)
    return battlers
end

return Bullet