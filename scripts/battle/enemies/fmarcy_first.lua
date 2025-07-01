local Marcy, super = Class(EnemyBattler)

function Marcy:init()
    super.init(self)

    -- Enemy name
    self.name = "Marcy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("fmarcy")
	self:setAnimation("idle")
	self.sprite.flip_x = true
	self.overlay_sprite.flip_x = true

    -- Enemy health
    self.max_health = math.huge
    self.health = math.huge
    -- Enemy attack (determines bullet damage)
    self.attack = 10
    -- Enemy defense (usually 0)
    self.defense = 4
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0
    self.service_mercy = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "scythe_gravity"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {}
	
	self.boss = true
end

return Marcy