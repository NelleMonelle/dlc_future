local KnightCircle, super = Class(Object)

function KnightCircle:init(x, y)
    super.init(self, x, y, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.circle_size = 0
	self.r = 128
	self.g = 0
	self.b = 0
	self.r_goal = 0
	self.g_goal = 0
	self.b_goal = 0
	self.fade_time = 28
	self.size_goal = 960
	self.growth = 40
	self.color_1 = 0
	self.color_2 = 255
	self.circle_mesh = self:createCircleMesh()
end

function KnightCircle:createCircleMesh()
	segments = segments or 40
	local vertices = {}
	
	-- The first vertex is at the origin (0, 0) and will be the center of the circle.
	table.insert(vertices, {0, 0, 0, 0, 0, 0, 0})
	
	-- Create the vertices at the edge of the circle.
	for i=0, segments do
		local angle = (i / segments) * math.pi * 2

		-- Unit-circle.
		local x = math.cos(angle)
		local y = math.sin(angle)

		table.insert(vertices, {x, y, 1, 1, 1, 1, 1})
	end
	
	-- The "fan" draw mode is perfect for our circle.
	return love.graphics.newMesh(vertices, "fan")
end

function KnightCircle:update()
    super.draw(self)
	if #Game.stage:getObjects(KnightRoaringFX) == 0 then
		self.alpha = self.alpha - 0.1 * DTMULT
	end
	if self.alpha < 0 then
		self:remove()
	end
	self.g = MathUtils.approach(self.g, self.g_goal, 255 / (self.fade_time * DTMULT))
	self.b = MathUtils.approach(self.b, self.b_goal, 255 / (self.fade_time * DTMULT))	
	self.circle_size = MathUtils.approach(self.circle_size, self.size_goal, self.growth * DTMULT)
	
	if self.r == 0 and self.b == 0 and self.b == 0 then -- lmao
		self:remove()
	end
end

function KnightCircle:draw()
    super.draw(self)
	if self.draw_in_box then
	else
		love.graphics.setBlendMode("add")
		Draw.setColor(self.r/255, self.g/255, self.b/255, 1)
		Draw.draw(self.circle_mesh, 0, 0, 0, self.circle_size, self.circle_size)
		love.graphics.setBlendMode("alpha")
	end
end

return KnightCircle