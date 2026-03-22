local Noelle_Battle, super = Class(Encounter)

function Noelle_Battle:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The plot twist of the decade."

    self.turns = -1

    -- Battle music ("battle" is rude buster)
    -- self.music = nil
    -- Enables the purple grid battle background
    self.background = false

    self.spell_cast = ""
    self.susie_dead = false

    -- Add the dummy enemy to the encounter
    self.noelle=self:addEnemy("fnoelle_weird", 550, 228)

    Game.battle:registerXAction("susie", "Pull")
    Game.battle:registerXAction("jamm", "Pull")
    Game.battle:registerXAction(Game.battle.party[3].chara.id, "Pull")
end

return Noelle_Battle