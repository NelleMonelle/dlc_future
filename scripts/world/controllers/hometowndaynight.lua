local HometownDayNight, super = Class(Event)

function HometownDayNight:init(data,...)
    super.init(self,data,...)
    local properties = data and data.properties or {}
    self.palette = properties["palette"] or "world/town_palette"
    self.force_palette = properties["palette"] ~= nil
end

function HometownDayNight:postLoad()
    super.postLoad(self)
    self:setLayer(-10000)
    self.done = true
    self.inside = self.world.map.data.properties["inside"]
    if (not self.inside) then
		self.overlay = HometownNightOverlay(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
		self.overlay.color = ColorUtils.hexToRGB("#00042B")
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
		---@type love.Shader
		if Game.world.map.image_layers["overlay"] then
			Game.world.map.image_layers["overlay"].color = ColorUtils.mergeColor(COLORS["black"], COLORS["navy"], 0.5)
			self.callback:setParent(Game.world.map.image_layers["overlay"])
			Game.world:addChild(Game.world.map.image_layers["overlay"])
		end
    end
-- >>>>>>> 8c94661e (Finally, Church palette.)
end

function HometownDayNight:onRemove(parent)
    if self.overlay then
        self.overlay:remove()
    end
    if self.callback then
        self.callback:remove()
    end
end

return HometownDayNight