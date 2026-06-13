local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Hadrian"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 40000
    self.health = 40000
    -- Enemy attack (determines bullet damage)
    self.attack = 0
    -- Enemy defense (usually 0)
    self.defense = 0
	
	self.disable_mercy = true

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0
	self.service_mercy = 0

    -- No waves for Hadrian; he is not in control
    self.waves = {}

    -- No text for Hadrian; it's handled in the Shadow Beast
    self.text = {}
	
	self.selectable = false
end

function Dummy:getCheckText(battler)
	return {
		"* HADRIAN - AT 20 DF 0\n* Stabbed his own SOUL out of desperation.",
		"* There just might not be a way to save him."
	}
end

return Dummy