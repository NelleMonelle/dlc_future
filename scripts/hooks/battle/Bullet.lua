---@class Bullet : Bullet
local Bullet, super = HookSystem.hookScript(Bullet)

function Bullet:getInvulnTime()
    -- Snow Veil
    if Game.battle.inv_bonus then
        return super.getInvulnTime(self) + 1
    end
    return super.getInvulnTime(self)
end

return Bullet