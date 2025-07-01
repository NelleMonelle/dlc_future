local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Creature α"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("slitherer")

    -- Enemy health
    self.max_health = 3500
    self.health = 3500
    -- Enemy attack (determines bullet damage)
    self.attack = 16
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0
    self.service_mercy = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "rudinn/diamonds_aim",
        "rudinn/diamonds_up_lots",
        "rudinn/diamonds_vert_lots",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {}

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {"AT 16 DF 0\n* You don't know what to make of it.", "The more time passes,[wait:5] the more you feel it stare into your SOUL."}

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Something foams at Creature α's... Mouth?",
        "* Creature α stares straight into your SOUL.",
        "* Smells like void.",
    }
	
	self.tired_percentage = 0
    self.low_health_percentage = 0
	
	self.disable_mercy = true
end

function Dummy:onAct(battler, name)
    if name == "Standard" then
        return "* But "..battler.chara:getName().." didn't know what to do."
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Dummy:update()
	super.update(self)
	
	if Game.battle.soul then
		self.sprite.eye.target = Game.battle.soul
	else
		self.sprite.eye.target = Game.battle.party[1]
	end
end

function Dummy:getSpareText(battler, success)
    return "* But,[wait:20] it was not something that\ncan understand MERCY."
end

return Dummy