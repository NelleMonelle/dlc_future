local RepBar, super = Class(Object)

function RepBar:init(x, y)
    super.init(self, x, y)
	
	self.sprite = Sprite("ui/menu/rep_bar")
	self.sprite:setOrigin(0, 0.5)
	self:addChild(self.sprite)
	
	self.rep_text = Assets.getTexture("ui/menu/rep_text")
	
	self.shown = false
	self.animating_in = false
	self.animation_timer = 0
end

function RepBar:show()
    if not self.shown then
        self:resetPhysics()
        self.x = self.init_x
        self.shown = true
        self.animating_in = true
        self.animation_timer = 0
    end
end

function RepBar:hide()
    if self.shown then
        self.animating_in = false
        self.shown = false
        self.physics.speed_x = -10
        self.physics.friction = -0.4
    end
end

function RepBar:processSlideIn()
    if self.animating_in then
        self.animation_timer = self.animation_timer + DTMULT
        if self.animation_timer > 12 then
            self.animation_timer = 12
            self.animating_in = false
        end

        self.x = Ease.outCubic(self.animation_timer, self.init_x, 25 + 128, 12)
    end
end

function RepBar:update()
    self:processSlideIn()

    super.update(self)
end

function RepBar:draw()
	super.draw(self)
	
	love.graphics.setFont(Assets.getFont("main"))
	
	local reputation = Game:getFlag("future_reputation", 0)
	
	local y = (reputation / 100) * -125 + 2
	
	love.graphics.setLineWidth(3)
	
	Draw.setColor(0, 0, 0)
	love.graphics.line( 6, y, 90, y)
	
	local tx = 38
	local ty = y - 36
	
	for sx = -1, 1 do
		for sy = -1, 1 do
			love.graphics.print(math.abs(reputation) .. "%", tx + (2 * sx), ty + (2 * sy))
		end
	end
	
	Draw.setColor(1, 1, 1)
	if reputation > 0 then
		Draw.setColor(1, 1, 0)
	elseif reputation < 0 then
		Draw.setColor(0.7, 0, 1)
	end
	
	love.graphics.print(math.abs(reputation) .. "%", tx, ty)
	
	Draw.setColor(1, 1, 1)
	
	Draw.draw(self.rep_text, 0, -180)
end

return RepBar