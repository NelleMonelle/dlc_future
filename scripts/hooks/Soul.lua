local Soul, super = Class(Soul)

function Soul:init(x, y, color)
	super.init(self, x, y, color)
	
	if not Game.battle.party[1].bells then
		Game.battle.party[1].bells = {0, 0, 0}
	end
	
    self.bells = {}
    self.fluffy_timer = 0
	self.radius = 25
	for i=1,3 do
		if Game.battle.party[1].bells[i] > 0 then
			local b = Sprite("spells/fkanako/bell", self.width/2, self.height/2)
			b:setScale(1)
			b.turn_offset = 65*i
			local x = math.cos(self.fluffy_timer-b.turn_offset)*self.radius
			local y = math.sin(self.fluffy_timer-b.turn_offset)*self.radius
			b:setPosition(x - self.width/2, y - self.height / 2)
			if Game.battle.party[1].bells[i] == 2 then
				b.color = {1, 1, 0}
			else
				b.color = {1, 0.5, 0}
			end
			table.insert(self.bells, b)
			b.index = i
			self:addChild(b)

			b.health = Game.battle.party[1].bells[i]
			b.max_health = 2
			b.inv_timer = 0
			b.collider = CircleCollider(b, b.width/2, b.height/2, 5)
			Utils.hook(b, "draw", function(orig, b, ...)
				orig(b, ...)
				if DEBUG_RENDER then
					Draw.setColor(0, 1, 0)
					love.graphics.print(i, b.width/2, b.height/2, math.rad(90))
					b.collider:drawFor(b, 1, 0, 0)
				end
			end)
		end
	end
end

function Soul:update()
	super.update(self)
	
	if not Input.down("cancel") then
		self.fluffy_timer = self.fluffy_timer + DT*2
	end
	
	for i=#self.bells, 1, -1 do
		bell = self.bells[i]
		
		if not bell then goto continue end

		if bell.inv_timer > 0 then
			bell.inv_timer = bell.inv_timer-DTMULT
			print(math.floor(bell.inv_timer * 10), math.floor(bell.inv_timer * 10) % 2, bell.inv_timer)
			if math.floor(bell.inv_timer * 10) % 2 == 0 or Utils.round(bell.inv_timer) == 8 or (math.floor(bell.inv_timer * 10) % 2 == 0 and bell.inv_timer >= 0) then
				bell.visible = false
			else
				bell.visible = true
			end
		elseif not bell.visible then
			bell.visible = true
		end

		local x = math.cos(self.fluffy_timer-bell.turn_offset)*self.radius
		local y = math.sin(self.fluffy_timer-bell.turn_offset)*self.radius
		bell:setPosition(x - self.width/2, y - self.height / 2)

		if bell.health == 2 then
			bell.color = {1, 1, 0}
		else
			bell.color = {1, 0.5, 0}
		end
		
		if bell.health <= 0 then
			bell.inv_timer = -1
			table.remove(self.bells, i)
			Assets.playSound("hurt", 1, 2)
			Assets.playSound("dtrans_flip")

			local x, y = bell:getRelativePosFor(Game.battle)
			bell:setParent(Game.battle)
			bell:setPosition(x, y)
			bell:fadeOutSpeedAndRemove()
		end
		
		for _,bullet in ipairs(Game.stage:getObjects(Bullet)) do
			if bullet:collidesWith(bell) and not bullet.no_affect_bells then
				if bell.inv_timer <= 0 then
					Assets.playSound("hurt")
					bell.health = bell.health-1
					Game.battle.party[1].bells[bell.index] = Game.battle.party[1].bells[bell.index] - 1
					bell.inv_timer = 10
					bullet.no_affect_bells = true
					bullet.damage = 0
					bullet:resetPhysics()
					bullet:fadeOutSpeedAndRemove()
					return
				end
			end
		end
		::continue::
	end
end

return Soul