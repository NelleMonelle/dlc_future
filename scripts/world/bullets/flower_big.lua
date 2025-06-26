local FlowerBigBullet, super = Class(WorldBullet)

function FlowerBigBullet:init(x, y)
    super.init(self, x, y, "bullets/world/flower_big_1")

    self.damage = 30
	
	self:setScale(2)
	
	self.sprite:setAnimation({"bullets/world/flower_big", 1/6, true})
	
	self.remove_offscreen = false
end

function FlowerBigBullet:onDamage(soul)
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

return FlowerBigBullet