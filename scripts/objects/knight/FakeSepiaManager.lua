local FakeSepiaManager, super = Class(Object)

function FakeSepiaManager:init()
    super.init(self, 0, 0)
	self.callback = nil
	self.shader = Assets.getShader("sepia")
	self.intensity = 1
end

function FakeSepiaManager:onAdd(parent)
    super.postLoad(self, parent)
	self:setLayer(-10000)
	if Game.sepia_shader and Game.sepia_shader.active then
		Game.sepia_shader.active = false
	end
	self.callback = Callback{
		draw = function ()
			love.graphics.setShader()
		end
	}
	self.callback:setLayer(WORLD_LAYERS["top"] - 0.1)
    Game.world:addChild(self.callback)
end

function FakeSepiaManager:onRemove(parent)
    super.onRemove(self, parent)
	if self.callback then
		self.callback:remove()
	end
	if Game.sepia_shader and not Game.sepia_shader.active then
		Game.sepia_shader.active = true
	end
end

function FakeSepiaManager:draw()
    super.draw(self)
    if self.shader and not Game.sepia_shader.active then
        love.graphics.setShader(self.shader)
		self.shader:send("intensity", self.intensity)
    end
end

return FakeSepiaManager