local ScytheBullet, super = Class(WorldBullet)

function ScytheBullet:init(x, y, dir)
    super.init(self, x, y, "bullets/world/snowflake")

    self.damage = 30
	
	self.rotation = dir
	
	-- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = 8
	
	self:setScale(1)
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
		
		local party = Utils.pick(possible_party_members)
		
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