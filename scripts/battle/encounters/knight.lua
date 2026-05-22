local Knight, super = Class(Encounter)

function Knight:init()
    super.init(self)

    -- placeholder (unless you decide to leave it like that idk)
    self.text = "* The Roaring Knight."

    self.music = "knight"
    self.background = false

    self:addEnemy("knight", 540, 280)
end

function Knight:onBattleStart(battler)
    -- feel free to remove or change those if you think they're unfitting
	Game.battle:registerXAction("fmarcy", "Check", "Useless\nanalysis")
    Game.battle:registerXAction("fmarcy", "HoldBreath", "???")
end

function Knight:getPartyPosition(index)
    if index == 1 then
        return 120, 200
    elseif index == 2 then
        return 100, 260
    elseif index == 3 then
        return 80, 320
    else
        return super.getPartyPosition(self, index)
    end
end

return Knight