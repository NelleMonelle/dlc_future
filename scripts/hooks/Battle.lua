---@class Battle : Battle
local Battle, super = HookSystem.hookScript(Battle)

function Battle:init()
    super.init(self)

    -- Bell Guard
    self.bells = {0, 0, 0}
    -- Snow Veil
    self.inv_bonus = false
    self.inv_bonus_turns_left = 0
end

function Battle:nextTurn()
    self.inv_bonus_turns_left = self.inv_bonus_turns_left - 1
    if self.inv_bonus_turns_left <= 0 then
        self.inv_bonus_turns_left = 0
        self.inv_bonus = false
    end
    super.nextTurn(self)
end

return Battle