local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "bullets/world/scythe_fmarcy")
	
	self.physics.gravity = 0.5
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
	self.rotation = self.rotation - (DTMULT * 0.2)

    super.update(self)
end

return SmallBullet