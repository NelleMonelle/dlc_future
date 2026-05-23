---@class AfterImage : Object
---@overload fun(...) : AfterImage
local AfterImageScreen, super = Class(Object)

function AfterImageScreen:init(x, y, fade, speed)
    super.init(self, x, y, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.alpha = fade
    self:fadeOutSpeedAndRemove(speed)
	
	self.anchor_x = self.x - (Game.world.camera.x - SCREEN_WIDTH / 2)
	self.anchor_y = self.y - (Game.world.camera.y - SCREEN_HEIGHT / 2)

	self.draw_end = false
end

function AfterImageScreen:draw()
    super.draw(self)
	local canvas = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
	love.graphics.push()
	love.graphics.origin()
	Draw.drawCanvas(SCREEN_CANVAS)
	love.graphics.pop()
	Draw.popCanvas(true)
	Draw.setColor(1,1,1,self.alpha)
    Draw.draw(canvas, -(self.anchor_x * self.scale_x), -(self.anchor_y * self.scale_y), 0, self.scale_x, self.scale_y)
	if Game.battle and Game.battle.soul and self.draw_end then
		love.graphics.push()
		love.graphics.origin()
		Game.battle.soul:fullDraw()
		love.graphics.pop()
	end
end

return AfterImageScreen