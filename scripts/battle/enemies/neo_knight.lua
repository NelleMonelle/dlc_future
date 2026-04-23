local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Hadrian"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 50000
    self.health = 50000
    -- Enemy attack (determines bullet damage)
    self.attack = 20
    -- Enemy defense (usually 0)
    self.defense = 17
    -- Enemy reward
    self.money = 100
	
	self.disable_mercy = true

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The smell of sulfur stains the air.",
        "* You feel as if Hadrian's sword is staring into your SOUL.",
        "* Hadrian seems to be trying to find an opening.",
    }
end

function Dummy:getEncounterText()
    if self.just_weakened then
		self.just_weakened = false
		self.defense = 0
		return "* Hadrian's DEFENSE suddenly dropped to zero!\n* Hadrian's ATTACK drops heavily!"	-- quite literally lol
	end

    return super.getEncounterText(self)
end

function Dummy:onAct(battler, name)
    if name == "Standard" then
        return "* But "..battler.chara:getName().." didn't know what to do."
	end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Dummy:getCheckText(battler)
	if self.defense == 0 then
		return {
			"* NEO KNIGHT - AT 20 DF 0\n* A misguided hero trying to \"fix\" the world.",
			"* His Duskreaver is out of power.[wait:10]\n* Still,[wait:5] stay alert...!"
		}
	end
    return {
		"* NEO KNIGHT - AT 200 DF 17\n* A misguided hero trying to \"fix\" the world.",
		"* Beware the cuts made by his blade,[wait:5] Duskreaver."
	}
end

return Dummy