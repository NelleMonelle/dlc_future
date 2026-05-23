local KnightCrush, super = Class(Object)

function KnightCrush:init(x, y)
    super.init(self, x, y, SCREEN_WIDTH, SCREEN_HEIGHT)
		
	self.bullet_flow_tex = Assets.getFrames("effects/knight/bullet_flow")[1]
	self.radius = 960
	self.draw_alpha = 0
	self.hsv = 256
	Game.stage.timer:lerpVar(self, "radius", 960, 160, 24)
	Game.stage.timer:lerpVar(self, "draw_alpha", 0, 0.1, 24)
	Game.stage.timer:lerpVar(self, "hsv", 256, 64, 64, 1, "out")
	Game.stage.timer:after(24/30, function()
		Game.stage.timer:lerpVar(self, "radius", 160, 0, 64, 1, "out")
		Game.stage.timer:lerpVar(self, "draw_alpha", 0.1, 1, 64, 1, "out")
	end)
end

function KnightCrush:draw()
    super.draw(self)
	local modifier = 1
	local cx, cy = Game.world.camera.x - SCREEN_WIDTH / 2, Game.world.camera.y - SCREEN_HEIGHT / 2
	local canvas = Draw.pushCanvas(SCREEN_WIDTH, SCREEN_HEIGHT)
	love.graphics.push()
	love.graphics.origin()
	love.graphics.clear(COLORS.black, 0)
	love.graphics.stencil(function()
        local last_shader = love.graphics.getShader()
        love.graphics.setShader(Kristal.Shaders["Mask"])
		love.graphics.circle("fill", self.x - cx, self.y - cy, self.radius * modifier)
        love.graphics.setShader(last_shader)
	end)
	love.graphics.setStencilTest("greater", 0)
	Draw.setColor(1,1,1,self.draw_alpha)
	Draw.drawWrapped(self.bullet_flow_tex, true, true, (Kristal.getTime() * 30) * 8, 0)
	love.graphics.setStencilTest()
	love.graphics.pop()
	Draw.popCanvas(true)
	love.graphics.push()
	love.graphics.origin()
	local color = ColorUtils.HSVToRGB((self.hsv / 255) % 1, 1, 1)
	love.graphics.setBlendMode("add")
	Draw.setColor(color)
	for i = 0, 4 do
		Draw.draw(canvas, cx, cy, 0, 1, 1)
	end
	Draw.setColor(1,1,1,self.draw_alpha)
	love.graphics.circle("fill", self.x, self.y, self.radius * modifier)
	Draw.setColor(1,1,1,1)	
	love.graphics.setBlendMode("alpha")
	love.graphics.pop()
end

return KnightCrush