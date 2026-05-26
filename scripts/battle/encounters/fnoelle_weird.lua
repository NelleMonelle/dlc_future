local Noelle_Battle, super = Class(Encounter)

function Noelle_Battle:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The plot twist of the decade."

    self.turns = -1

    -- Battle music ("battle" is rude buster)
    self.music = "snowgrave"
    -- Enables the purple grid battle background
    self.background = false

    self.spell_cast = ""
    self.susie_dead = false

    -- Add the dummy enemy to the encounter
    self.noelle = self:addEnemy("fnoelle_weird", 550, 228)

    self.enemy_tension_bar_on_start = true
end

function Noelle_Battle:onBattleStart(battler)
    for _, battler in ipairs(Game.battle.party) do
        Game.battle:registerXAction(battler.chara.id, "Pull")
    end
end

return Noelle_Battle