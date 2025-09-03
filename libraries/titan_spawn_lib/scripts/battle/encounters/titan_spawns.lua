local TitanSpawns, super = Class(Encounter)

function TitanSpawns:init()
    super.init(self)

    self.text = "* Darkness constricts you...\n* [color:yellow]TP[color:reset] Gain reduced outside of [color:green]???[color:reset]"

    self.music = "titan_spawn"
    self.background = true
    self.reduced_tension = true

    self:addEnemy("titan_spawn") -- need to adjust their positions to be accurate
    self:addEnemy("titan_spawn")

    self.default_xactions = false

    --Game.battle:registerXAction("susie", "WakeKris", "Revive\nKris", 16)
    --Game.battle:registerXAction("ralsei", "ReviveKris", "Revive\nKris", 16)
end

return TitanSpawns