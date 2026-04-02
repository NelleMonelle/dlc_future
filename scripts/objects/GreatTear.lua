local GreatTear, super = Class(Object)

function GreatTear:init(x, y)
	super.init(self, x, y)
	
	self.rift = Sprite("world/cutscenes/great_tear")
	self.rift:setOrigin(0.5)
	
	self:addChild(self.rift)
		
	local rift_fx = ShaderFX("unstable", {
		strength = function() return 4 + math.sin(os.time() * 15) * 2 end,
		time = function() return os.time() end
	})
	
	self.rift:addFX(rift_fx)
	
	self.sprite_mask = Sprite("world/cutscenes/great_tear_mask")
	self.sprite_mask:setOrigin(0.5)
	self.sprite_mask.visible = false
	self:addChild(self.sprite_mask)
	
	self.mask = RiftMask(self)
	self:addChild(self.mask)
	
	local static = Sprite("world/cutscenes/static_1")
	static:setOrigin(0.5)
	static.alpha = 0.3
	static:setAnimation({"world/cutscenes/static", 1/15, true})
	static:setScale(0.5)
	static.wrap_texture_x = true
	static.wrap_texture_y = true
	self.mask:addChild(static)
end

return GreatTear