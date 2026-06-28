local SmokeBar, super = Class(Object)

function SmokeBar:init()
    super.init(self, 0, -100, SCREEN_WIDTH, SCREEN_HEIGHT)
	
	self.font = Assets.getFont("main")
	
	self.hid = true
end

function SmokeBar:draw()
	super.draw(self)
	love.graphics.setFont(self.font)
	local str = "Smoke: " .. math.floor(Game.battle.encounter.smoke) .. "%"
	local x = 220
	local y = 0
	local siner = 1
	if Game.battle.encounter.smoke > 80 then
		siner = math.abs(math.cos(Game.battle.encounter.smoke*math.pi))
	end
	Draw.setColor(1, siner, siner, 1)
	love.graphics.printf(str, x-2, y+24, 200, "center")
	love.graphics.printf(str, x+2, y+24, 200, "center")
	love.graphics.printf(str, x-2, y+20, 200, "center")
	love.graphics.printf(str, x+2, y+20, 200, "center")
	love.graphics.printf(str, x,   y+24, 200, "center")
	love.graphics.printf(str, x+2, y+22, 200, "center")
	love.graphics.printf(str, x,   y+20, 200, "center")
	love.graphics.printf(str, x-2, y+22, 200, "center")
	Draw.setColor(0, 0, 0, 1)
	love.graphics.printf(str, x, y+22, 200, "center")
	Draw.setColor(1, siner, siner, 1)
	love.graphics.rectangle("fill", x, y, 200, 20)
	Draw.setColor(0, 0, 0, 1)
	love.graphics.rectangle("fill", x+2, y + 2, 196, 16)
	Draw.setColor(1, siner, siner, 1)
	love.graphics.rectangle("fill", x+(Game.battle.encounter.smoke*1.98), y + 2, 2, 16)
end

function SmokeBar:hide()
	if not self.hid then
		self.hid = true
		Game.world.stage.timer:tween(0.25, self, {y = -50}, "out-sine")
	end
end

function SmokeBar:show()
	if self.hid then
		self.hid = false
		Game.world.stage.timer:tween(0.25, self, {y = 10}, "out-sine")
	end
end

return SmokeBar
