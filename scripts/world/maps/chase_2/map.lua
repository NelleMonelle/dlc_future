local DeadMap, super = Class(Map)

function DeadMap:onEnter()
    super.onEnter(self)
    if Game.world.followers[2] then
		Game.world.followers[2]:remove()
	end
    if Game.world.followers[1] then
		Game.world.followers[1]:remove()
	end
	if self:getEvent(13) then
		self:getEvent(13).sprite.color = {0,0,0}
	end
	
	local function createParticle(x, y)
        local sprite = Sprite("effects/icespell/snowflake", x, y)
        sprite:setOrigin(0.5, 0.5)
        sprite:setScale(1.5)
        sprite.layer = WORLD_LAYERS["above_events"]
		Game.world:addChild(sprite)
        return sprite
    end
	
	self.timer:every(0.9, function()
        if self.world:inBattle() and not Game:getFlag("chase_checkpoint_2") then
            local marker1 = self.markers["damage_left"]
            local marker2 = self.markers["damage_right"]
			
			local x1 = marker1.center_x
			local x2 = marker2.center_x
			local y1 = MathUtils.random(marker1.y, marker1.y+marker1.height)
			local y2 = MathUtils.random(marker2.y, marker2.y+marker2.height)
			
			particles = {}
			Assets.playSound("icespell")
			particles[1] = createParticle(x1-25, y1-20)
			particles[2] = createParticle(x2-25, y2-20)
			Game.world.timer:after(3/30, function()
				particles[3] = createParticle(x1+25, y1-20)
				particles[4] = createParticle(x2+25, y2-20)
				Game.world.timer:after(3/30, function()
					particles[5] = createParticle(x1, y1+20)
					particles[6] = createParticle(x2, y2+20)
					Game.world.timer:after(3/30, function()
						Game.world:addChild(IceSpellBurst(x1, y1))
						Game.world:addChild(IceSpellBurst(x2, y2))
						for _,particle in ipairs(particles) do
							for i = 0, 5 do
								local effect = IceSpellEffect(particle.x, particle.y)
								effect:setScale(0.75)
								effect.physics.direction = math.rad(60 * i)
								effect.physics.speed = 8
								effect.physics.friction = 0.2
								effect.layer = WORLD_LAYERS["above_events"] - 1
								Game.world:addChild(effect)
							end
						end
						for i = 0, 7 do
							Game.world:spawnBullet("snowflake", x1, y1, math.rad(45*i))
							Game.world:spawnBullet("snowflake", x2, y2, math.rad(45*i))
						end
						Game.world.timer:after(1/30, function()
							for _,particle in ipairs(particles) do
								particle:remove()
							end
						end)
					end)
				end)
			end)
			
            -- self.world:spawnBullet("testbullet", marker1.center_x, MathUtils.random(marker1.y, marker1.y+marker1.height), false)
            -- self.world:spawnBullet("testbullet", marker2.center_x, MathUtils.random(marker2.y, marker2.y+marker2.height), true)
        end
    end)
end

return DeadMap