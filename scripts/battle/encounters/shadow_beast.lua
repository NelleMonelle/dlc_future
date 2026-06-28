local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Darkness restricts you...\n* [color:yellow]TP[color:reset] Gain reduced outside of [color:green]???[color:reset]"

    -- Battle music ("battle" is rude buster)
    self.music = "final_fake"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self.beast = self:addEnemy("shadow_beast")
    self.victim = self:addEnemy("hadrian_trapped")
	
	self.reduced_tension = true
	self.light_radius = 48
	
	self.phase = 1
	self.smoke = 0
	self.smoke_active = false
end

function Dummy:onBattleStart(battler)
	self.default_xactions = false
	for _,battler in ipairs(Game.battle.party) do
		if battler.chara.id == "susie" then
			Game.battle:registerXAction("susie", "Check", "Useless\nanalysis")
			Game.battle:registerXAction("susie", "Unleash", "", 80)
			Game.battle:registerXAction("susie", "Snow Veil", "Call\nNoelle", 6)
		else
			Game.battle:registerXAction(battler.chara.id, "ReviveSusie", "Revive\nSusie", 16)
			Game.battle:registerXAction(battler.chara.id, "Brighten", "Empower\nlight", 4)
			if battler.chara.id == "ceroba" then
				-- let Kanako assist with one spell
			elseif battler.chara.id == "celestial" then
				Game.battle:registerXAction("celestial", "Guardian Angel", "Call\nBrenda", 10)
			end
		end
	end
	
	self.smoke_bar = Game.battle:addChild(SmokeBar())
end

function Dummy:update()
	if self.smoke_active then
		self.smoke = math.min(self.smoke + DT, 100)
	end
end

function Dummy:onTurnEnd()
    super.onTurnEnd(self)
	self.light_radius = 48
end

function Dummy:createSoul(x, y, color)
    return FlashlightSoul(x, y)
end

return Dummy