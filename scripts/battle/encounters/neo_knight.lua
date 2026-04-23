local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The NEO KNIGHT approaches."

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("neo_knight")
	
	self.phase = 1
end

function Dummy:onGameOver()
	if self.phase == 1 then
		Game.battle:startCutscene("neo_knight.lol_skill_issue", self)
		return true
	end
end

function Dummy:isAutoHealingEnabled(battler)
    if self.phase == 1 then
		return false
	end
	return true
end

function Dummy:onBattleStart(battler)
	Game.battle:registerXAction("fmarcy", "Check")
end

function Dummy:getDialogueCutscene()
	if self.phase == 1 and Game.battle.enemies[1].health <= 8000 then
		return "neo_knight", "skilled_phase_transition", self
	end
end

return Dummy