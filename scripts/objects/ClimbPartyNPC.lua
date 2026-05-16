local ClimbPartyNPC, super = Class(Character)

function ClimbPartyNPC:init(chara, x, y, id)
    super.init(self, chara, x, y)
	self.facing = "up"
	self.con = 0
	self.forcejump = 0
	self.timer = 0
	self.waiteventid = 0
	self.climbindex = 0
	self.climbspeedmultiplier = 1.3
	self.movevistype = 0
	self.remx = self.x
	self.remy = self.y
	self.climbcon = 0
	self.climbjumping = false
	self.climbspeed = 0
	self.climbmomentum = 0
	self.jumpchargeamount = 0
	self.reachcon = 0
	self.xclimb = 0
	self.yclimb = 0
	self.onrotatingtower = Game.world.map.cyltower and true or false
	self.darkenalpha = 0
	self.tower_x = 0
	self.tile_vis = false
	self.whiteout = nil
	self.blackout = nil
	self.tile_flip = 1
	self.tile_color = COLORS.white
	self.climb_id = id or 0
	self.drawoffsety = 0
end

function ClimbPartyNPC:update()
	if self.con == 0 then
		self:setSprite("climb/climb")
		self.sprite:setFrame(MathUtils.wrap(math.floor(self.climbindex + 1), 1, (self.sprite.frames and #self.sprite.frames or 0) + 1))
		
		if self.reachcon >= 10 then
			self.con = 4
			super.update(self)
			self:handleTowerDrawStuff()
			return
		end
		if self.reachcon > 0 then
			self.con = 3
			super.update(self)
			self:handleTowerDrawStuff()
			return
		end
		if self.waiteventid > 0 then
			super.update(self)
			self:handleTowerDrawStuff()
			return
		end
		self.remx = self.x
		self.remy = self.y
		if self.forcejump > 0 then
			self.con = 2
			self.forcejump = 0
			super.update(self)
			self:handleTowerDrawStuff()
			return
		end
		if self.facing then
			self.con = 1
			self.climbcon = 0
		end
	end
	if self.con == 1 then
		if self.climbcon == 0 then
			self.yclimb = 0
			self.xclimb = 0
			if self.facing == "up" then
				self.yclimb = -40
			elseif self.facing == "left" then
				self.xclimb = -40
			elseif self.facing == "right" then
				self.xclimb = 40
			elseif self.facing == "down" then
				self.yclimb = 40
			end
			if self.climbindex == 0 then
				self.climbindex = 2
			else
				self.climbindex = 0
			end
			self.climbcon = 1
		end
		if self.climbcon == 1 then
			local draw_dust = (not self.onrotatingtower) or self.tile_vis
			if self.timer == 0 and draw_dust then
				local dust_amount = 1
				if self.climbjumping then
					dust_amount = 5
				end
				for i = 0, dust_amount do
					local dust = Sprite("effects/climb_dust_small")
					dust:play(1 / 15, false, function () dust:remove() end)
					dust:setOrigin(0.5, 0)
					dust:setScale(2, 2)
					local dust_x = self.x
					local dust_y = self.y - 17
					if self.onrotatingtower and Game.world.player.state == "CLIMB" then
						dust_x = self.tower_x
					end	
					if self.climbjumping then
						dust_x = dust_x + MathUtils.random(-10, 10)
						dust_y = dust_y + MathUtils.random(-10, 10)
					elseif self.facing == "up" then
						dust_x = dust_x - self.sprite.width + 10 + 10 * self.sprite.frame-1
					elseif self.facing == "down" then
						dust_x = dust_x - self.sprite.width + 20 + 15 * self.sprite.frame-1
					else
						dust_y = dust_y + 10
					end
					dust:setPosition(dust_x, dust_y)
					dust.layer = self.layer - 0.01
					dust.physics.speed_y = -1
					self.world:addChild(dust)
				end
			end
			local newx, newy, climbrate
			if not self.climbjumping then
				if self.climbspeed < self.climbspeedmultiplier then
					self.climbspeed = self.climbspeedmultiplier
				end
				self.timer = self.timer + (self.climbspeed + self.climbmomentum) * DTMULT
				climbrate = 10
				if self.timer >= climbrate then
					timer = climbrate
				end
				newx = MathUtils.lerpEaseInOut(self.remx, self.remx + self.xclimb, self.timer / climbrate, 2)
				newy = MathUtils.lerpEaseInOut(self.remy, self.remy + self.yclimb, self.timer / climbrate, 2)
				self.sprite:setFrame(MathUtils.wrap(math.floor(self.climbindex + 1), 1, (self.sprite.frames and #self.sprite.frames or 0) + 1))
				
				if math.abs(newx - self.remx) > 3 or math.abs(newy - self.remy) > 3 then
					self.sprite:setFrame(MathUtils.wrap(math.floor(self.climbindex + 2), 1, (self.sprite.frames and #self.sprite.frames or 0) + 1))
				end
			else
				self.timer = self.timer + DTMULT
				climbrate = 6 + (self.jumpchargeamount * 2)
				local clipamount = 4
				
				if self.jumpchargeamount >= 2 then
					clipamount = 2
				end
				
				if self.timer >= climbrate then
					timer = climbrate
				end
				if self.timer >= climbrate - clipamount then
					timer = climbrate
				end
				newx = MathUtils.lerpEaseInOut(self.remx, self.remx + self.xclimb, self.timer / climbrate, 1)
				newy = MathUtils.lerpEaseInOut(self.remy, self.remy + self.yclimb, self.timer / climbrate, 1)
				self.drawoffsety = -math.sin((self.timer / climbrate) * math.pi) * (2 * (self.jumpchargeamount - 1))
				if self.facing == "up" or self.facing == "down" then
					self.sprite:setFrame(MathUtils.wrap(math.floor((self.timer / 2) + 1), 1, (self.sprite.frames and #self.sprite.frames or 0) + 1))
					self:setSprite("climb/jump_up")
				elseif self.facing == "right" then
					if self.timer / climbrate > 0.5 then
						self:setSprite("climb/land_right")
					else
						self:setSprite("climb/slip_right")
						self.sprite:setFrame(1)
					end
				elseif self.timer / climbrate > 0.5 then
					self:setSprite("climb/land_left")
				else
					self:setSprite("climb/slip_left")
					self.sprite:setFrame(1)
				end
				local afterimage = Sprite(self.sprite.texture, self.x, self.y) -- for some reason the afterimage object insists on sticking directly to the player so i have to do this (sorry)
				afterimage:setOrigin(0.5, 1)
				afterimage:setScale(2,2)
				afterimage.y = afterimage.y + self.drawoffsety
				afterimage.alpha = 0.2
				afterimage:fadeOutSpeedAndRemove()
				afterimage:setLayer(self.layer - 0.1)
				if self.onrotatingtower then
					afterimage.x = self.tower_x
				end
				Game.world:addChild(afterimage)
			end
			self.x = newx
			self.y = newy
			if self.timer >= climbrate then
				if self.climbjumping then
					self.climbmomentum = self.jumpchargeamount / 2
				end
				self.climbjumping = false
				self.climbcon = 0
				self.jumpchargeamount = 0
				self.x = self.remx + self.xclimb
				self.y = self.remy + self.yclimb
				if self.onrotatingtower and self.x > Game.world.map.cyltower.tower_circumference then
					self.x = self.x - Game.world.map.cyltower.tower_circumference
				end
				if self.onrotatingtower and self.x < 0 then
					self.x = self.x + Game.world.map.cyltower.tower_circumference
				end
				self.con = 0
				self.timer = 0
			end
		end
	end
    super.update(self)
	self:handleTowerDrawStuff()
end

function ClimbPartyNPC:handleTowerDrawStuff()
	if self.onrotatingtower then
		local tower = Game.world.map.cyltower
		local adjustment = -304
		if tower.appearance == 1 then
			adjustment = 356
		end
		local tile_angle = MathUtils.lerp(360, 0, (self.x + 40 + adjustment) / tower.tower_circumference)
		local tile_angle1 = tile_angle + tower.tower_angle
		while tile_angle1 < 0 do
			tile_angle1 = tile_angle1 + 360
		end
		while tile_angle1 > 360 do
			tile_angle1 = tile_angle1 - 360
		end
		
		if tile_angle1 > 350 or tile_angle1 <= 190 then
			self.tile_vis = true
		else
			self.tile_vis = false
		end
		
		local tile_x = MathUtils.lengthDirX(tower.tower_radius, -math.rad(tile_angle1))
		local tile_angle2 = tile_angle1 + tower.tile_angle_difference		
		while tile_angle2 < 0 do
			tile_angle2 = tile_angle2 + 360
		end
		while tile_angle2 > 360 do
			tile_angle2 = tile_angle2 - 360
		end
		
		local tile_xscale = MathUtils.lengthDirX(tower.tower_radius, -math.rad(tile_angle2)) - tile_x	
		local sprite = "climb/climb_zero_degrees"
		if math.abs(tile_xscale) < 30 then
			sprite = "climb/climb_fortyfive_degrees"
		end
		if math.abs(tile_xscale) < 15 then
			sprite = "climb/climb_ninety_degrees"
		end
		
		self.tile_flip = 1		
		if sprite ~= "climb/climb_zero_degrees" and tile_x < 0 then
			self.tile_flip = -1
			tile_x = MathUtils.lengthDirX(tower.tower_radius, -math.rad(tile_angle1 - tower.tile_angle_difference))
		end
		
		local last_frame = self.sprite.frame
		self:setSprite(sprite)
		self.sprite:setFrame(last_frame)
		self.tile_color = ColorUtils.mergeColor(COLORS.white, COLORS.gray, math.abs(tile_x + (tile_xscale / 2)) / 90)
		self.tower_x = tower.tower_x + tile_x
	end
end

function ClimbPartyNPC:preDraw()
	self.lastx, self.lasty = self.x, self.y
	self.lastscalex = self.scale_x
	self.lastcolor = self.color
	if self.onrotatingtower then
		self.x = self.tower_x
		self.y = self.y - 10
		self.scale_x = self.scale_x * self.tile_flip
		self.color = self.tile_color
	end
	super.preDraw(self)
end

function ClimbPartyNPC:draw()
	if self.onrotatingtower and not self.tile_vis then
		return
	end
	love.graphics.push()
	love.graphics.translate(0, self.drawoffsety)
	super.draw(self)
	love.graphics.pop()
end

function ClimbPartyNPC:postDraw()
	super.postDraw(self)
	self.x = self.lastx
	self.y = self.lasty
	self.scale_x = self.lastscalex
	self.color = self.lastcolor
end

return ClimbPartyNPC