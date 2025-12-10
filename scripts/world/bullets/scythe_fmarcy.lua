local ScytheBullet, super = Class(WorldBullet)

function ScytheBullet:init(x, y)
    super.init(self, x, y, "bullets/world/scythe_fmarcy")

    self.damage = 30

    self.state = "APPEAR"
	
	self.sprite.alpha = 0
	
	Assets.playSound("spearappear")
	
	self.afterimagetimer = 0
end

function ScytheBullet:update()
    if self.state == "APPEAR" then
		self.x = Game.world.soul.x + 280
		self.sprite.alpha = self.sprite.alpha + DT
		if self.sprite.alpha >= 1 then
			self.state = "ATTACK"
		end
	else
		self.x = self.x - (30 * DTMULT)
		self.rotation = self.rotation - DTMULT
		self.afterimagetimer = self.afterimagetimer + DT
		
		if self.afterimagetimer > 0.05 then
			self.afterimagetimer = self.afterimagetimer - 0.05
			local ae = Game.stage:addChild(AfterImage(self.sprite, 0.5))
			ae:setLayer(Game.world.layer + 1)
		end
	end
end

function ScytheBullet:onDamage(soul)
    local all_at_one = true
	for k,v in pairs(Game.party) do
		if v.health ~= 1 then
			all_at_one = false
			break
		end
	end
	
	soul.inv_timer = self.inv_timer
	
	if all_at_one then
		Game:gameOver(self.world.soul:getScreenPos())
	else
		local possible_party_members = {}
		
		for k,v in pairs(Game.party) do
			if v.health ~= 1 then
				table.insert(possible_party_members, v)
			end
		end
		
		local party = TableUtils.pick(possible_party_members)
		
		if party:checkArmor("resistance_band") then
			local value = math.min(30, party.health-1)
			
			if party == Game.party[1] then
				Game.world.player:statusMessage("damage", value)
			end
			
			party.health = party.health - value
			
			Assets.playSound("hurt")

			Game.world:shakeCamera()
			Game.world:showHealthBars()
		else
			if party == Game.party[1] then
				Game.world.player:statusMessage("damage", party.health - 1)
			end
			
			party.health = 1
			
			Assets.playSound("hurt")

			Game.world:shakeCamera()
			Game.world:showHealthBars()
		end
	end
end

return ScytheBullet