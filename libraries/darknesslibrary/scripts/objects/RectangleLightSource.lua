local Light, super = Class(Object)

function Light:init(x, y, w, h, color)
    super.init(self, x, y, w, h)
    self.color = color or {1,1,1}
    self.alpha = 1
    self.inherit_color = false
    self.style = Kristal.getLibConfig("darkness", "style")
	self.onrotatingtower = false
    -- don't allow debug selecting
    self.debug_select = false
end

function Light:update()
	super.update(self)
	if self.onrotatingtower then
		self.x = Game.world.map.cyltower.tower_x
		self.y = Game.world.player.y
	end
end

return Light