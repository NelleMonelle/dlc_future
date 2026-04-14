---@class Battle : Battle
local Encounter, super = HookSystem.hookScript(Encounter)

function Encounter:isAutoHealingEnabled(battler)
	if battler.criticond then
		return false
	end
    return super.isAutoHealingEnabled(self, battler)
end

return Encounter