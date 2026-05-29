local CastleTownNight, super = Class(Event)

function CastleTownNight:init(data, ...)
    super.init(self, data, ...)
    local properties = data and data.properties or {}
end

function CastleTownNight:postLoad()
    super.postLoad(self)
    self:setLayer(-10000)
    self.done = true
    self.inside = self.world.map.data.properties["inside"]
    if (not self.inside) then
		self.overlay = CastleTownNightOverlay(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		self.overlay.alpha = 0.5
		self.overlay:setLayer(WORLD_LAYERS["below_ui"])
		self.overlay:setParallax(0)
		Game.world:addChild(self.overlay)
		self.callback = Callback{
			draw = function ()
				love.graphics.setShader()
			end
		}
		self.callback:setLayer(WORLD_LAYERS["above_events"])
		Game.world:addChild(self.callback)
    end
end

function CastleTownNight:onRemove(parent)
    if self.overlay then
        self.overlay:remove()
    end
    if self.callback then
        self.callback:remove()
    end
end

return CastleTownNight