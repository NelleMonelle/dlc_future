---@class RiftMask : Object
local RiftMask, super = Class(Object)

function RiftMask:init(rift)
	super.init(self, 0, 0)

	self.layer = 1
	self.mask = rift.sprite_mask

	self.mask_fx = MaskFX(self.mask)
	self:addFX(self.mask_fx)
	self.mask_fx.active = true
end

function RiftMask:fullDraw(...)
    super.fullDraw(self, ...)
end

return RiftMask