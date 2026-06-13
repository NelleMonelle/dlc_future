local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Shadow Beast"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 40000
    self.health = 40000
    -- Enemy attack (determines bullet damage)
    self.attack = 20
    -- Enemy defense (usually 0)
    self.defense = 17
    -- Enemy reward
    self.money = 100
	
	self.disable_mercy = true

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0
	self.service_mercy = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Since when were you afraid of your own shadow?",
		"* Hadrian looks like he's in extreme pain.",
		"* You can't even tell if he's conscious anymore."
    }
	
	self.weakened = false
end

function Dummy:onAct(battler, name)
    if name == "Unleash" then
		return "* Unleash X-ACT WIP"
    elseif name == "Snow Veil" then
		return "* Snow Veil X-ACT WIP"
    elseif name == "Guardian Angel" then
		return "* Guardian Angel X-ACT WIP"
    elseif name == "ReviveSusie" then
		return "* ReviveSusie X-ACT WIP"
	elseif name == "Brighten" then
        for _,party in ipairs(Game.battle.party) do
            party:flash()
        end
        Assets.playSound("boost")
        local bx, by = Game.battle:getSoulLocation()
		Game.battle.encounter.light_radius = 63
        return "* " .. battler.chara.name .. " powered up Susie!\n* Susie's SOUL shone brighter!"
	end
	
	return super.onAct(self, battler, name)
end

function Dummy:getCheckText(battler)
	return {
		"* SHADOW BEAST - AT ?? DF ??\n* The culmination of your adventure.",
		"* Hadrian's SOUL, split apart by the dark power of the Duskreaver...",
		"* Weaken it with the LIGHT, then attack with all of your will!"
	}
end

function Dummy:hurt(amount, battler, on_defeat, color, show_status, attacked)
	Game.battle.enemies[2]:hurt(amount, battler, on_defeat, color, show_status, attacked)
end

return Dummy