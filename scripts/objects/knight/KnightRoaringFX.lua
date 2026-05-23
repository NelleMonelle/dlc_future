---The Knight's Roaring animation seen in the intro to their fight.
---Oddly, this object contains calls for the bullet board and code to spawn bullets. 
---Perhaps this was originally an early version of the Knight's final attack?
local KnightRoaringFX, super = Class(Sprite)

function KnightRoaringFX:init(x, y)
    super.init(self, "enemies/knight/attack_ol", x, y)
	
    self:setSprite("enemies/knight/shift_ol")
    self:stop()
    self.image_index = 1
    self.image_speed = 0

    self:setScale(2)
	self:setOrigin(0.5, 1)
	
    self.state = "intro"
    self.timer = 0
    self.gigatimer = 0
    self.spin = TableUtils.pick{1, -1}
    self.random_aim = 0
    self.attack_speed = 0
    self.counter = 0

    self.whiteout = false
    self.whiteout_counter = 0
    self.shudder = 0
    self.bar = 0
    self.density = 12
    self.createbullets = false

    self.roarendtimer = 0
    self.roarendtimermax = 190

    self.highlight = self:addFX(ColorMaskFX())
    self.highlight:setColor(1, 1, 1)
    self.highlight.amount = 0
	self.intro_con = 0
	self.attack_con = -1
end

function KnightRoaringFX:update()
    self.gigatimer = self.gigatimer + DTMULT
	
    if self.shudder then
        self.shudder = self.shudder - DTMULT
    end

    local px, py = self:getRelativePos(self.width * 0.42, self.height * 0.5)
	
    if self.whiteout then
        self.whiteout_counter = MathUtils.approach(self.whiteout_counter, 1, 0.020833333333333332*DTMULT)

        if self.state ~= "roaring" then
			for i = 0, 2 + MathUtils.randomInt(2) do
				local randdir = MathUtils.randomInt(360)
				local dist = 40 + MathUtils.randomInt(240)
				local randsize = 0.25 + MathUtils.random(0.75)
				
				local particle = KnightParticleGeneric(px + MathUtils.lengthDirX(dist, -math.rad(randdir)), py + MathUtils.lengthDirY(dist, -math.rad(randdir)))
				particle.scale_x = randsize
				particle.scale_y = randsize
				particle.physics.direction = MathUtils.angle(particle.x, particle.y, px, py)
				particle.rotation = particle.physics.direction
				Game.stage.timer:lerpVar(particle.physics, "speed", 4, 16 + MathUtils.randomInt(8), 32, 1, "in")
				Game.stage.timer:lerpVar(particle, "scale_x", particle.scale_x, particle.scale_x * 16, 32, 1, "in")
				Game.stage.timer:lerpVar(particle, "scale_y", particle.scale_y, particle.scale_y * 0.6, 32, 1, "in")
				particle:setLayer(self.layer + 0.01)
				if Game.state == "BATTLE" then
					Game.battle:addChild(particle)
				else
					Game.world:addChild(particle)
				end
			end
        end
		
		for _, particle in ipairs(Game.stage:getObjects(KnightParticleGeneric)) do
			if MathUtils.dist(particle.x, particle.y, px, py) <= 32 then
				particle:remove()
			end
		end		
    end
	
    if self.state == "intro" then
        self.timer = self.timer + DTMULT

        if self.timer >= 16 and self.intro_con == 1 then
			-- WHY DO I NEED TO DO THIS???
			local _, pyy = self:getRelativePos(self.width * 0.42, 0)
			self.knightcrushfx = KnightCrush(px, pyy)
			self.knightcrushfx:setLayer(self.layer + 0.02)
            if Game.state == "BATTLE" then
				Game.battle:addChild(self.knightcrushfx)
			else
				Game.world:addChild(self.knightcrushfx)
			end
			self.intro_con = 2
        end
		
        if self.timer >= 24 and self.intro_con == 2 then
            self.whiteout = true
            Assets.playSound("knight_stretch", 1, 0.75)
			self.intro_con = 3
        end
		
        if (self.timer >= 8 and self.intro_con == 0) or (self.timer >= 32 and self.intro_con == 3) then
            self.shudder = 999
			self.intro_con = self.intro_con + 1
        end
        if self.timer >= 64 and self.intro_con == 4 then
            self.state = "roaring"
            self.timer = -20
			self.intro_con = 5
        end
    end
	
    if self.state == "roaring" then
        self.timer = self.timer + DTMULT
		
		if self.timer >= 0 and self.attack_con == -1 then
			if Game.sepia_shader and Game.sepia_shader.active then
				Game.world:addChild(FakeSepiaManager())
			end
			self.attack_con = 0
		end
        if self.timer >= 16 and self.attack_speed == 0 and self.attack_con == 0 then
            self.bar = 24
			self.attack_con = 1
        end

        if (self.timer % 3) == 0 and self.attack_speed > 0 then
			local pxx, pyy = self:getRelativePos(0, 0)
			local afterimage = SpriteAfterImage(self.texture, pxx, pyy)
			afterimage:fadeOutSpeedAndRemove(0.1)
			afterimage:setScale(2)
			afterimage:setOrigin(0, 0)
			afterimage.graphics.grow_x = 0.2
			afterimage.graphics.grow_y = 0.2
			afterimage:setLayer(self.layer - 0.02)
			if Game.state == "BATTLE" then
				Game.battle:addChild(afterimage)
			else
				Game.world:addChild(afterimage)
			end
			
			local screenafterimage = AfterImageScreen(px + MathUtils.randomInt(-30, 30), py + MathUtils.random(-30, 30), 0.5, 0.05)
			screenafterimage.graphics.grow_x = 0.01
			screenafterimage.graphics.grow_y = 0.01
			screenafterimage.draw_end = true
			if Game.state == "BATTLE" then
				Game.battle:addChild(screenafterimage)
			else
				screenafterimage:setLayer(WORLD_LAYERS["top"])
				Game.world:addChild(screenafterimage)
			end
		end
		
        if (self.timer >= (24 - self.attack_speed)) and self.attack_con == 1 then
            if self.attack_speed == 0 then
                self:setSprite("enemies/knight/pose_ol")
                self.image_index = 1
                self.image_speed = 0.5
                Assets.playSound("knightroar")
                self.whiteout = false
				
				for _, particle in ipairs(Game.stage:getObjects(KnightParticleGeneric)) do
					particle:remove()
				end
				
				for i = 0, 8 do
					local screenafterimage = AfterImageScreen(px + MathUtils.randomInt(-30, 30), py + MathUtils.random(-30, 30), 0.5, 0.00625)
					screenafterimage.graphics.grow_x = 0.01
					screenafterimage.graphics.grow_y = 0.01
					screenafterimage.draw_end = true
					if Game.state == "BATTLE" then
						Game.battle:addChild(screenafterimage)
					else
						screenafterimage:setLayer(WORLD_LAYERS["top"])
						Game.world:addChild(screenafterimage)
					end
				end
				local circle = KnightCircle(px, py)
				circle.r = 255
				circle.g = 255
				circle.b = 255
				circle.draw_in_box = false
				circle:setLayer(self.layer + 0.01)
				if Game.state == "BATTLE" then
					Game.battle:addChild(circle)
				else
					Game.world:addChild(circle)
				end
            else
                Assets.playSound("knight/puff", 1, 0.15)
            end
			
            if self.createbullets == true then
            end
			self.attack_con = 2
		end
		
        if (self.timer >= (28 - self.attack_speed)) and self.attack_con == 2 then
            if self.createbullets == true then
            end

            self.spin = self.spin * -DTMULT
            self.counter = self.counter + DTMULT
            self.attack_speed = MathUtils.approach(self.attack_speed, 14, DTMULT)

            if ((self.counter % 3) == 0) then
                self.density = MathUtils.approach(self.density, 6, DTMULT)
            end

			self.attack_con = 3
            if self.counter < 30 then
                self.timer = 0
				self.attack_con = 0
            end
        end
		
        self.roarendtimer = self.roarendtimer + DTMULT
        if self.roarendtimer >= self.roarendtimermax then
			if self.knightcrushfx then
				self.knightcrushfx:remove()
			end
			Game.stage.timer:after(0.5, function()
				for _, sepia in ipairs(Game.stage:getObjects(FakeSepiaManager)) do
					sepia:remove()
				end
			end)
            self:remove()
        end
    end

    self.image_index = self.image_index + self.image_speed * DTMULT
    self:setFrame(1 + math.floor(self.image_index))

    if self:isSprite("enemies/knight/pose_ol_1") or self:isSprite("enemies/knight/pose_ol_2") then
        self:removeFX()
        self.x, self.y = self.init_x, self.init_y + (math.sin((Kristal.getTime()*30) * 0.2) * 2)
    else
        local xoff, yoff = 0, 0

        if self.shudder then
            xoff, yoff = MathUtils.randomInt(-1, 1), MathUtils.randomInt(-1, 1)
        end

        self.x, self.y = self.init_x - 20 + xoff, self.init_y + 20 + yoff

        if self.whiteout then
            self.highlight.amount = self.whiteout_counter
        end
    end
	
    super.update(self)
end

function KnightRoaringFX:draw()
    super.draw(self)

    local px, py = self:getRelativePos(self.width * 0.42, 0)
    
    love.graphics.push()
    love.graphics.origin()

    if self.bar > 0 then
        Draw.setColor(COLORS.white)
        love.graphics.setLineWidth(self.bar)
        love.graphics.line(px, py - (self.bar * 40), px, py + (self.bar * 40))
        self.bar = self.bar * (0.65 ^ DTMULT)
		
        if self.bar < 0.5 then
            self.bar = 0
        end
    end

    love.graphics.pop()
end

return KnightRoaringFX