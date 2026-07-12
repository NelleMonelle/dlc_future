---@class Bullet : Bullet
local Bullet, super = HookSystem.hookScript(Bullet)

function Bullet:getInvulnFrames()
    -- Snow Veil
    if Game.battle.inv_bonus then
        return super.getInvulnFrames(self) + 30 -- 30 frames - 1 second
    end
    return super.getInvulnFrames(self)
end

function Bullet:onDamage(soul)
	if not (self.attacker and self.attacker.holding_back) then return super.onDamage(self, soul) end
    local target = Game.battle:randomTargetOld()
    local a  = (target.chara.health) / 250
    if a < 0 then a = 0 end
    local damage = MathUtils.lerp(12, 90, a)
    local battlers = Game.battle:hurt(damage, false, target, self:shouldSwoon(damage, target, soul))
    local inv_frames = self:getInvulnFrames()
    if target ~= "ALL" then
        inv_frames = Game:applyInvulnBonuses(inv_frames)
    end
    Game:setInvulnFrames(inv_frames)
    soul:onDamage(self, damage)
	if Game.battle.enemy_v_slash then
		Game.battle.enemies[1]:heal(self:getDamage()/2)
	end
	if Game.battle.enemy_ultra_break then
		Game.battle.party[1]:inflictStatus("break")
	end
    return battlers
end

return Bullet