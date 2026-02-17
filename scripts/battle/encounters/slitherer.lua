local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Creature α approaches."

    -- Battle music ("battle" is rude buster)
    self.music = "battle_collapse"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("slitherer")

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
end

function Dummy:onBattleStart(battler)
    if Game:getFlag("susie_got_soul_xacts") then
        Game.battle:registerXAction("susie", "SoulShine", "Reveal\nweakspot", 64)
    end
end

return Dummy