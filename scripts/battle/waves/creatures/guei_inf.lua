local Basic, super = Class(Wave)

function Basic:init()
    super.init(self)
	
	self:setArenaPosition(320, (SCREEN_HEIGHT - 155) / 2 + 70)
	self:setArenaSize(130, 130)
	
	self.time = 10
	
	self.infinities = {}
end

function Basic:onStart()
    table.insert(self.infinities, self:spawnBullet("guei/infinifire", 320, 60))
    table.insert(self.infinities, self:spawnBullet("guei/infinifire", 440, 100, false, -1))
    table.insert(self.infinities, self:spawnBullet("guei/infinifire", 200, 100, false, -1))
    table.insert(self.infinities, self:spawnBullet("guei/infinifire", 500, 240, true))
    table.insert(self.infinities, self:spawnBullet("guei/infinifire", 140, 240, true, -1))
	
	self.timer:everyInstant(1/4, function()
		local fire = TableUtils.pick(self.infinities)
		
		local angle = MathUtils.angle(fire.x, fire.y, Game.battle.soul.x, Game.battle.soul.y)
		
        local bullet = self:spawnBullet("guei/holyfire", fire.x, fire.y)
        bullet.physics.speed = 4
        bullet.physics.direction = angle
    end)
end

return Basic