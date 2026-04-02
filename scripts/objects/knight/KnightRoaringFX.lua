---The Knight's Roaring animation seen in the intro to their fight.
---Oddly, this object contains calls for the bullet board and code to spawn bullets. 
---Perhaps this was originally an early version of the Knight's final attack?
local KnightRoaringFX, super = Class(Sprite)

function KnightRoaringFX:init(x, y)
    super.init(self, "battle/enemies/knight/attack_ol", x, y)

    self:setSprite("battle/enemies/knight/shift_ol")
    self:stop()
    self.image_index = 1
    self.image_speed = 0

    self:setScale(2)
    self:setOrigin(0.5)
	
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
end

function KnightRoaringFX:update()
    self.gigatimer = self.gigatimer + DTMULT
	
    if self.shudder then
        self.shudder = self.shudder - DTMULT
    end

    local px = self.x + self.width * 0.42
    local py = self.y + self.height * 0.5
	
    if self.whiteout then
        self.whiteout_counter = MathUtils.approach(self.whiteout_counter, 1, 0.020833333333333332*DTMULT)

        if self.state ~= "roaring" then
        end
    end
	
    if self.state == "intro" then
        self.timer = self.timer + DTMULT

        if self.timer == 16 then
            
        end
		
        if self.timer == 24 then
            self.whiteout = true
            Assets.playSound("knight/stretch", 1, 0.75)
        end
		
        if self.timer == 8 or self.timer == 32 then
            self.shudder = 999
        end
        if self.timer == 64 then
            self.state = "roaring"
            self.timer = -20
        end
    end
	
    if self.state == "roaring" then
        self.timer = self.timer + DTMULT
		
        if self.timer == 16 and self.attack_speed == 0 then
            self.bar = 24
        end

        if (self.timer % 3) == 0 and self.attack_speed > 0 then
        end
		
        if (self.timer == (24 - self.attack_speed)) then
            if self.attack_speed == 0 then
                self:setSprite("battle/enemies/knight/pose_ol")
                self.image_index = 1
                self.image_speed = 0.5
                Assets.playSound("knight/roar")
                self.whiteout = false
            else
                Assets.playSound("knight/puff", 1, 0.15)
            end
			
            if self.createbullets == true then
            end
		end
		
        if (self.timer == (28 - self.attack_speed)) then
            if self.createbullets == true then
            end

            self.spin = self.spin * -DTMULT
            self.counter = self.counter + DTMULT
            self.attack_speed = MathUtils.approach(self.attack_speed, 14, DTMULT)

            if ((self.counter % 3) == 0) then
                self.density = MathUtils.approach(self.density, 6, DTMULT)
            end

            if self.counter < 30 then
                self.timer = 0
            end
        end
		
        self.roarendtimer = self.roarendtimer + DTMULT
        if self.roarendtimer >= self.roarendtimermax then
            self:remove()
        end
    end

    self.image_index = self.image_index + self.image_speed * DTMULT
    self:setFrame(1 + math.floor(self.image_index))

    if self:isSprite("battle/enemies/knight/pose_ol_1") or self:isSprite("battle/enemies/knight/pose_ol_2") then
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

    local px, py = self:getRelativePos(self.width * 0.52, self.height * 0.5)

    
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