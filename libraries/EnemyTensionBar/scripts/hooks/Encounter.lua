local Encounter, super = HookSystem.hookScript(Encounter)

function Encounter:init()
    super.init(self)

    self.enemy_tension_bar_on_start = false
end

return Encounter