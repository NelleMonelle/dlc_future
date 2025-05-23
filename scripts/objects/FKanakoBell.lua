local BellBullet, super = Class(Bullet)

function BellBullet:init(dir, health, inc)
    -- Last argument = sprite path
    super.init(self, 5000, 0, "spells/fkanako/bell")
	
	self.rotational = math.rad(dir)
	
	self.tp = 0
	
	self.health = health
	
	self.inc = inc
end

function BellBullet:update()
    super.update(self)
	
	self.rotational = self.rotational + DTMULT / 30
	
	self.sprite.x = math.cos(self.rotational) * 15
	self.sprite.y = math.sin(self.rotational) * 15
	
	for _,bullet in ipairs(Game.stage:getObjects(Bullet)) do
        if bullet.id ~= "fkanako_bell" and bullet:collidesWith(self.collider) then
			bullet:remove()
			self.health = self.health - 1
			if inc then
				Game.battle.party[1].bells[inc] = Game.battle.party[1].bells[inc] - 1
			end
			Assets.playSound("mirrorbreak")
			if self.health == 0 then
				self:remove()
			end
		end
	end
	
	if self.health == 2 then
		self.color = {1, 1, 0}
	else
		self.color = {1, 0.5, 0}
	end
end

function BellBullet:onCollide(soul) end

return BellBullet